#!/usr/bin/env python3
"""Generate a reviewable delta report for the Ethiopia HIV DAK data dictionary.

The workspace does not require Excel-specific Python packages for this report.
XLSX files are zip archives containing XML, so this script uses only the Python
standard library to extract worksheet rows.
"""

from __future__ import annotations

import csv
import argparse
import re
from collections import Counter, defaultdict
from dataclasses import dataclass
from datetime import date
from pathlib import Path
from typing import Dict, Iterable, List, Tuple
from xml.etree import ElementTree as ET
from zipfile import ZipFile


REPO_ROOT = Path(__file__).resolve().parents[1]
ETHIOPIA_WORKBOOK = REPO_ROOT / "input/l2/ET_HIV_DAK_DD_Final version after cleaning.xlsx"
WHO_WORKBOOK = REPO_ROOT / "input/l2/HIV_DAK_2023-Web_Annex_A.Data_dictionary_231117_CLEAN.xlsx"
REPORT_DIR = REPO_ROOT / "reports/ethiopia-dak-delta"

SPREADSHEET_NS = {
    "a": "http://schemas.openxmlformats.org/spreadsheetml/2006/main",
    "r": "http://schemas.openxmlformats.org/officeDocument/2006/relationships",
}
REL_NS = {"rel": "http://schemas.openxmlformats.org/package/2006/relationships"}

FIELDS = [
    "Activity ID",
    "Data Element ID",
    "Data Element Label",
    "Description and Definition",
    "Description and Definition (2)",
    "Multiple Choice Type (if applicable)",
    "Data Type",
    "Input Options",
    "Quantity Sub-type",
    "Calculation",
    "Validation Condition",
    "Required",
    "Explain Conditionality",
    "Linkages to Decision Support Tables",
    "Linkages to Aggregate Indicators",
]

COMPARE_FIELDS = [field for field in FIELDS if field != "Data Element ID"]

KEY_SEMANTIC_FIELDS = {
    "Data Element Label",
    "Multiple Choice Type (if applicable)",
    "Data Type",
    "Input Options",
}

VALIDATION_FIELDS = {
    "Quantity Sub-type",
    "Calculation",
    "Validation Condition",
    "Required",
    "Explain Conditionality",
}

LINKAGE_FIELDS = {
    "Linkages to Decision Support Tables",
    "Linkages to Aggregate Indicators",
}

DATA_ELEMENT_ID_RE = re.compile(r"^HIV(?:\.[A-Za-z]+)+\.DE\d+$")


@dataclass
class DataElement:
    source: str
    sheet: str
    sheet_order: int
    row: int
    values: Dict[str, str]

    @property
    def data_element_id(self) -> str:
        return self.values.get("Data Element ID", "")

    @property
    def label(self) -> str:
        return self.values.get("Data Element Label", "")


@dataclass
class WorkbookData:
    source: str
    path: Path
    sheets: List[str]
    data_elements: Dict[str, DataElement]
    sheet_counts: Counter
    duplicate_headers: Dict[str, Dict[str, List[int]]]
    duplicate_data_element_ids: Dict[str, List[DataElement]]
    rows_without_data_element_id: List[Tuple[str, int, Dict[str, str]]]


def column_number(cell_ref: str) -> int:
    match = re.match(r"([A-Z]+)", cell_ref or "")
    if not match:
        return 0
    number = 0
    for char in match.group(1):
        number = number * 26 + ord(char) - 64
    return number


def clean_text(value: object) -> str:
    if value is None:
        return ""
    return re.sub(r"\s+", " ", str(value)).strip()


def compare_text(value: str) -> str:
    return clean_text(value)


def relative(path: Path) -> str:
    try:
        return str(path.relative_to(REPO_ROOT))
    except ValueError:
        return str(path)


def read_shared_strings(zip_file: ZipFile) -> List[str]:
    try:
        root = ET.fromstring(zip_file.read("xl/sharedStrings.xml"))
    except KeyError:
        return []
    strings = []
    for item in root.findall("a:si", SPREADSHEET_NS):
        strings.append("".join(text.text or "" for text in item.findall(".//a:t", SPREADSHEET_NS)))
    return strings


def read_cell_value(cell: ET.Element, shared_strings: List[str]) -> str:
    cell_type = cell.get("t")
    if cell_type == "inlineStr":
        return clean_text("".join(text.text or "" for text in cell.findall(".//a:t", SPREADSHEET_NS)))

    value_node = cell.find("a:v", SPREADSHEET_NS)
    if value_node is None:
        return ""

    raw_value = value_node.text or ""
    if cell_type == "s":
        if raw_value.isdigit() and int(raw_value) < len(shared_strings):
            return clean_text(shared_strings[int(raw_value)])
        return clean_text(raw_value)
    if cell_type == "b":
        return "TRUE" if raw_value == "1" else "FALSE"
    return clean_text(raw_value)


def iter_sheet_rows(zip_file: ZipFile, sheet_path: str, shared_strings: List[str]) -> Iterable[Tuple[int, Dict[int, str]]]:
    root = ET.fromstring(zip_file.read(sheet_path))
    for row in root.findall(".//a:sheetData/a:row", SPREADSHEET_NS):
        row_number = int(row.get("r", "0"))
        values: Dict[int, str] = {}
        for cell in row.findall("a:c", SPREADSHEET_NS):
            values[column_number(cell.get("r", ""))] = read_cell_value(cell, shared_strings)
        yield row_number, values


def unique_header_names(raw_headers: Dict[int, str]) -> Tuple[Dict[str, List[int]], Dict[str, List[int]]]:
    data_element_columns = [column for column, header in raw_headers.items() if header == "Data Element ID"]
    headers = dict(raw_headers)

    # HIV.C uses a blank first header cell even though the rows contain Activity IDs.
    if 1 not in headers and data_element_columns and min(data_element_columns) == 2:
        headers[1] = "Activity ID"

    counts: Counter = Counter()
    header_map: Dict[str, List[int]] = defaultdict(list)
    duplicate_map: Dict[str, List[int]] = defaultdict(list)

    for column in sorted(headers):
        header = headers[column]
        if not header:
            continue
        counts[header] += 1
        if counts[header] == 1:
            unique_name = header
        else:
            unique_name = f"{header} ({counts[header]})"
            duplicate_map[header].append(column)
        header_map[unique_name].append(column)

    for header, count in counts.items():
        if count > 1:
            duplicate_map[header] = [column for column, value in sorted(headers.items()) if value == header]

    return dict(header_map), dict(duplicate_map)


def row_to_named_values(header_map: Dict[str, List[int]], row_values: Dict[int, str]) -> Dict[str, str]:
    values: Dict[str, str] = {}
    for field in FIELDS:
        field_values = [row_values.get(column, "") for column in header_map.get(field, [])]
        values[field] = " / ".join(dict.fromkeys(value for value in field_values if value))
    return values


def load_workbook_data(path: Path, source: str) -> WorkbookData:
    data_elements_by_id: Dict[str, DataElement] = {}
    all_elements_by_id: Dict[str, List[DataElement]] = defaultdict(list)
    sheets: List[str] = []
    sheet_counts: Counter = Counter()
    duplicate_headers: Dict[str, Dict[str, List[int]]] = {}
    rows_without_id: List[Tuple[str, int, Dict[str, str]]] = []

    with ZipFile(path) as zip_file:
        shared_strings = read_shared_strings(zip_file)
        workbook = ET.fromstring(zip_file.read("xl/workbook.xml"))
        relationships = ET.fromstring(zip_file.read("xl/_rels/workbook.xml.rels"))
        relationship_targets = {
            rel.get("Id"): rel.get("Target")
            for rel in relationships.findall("rel:Relationship", REL_NS)
        }

        for sheet_order, sheet_node in enumerate(workbook.findall("a:sheets/a:sheet", SPREADSHEET_NS), start=1):
            sheet_name = sheet_node.get("name", "")
            sheets.append(sheet_name)
            relationship_id = sheet_node.get(f"{{{SPREADSHEET_NS['r']}}}id")
            target = relationship_targets[relationship_id]
            sheet_path = f"xl/{target}" if not target.startswith("/") else target[1:]
            rows = list(iter_sheet_rows(zip_file, sheet_path, shared_strings))

            header_row_number = None
            header_map: Dict[str, List[int]] = {}
            for row_number, values in rows:
                raw_headers = {column: clean_text(value) for column, value in values.items()}
                if "Data Element ID" in raw_headers.values():
                    header_row_number = row_number
                    header_map, duplicates = unique_header_names(raw_headers)
                    if duplicates:
                        duplicate_headers[sheet_name] = duplicates
                    break

            if header_row_number is None:
                continue

            for row_number, values in rows:
                if row_number <= header_row_number:
                    continue
                named_values = row_to_named_values(header_map, values)
                data_element_id = named_values.get("Data Element ID", "")
                if DATA_ELEMENT_ID_RE.match(data_element_id):
                    element = DataElement(
                        source=source,
                        sheet=sheet_name,
                        sheet_order=sheet_order,
                        row=row_number,
                        values=named_values,
                    )
                    all_elements_by_id[data_element_id].append(element)
                    data_elements_by_id.setdefault(data_element_id, element)
                    sheet_counts[sheet_name] += 1
                elif any(named_values.get(field, "") for field in FIELDS if field != "Data Element ID"):
                    rows_without_id.append((sheet_name, row_number, named_values))

    duplicate_data_element_ids = {
        data_element_id: elements
        for data_element_id, elements in all_elements_by_id.items()
        if len(elements) > 1
    }

    return WorkbookData(
        source=source,
        path=path,
        sheets=sheets,
        data_elements=data_elements_by_id,
        sheet_counts=sheet_counts,
        duplicate_headers=duplicate_headers,
        duplicate_data_element_ids=duplicate_data_element_ids,
        rows_without_data_element_id=rows_without_id,
    )


def sorted_elements(elements: Iterable[DataElement]) -> List[DataElement]:
    return sorted(elements, key=lambda item: (item.sheet_order, item.row, item.data_element_id))


def changed_fields(ethiopia: DataElement, who: DataElement) -> List[str]:
    fields = []
    for field in COMPARE_FIELDS:
        if compare_text(ethiopia.values.get(field, "")) != compare_text(who.values.get(field, "")):
            fields.append(field)
    return fields


def review_priority(change_type: str, fields: List[str]) -> str:
    if change_type in {"Added", "Removed"}:
        return "High"
    if any(field in KEY_SEMANTIC_FIELDS for field in fields):
        return "High"
    if any(field in VALIDATION_FIELDS for field in fields):
        return "Medium"
    if any(field in LINKAGE_FIELDS for field in fields):
        return "Medium"
    return "Low"


def suggested_action(change_type: str, fields: List[str]) -> str:
    if change_type == "Added":
        return "Confirm addition; create or update IG dictionary, concepts, element retrieval, and any needed terminology."
    if change_type == "Removed":
        return "Confirm removal from Ethiopia scope; decide whether the IG should delete, hide, or retain as optional WHO content."
    if any(field in KEY_SEMANTIC_FIELDS for field in fields):
        return "Review semantic compatibility of reused Data Element ID before updating IG artifacts."
    if any(field in VALIDATION_FIELDS for field in fields):
        return "Update validation, requirement, or conditionality rules if confirmed."
    if any(field in LINKAGE_FIELDS for field in fields):
        return "Update decision support and indicator linkages if confirmed."
    return "Update narrative data dictionary content if confirmed."


def write_csv(path: Path, fieldnames: List[str], rows: Iterable[Dict[str, str]]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=fieldnames, extrasaction="ignore")
        writer.writeheader()
        for row in rows:
            writer.writerow({field: row.get(field, "") for field in fieldnames})


def data_element_csv_row(element: DataElement, prefix: str = "") -> Dict[str, str]:
    row = {
        f"{prefix}Source": element.source,
        f"{prefix}Sheet": element.sheet,
        f"{prefix}Row": str(element.row),
    }
    for field in FIELDS:
        row[f"{prefix}{field}"] = element.values.get(field, "")
    return row


def build_quality_observations(ethiopia: WorkbookData) -> List[Dict[str, str]]:
    observations: List[Dict[str, str]] = []

    for sheet, duplicates in ethiopia.duplicate_headers.items():
        for header, columns in duplicates.items():
            observations.append({
                "Category": "Duplicate header",
                "Priority": "Medium",
                "Sheet": sheet,
                "Row": "",
                "Data Element ID": "",
                "Observation": f"Header '{header}' appears in columns {', '.join(map(str, columns))}. The report preserves repeat columns using suffixes such as '(2)'.",
                "Suggested review": "Confirm both columns are intentional and identify which one should drive IG narrative text.",
            })

    for data_element_id, elements in ethiopia.duplicate_data_element_ids.items():
        observations.append({
            "Category": "Duplicate Data Element ID",
            "Priority": "High",
            "Sheet": elements[0].sheet,
            "Row": ", ".join(str(element.row) for element in elements),
            "Data Element ID": data_element_id,
            "Observation": "The same Data Element ID appears more than once in the Ethiopia workbook.",
            "Suggested review": "Resolve duplicate IDs before generating IG artifacts.",
        })

    for sheet, row_number, values in ethiopia.rows_without_data_element_id:
        label = values.get("Data Element Label", "")
        description = values.get("Description and Definition", "")
        if not label and not description:
            continue
        observations.append({
            "Category": "Row without Data Element ID",
            "Priority": "Medium",
            "Sheet": sheet,
            "Row": str(row_number),
            "Data Element ID": "",
            "Observation": f"Row has content but no Data Element ID. Label: {label or '(blank)'}",
            "Suggested review": "Confirm whether this is a note/cleanup artifact or a missing data element.",
        })

    for element in ethiopia.data_elements.values():
        if not element.values.get("Data Element Label", ""):
            observations.append({
                "Category": "Blank label",
                "Priority": "High",
                "Sheet": element.sheet,
                "Row": str(element.row),
                "Data Element ID": element.data_element_id,
                "Observation": "Data element has a blank label.",
                "Suggested review": "Add a label or remove the row before IG generation.",
            })
        if not element.values.get("Data Type", ""):
            observations.append({
                "Category": "Blank data type",
                "Priority": "Medium",
                "Sheet": element.sheet,
                "Row": str(element.row),
                "Data Element ID": element.data_element_id,
                "Observation": "Data element has a blank data type.",
                "Suggested review": "Confirm whether this should be a selectable option row or a standalone element.",
            })
        required = element.values.get("Required", "")
        if required and required not in {"R", "O", "C"}:
            observations.append({
                "Category": "Unexpected Required value",
                "Priority": "Medium",
                "Sheet": element.sheet,
                "Row": str(element.row),
                "Data Element ID": element.data_element_id,
                "Observation": f"Required value is '{required}', expected R, O, or C.",
                "Suggested review": "Normalize requirement values before automated IG updates.",
            })

        searchable_text = " ".join(element.values.get(field, "") for field in FIELDS)
        typo_matches = []
        for pattern in ["confrim", "ellig", "disrib", "weigth"]:
            if re.search(pattern, searchable_text, re.IGNORECASE):
                typo_matches.append(pattern)
        if typo_matches:
            observations.append({
                "Category": "Possible typo",
                "Priority": "Low",
                "Sheet": element.sheet,
                "Row": str(element.row),
                "Data Element ID": element.data_element_id,
                "Observation": f"Possible typo pattern(s): {', '.join(typo_matches)}.",
                "Suggested review": "Confirm spelling in the Ethiopia source workbook.",
            })

    return observations


def markdown_table(headers: List[str], rows: List[List[object]]) -> str:
    lines = [
        "| " + " | ".join(headers) + " |",
        "| " + " | ".join("---" for _ in headers) + " |",
    ]
    for row in rows:
        lines.append("| " + " | ".join(clean_text(value).replace("|", "\\|") for value in row) + " |")
    return "\n".join(lines)


def render_report(
    ethiopia: WorkbookData,
    who: WorkbookData,
    added: List[DataElement],
    removed: List[DataElement],
    changed: List[Tuple[str, DataElement, DataElement, List[str]]],
    quality_observations: List[Dict[str, str]],
) -> str:
    added_by_sheet = Counter(element.sheet for element in added)
    removed_by_sheet = Counter(element.sheet for element in removed)
    changed_by_sheet = Counter(element.sheet for _, element, _, _ in changed)
    changed_field_counts = Counter(field for _, _, _, fields in changed for field in fields)
    label_change_count = sum(1 for _, _, _, fields in changed if "Data Element Label" in fields)

    sheet_rows = []
    all_sheets = list(dict.fromkeys(who.sheets + ethiopia.sheets))
    for sheet in all_sheets:
        sheet_rows.append([
            sheet,
            who.sheet_counts.get(sheet, 0),
            ethiopia.sheet_counts.get(sheet, 0),
            added_by_sheet.get(sheet, 0),
            removed_by_sheet.get(sheet, 0),
            changed_by_sheet.get(sheet, 0),
        ])

    field_rows = [[field, count] for field, count in changed_field_counts.most_common()]
    priority_counts = Counter(review_priority("Changed", fields) for _, _, _, fields in changed)
    priority_counts.update({"High": len(added) + len(removed)})

    quality_counts = Counter(row["Priority"] for row in quality_observations)
    semantic_change_count = sum(1 for _, _, _, fields in changed if any(field in KEY_SEMANTIC_FIELDS for field in fields))
    validation_change_count = sum(1 for _, _, _, fields in changed if any(field in VALIDATION_FIELDS for field in fields))
    linkage_change_count = sum(1 for _, _, _, fields in changed if any(field in LINKAGE_FIELDS for field in fields))
    duplicate_sheets = sorted(
        {element.sheet for elements in ethiopia.duplicate_data_element_ids.values() for element in elements}
    )
    if duplicate_sheets:
        duplicate_note = (
            "Sheet counts are data element rows. The Ethiopia workbook has duplicate Data Element IDs in "
            + ", ".join(f"`{sheet}`" for sheet in duplicate_sheets)
            + ", so the row count is higher than the unique Data Element ID count."
        )
    else:
        duplicate_note = "Sheet counts are data element rows. The Ethiopia workbook has no duplicate Data Element IDs."

    lines = [
        "# Ethiopia HIV DAK Data Dictionary Delta Report",
        "",
        f"Generated: {date.today().isoformat()}",
        "",
        "## Purpose",
        "",
        "This review package compares the Ethiopia HIV DAK data dictionary workbook against the WHO HIV DAK Annex A data dictionary currently present in this fork. It is intended to support Ministry of Health review before the Implementation Guide is customized.",
        "",
        "## Source files",
        "",
        f"- Ethiopia DAK data dictionary: `{relative(ETHIOPIA_WORKBOOK)}`",
        f"- WHO baseline data dictionary: `{relative(WHO_WORKBOOK)}`",
        "",
        "## Scope",
        "",
        "Included: data dictionary tabs with `Data Element ID` rows.",
        "",
        "Not included: decision-support tables, indicator tables, functional requirements, non-functional requirements, CQL behavior changes, or FHIR artifact generation. Those should be reviewed in separate deltas if the Ethiopia DAK includes corresponding source files.",
        "",
        "## Methodology",
        "",
        "The comparison uses Data Element ID as the join key. Counts labelled as data elements are unique Data Element IDs; counts labelled as rows include duplicate Data Element ID rows.",
        "",
        "Whitespace is normalized before comparing values, so line breaks and repeated spaces do not create false deltas.",
        "",
        "Several workbook tabs contain two columns both named `Description and Definition`. The report preserves these as `Description and Definition` and `Description and Definition (2)` so reviewers can decide which column is authoritative for the Ethiopia IG.",
        "",
        "A shared Data Element ID is marked changed when any compared field differs after normalization. Added and removed items are based on whether the Data Element ID exists in one workbook but not the other.",
        "",
        "## Executive Summary",
        "",
        markdown_table(
            ["Measure", "Count"],
            [
                ["WHO baseline data elements", len(who.data_elements)],
                ["WHO baseline data element rows", sum(who.sheet_counts.values())],
                ["Ethiopia data elements", len(ethiopia.data_elements)],
                ["Ethiopia data element rows", sum(ethiopia.sheet_counts.values())],
                ["Ethiopia duplicate Data Element IDs", len(ethiopia.duplicate_data_element_ids)],
                ["Shared Data Element IDs", len(set(who.data_elements) & set(ethiopia.data_elements))],
                ["Added in Ethiopia", len(added)],
                ["Removed from Ethiopia", len(removed)],
                ["Changed shared IDs", len(changed)],
                ["Shared IDs with changed labels", label_change_count],
                ["Shared IDs with key semantic changes", semantic_change_count],
                ["Shared IDs with validation/requiredness changes", validation_change_count],
                ["Shared IDs with decision/indicator linkage changes", linkage_change_count],
                ["Data-quality observations", len(quality_observations)],
            ],
        ),
        "",
        "## Review Files",
        "",
        markdown_table(
            ["File", "Use"],
            [
                ["`review-items.csv`", "Main Ministry review worksheet. One row per added, removed, or changed Data Element ID, with blank decision/comment columns."],
                ["`field-level-changes.csv`", "Most detailed delta. One row per changed field for each shared Data Element ID."],
                ["`added-data-elements.csv`", "All data elements present in Ethiopia but not in WHO Annex A."],
                ["`removed-data-elements.csv`", "All WHO baseline data elements absent from the Ethiopia workbook."],
                ["`changed-data-elements.csv`", "One row per shared Data Element ID with one or more field changes."],
                ["`reused-id-label-changes.csv`", "Focused list of shared Data Element IDs whose labels changed between WHO and Ethiopia."],
                ["`summary-by-sheet.csv`", "Counts by worksheet."],
                ["`changed-fields-by-sheet.csv`", "Field-level change counts by worksheet."],
                ["`data-quality-observations.csv`", "Rows that may need cleanup before automated IG generation."],
                ["`ethiopia-data-elements.csv`", "Flat extract of all Ethiopia data elements."],
            ],
        ),
        "",
        "## Counts By Sheet",
        "",
        markdown_table(
            ["Sheet", "WHO DEs", "Ethiopia DEs", "Added", "Removed", "Changed shared IDs"],
            sheet_rows,
        ),
        "",
        duplicate_note,
        "",
        "## Most Changed Fields",
        "",
        markdown_table(["Field", "Changed shared IDs"], field_rows[:20]),
        "",
        "## Review Priorities",
        "",
        markdown_table(
            ["Priority", "Review item count"],
            [[priority, priority_counts.get(priority, 0)] for priority in ["High", "Medium", "Low"]],
        ),
        "",
        "High-priority review items include added elements, removed elements, and shared IDs where the label, data type, multiple-choice type, or input option changed. These are the rows most likely to affect FHIR concepts, CQL retrieval definitions, value sets, questionnaire items, and downstream data exchange.",
        "",
        "## Data Quality Signals",
        "",
        markdown_table(
            ["Priority", "Observation count"],
            [[priority, quality_counts.get(priority, 0)] for priority in ["High", "Medium", "Low"]],
        ),
        "",
        "The quality observations are not automatically errors. They are review prompts, especially for duplicate IDs, rows without Data Element IDs, blank labels, and workbook structure issues.",
        "",
        "## Key Questions For Ministry Review",
        "",
        f"1. Are all {len(added)} Ethiopia-only Data Element IDs intended additions to the national DAK?",
        f"2. Are all {len(removed)} WHO Data Element IDs absent from the Ethiopia workbook intentionally removed from national scope?",
        "3. For shared IDs with label, data type, multiple-choice, or input-option changes, does the Data Element ID still represent the same concept?",
        "4. Should Ethiopia-specific `HIV.Surveil.*` elements become new IG elements, and where should they appear in the business process and FHIR mappings?",
        "5. Should removed WHO rows be deleted from the customized IG, hidden from narrative pages, or retained as optional/reference WHO content?",
        "6. Which column should be authoritative where the workbook contains duplicate `Description and Definition` columns?",
        "",
        "## Implementation Impact",
        "",
        "Confirmed changes will likely affect `input/pagecontent/dictionary.md`, `input/cql/HIVElements.cql`, `input/cql/HIVConcepts.cql`, generated FSH library wrappers, and any value sets or CQL logic tied to changed input options or decision-support linkages.",
        "",
        "A cautious implementation sequence would be: approve data dictionary delta, generate Ethiopia dictionary narrative, update concepts/value sets, update element retrieval libraries, then review decision logic and indicators against the approved element set.",
        "",
    ]
    return "\n".join(lines)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate a reviewable delta report for the Ethiopia HIV DAK data dictionary."
    )
    parser.add_argument(
        "--ethiopia-workbook",
        type=Path,
        default=ETHIOPIA_WORKBOOK,
        help=f"Ethiopia workbook to compare. Default: {relative(ETHIOPIA_WORKBOOK)}",
    )
    parser.add_argument(
        "--who-workbook",
        type=Path,
        default=WHO_WORKBOOK,
        help=f"WHO baseline workbook. Default: {relative(WHO_WORKBOOK)}",
    )
    parser.add_argument(
        "--report-dir",
        type=Path,
        default=REPORT_DIR,
        help=f"Output report directory. Default: {relative(REPORT_DIR)}",
    )
    return parser.parse_args()


def main() -> None:
    global ETHIOPIA_WORKBOOK, WHO_WORKBOOK, REPORT_DIR

    args = parse_args()
    ETHIOPIA_WORKBOOK = args.ethiopia_workbook
    WHO_WORKBOOK = args.who_workbook
    REPORT_DIR = args.report_dir

    if not ETHIOPIA_WORKBOOK.exists():
        raise FileNotFoundError(ETHIOPIA_WORKBOOK)
    if not WHO_WORKBOOK.exists():
        raise FileNotFoundError(WHO_WORKBOOK)

    REPORT_DIR.mkdir(parents=True, exist_ok=True)

    ethiopia = load_workbook_data(ETHIOPIA_WORKBOOK, "Ethiopia")
    who = load_workbook_data(WHO_WORKBOOK, "WHO")

    et_ids = set(ethiopia.data_elements)
    who_ids = set(who.data_elements)

    added = sorted_elements(ethiopia.data_elements[data_element_id] for data_element_id in et_ids - who_ids)
    removed = sorted_elements(who.data_elements[data_element_id] for data_element_id in who_ids - et_ids)

    changed: List[Tuple[str, DataElement, DataElement, List[str]]] = []
    for data_element_id in sorted(et_ids & who_ids):
        et_element = ethiopia.data_elements[data_element_id]
        who_element = who.data_elements[data_element_id]
        fields = changed_fields(et_element, who_element)
        if fields:
            changed.append((data_element_id, et_element, who_element, fields))
    changed.sort(key=lambda item: (item[1].sheet_order, item[1].row, item[0]))

    quality_observations = build_quality_observations(ethiopia)

    write_csv(
        REPORT_DIR / "summary-by-sheet.csv",
        ["Sheet", "WHO Data Elements", "Ethiopia Data Elements", "Added", "Removed", "Changed shared IDs"],
        [
            {
                "Sheet": sheet,
                "WHO Data Elements": str(who.sheet_counts.get(sheet, 0)),
                "Ethiopia Data Elements": str(ethiopia.sheet_counts.get(sheet, 0)),
                "Added": str(sum(1 for element in added if element.sheet == sheet)),
                "Removed": str(sum(1 for element in removed if element.sheet == sheet)),
                "Changed shared IDs": str(sum(1 for _, element, _, _ in changed if element.sheet == sheet)),
            }
            for sheet in dict.fromkeys(who.sheets + ethiopia.sheets)
        ],
    )

    write_csv(
        REPORT_DIR / "added-data-elements.csv",
        ["Review decision", "MOH comments", "Source", "Sheet", "Row"] + FIELDS,
        [
            {"Review decision": "", "MOH comments": "", **data_element_csv_row(element)}
            for element in added
        ],
    )

    write_csv(
        REPORT_DIR / "removed-data-elements.csv",
        ["Review decision", "MOH comments", "Source", "Sheet", "Row"] + FIELDS,
        [
            {"Review decision": "", "MOH comments": "", **data_element_csv_row(element)}
            for element in removed
        ],
    )

    write_csv(
        REPORT_DIR / "ethiopia-data-elements.csv",
        ["Source", "Sheet", "Row"] + FIELDS,
        [data_element_csv_row(element) for element in sorted_elements(ethiopia.data_elements.values())],
    )

    changed_rows = []
    for data_element_id, et_element, who_element, fields in changed:
        changed_rows.append({
            "Review decision": "",
            "MOH comments": "",
            "Priority": review_priority("Changed", fields),
            "Suggested IG action": suggested_action("Changed", fields),
            "Changed fields": "; ".join(fields),
            "Data Element ID": data_element_id,
            "Ethiopia Sheet": et_element.sheet,
            "Ethiopia Row": str(et_element.row),
            "WHO Sheet": who_element.sheet,
            "WHO Row": str(who_element.row),
            "WHO Label": who_element.values.get("Data Element Label", ""),
            "Ethiopia Label": et_element.values.get("Data Element Label", ""),
            "WHO Data Type": who_element.values.get("Data Type", ""),
            "Ethiopia Data Type": et_element.values.get("Data Type", ""),
            "WHO Input Options": who_element.values.get("Input Options", ""),
            "Ethiopia Input Options": et_element.values.get("Input Options", ""),
            "WHO Required": who_element.values.get("Required", ""),
            "Ethiopia Required": et_element.values.get("Required", ""),
        })

    write_csv(
        REPORT_DIR / "changed-data-elements.csv",
        [
            "Review decision",
            "MOH comments",
            "Priority",
            "Suggested IG action",
            "Changed fields",
            "Data Element ID",
            "Ethiopia Sheet",
            "Ethiopia Row",
            "WHO Sheet",
            "WHO Row",
            "WHO Label",
            "Ethiopia Label",
            "WHO Data Type",
            "Ethiopia Data Type",
            "WHO Input Options",
            "Ethiopia Input Options",
            "WHO Required",
            "Ethiopia Required",
        ],
        changed_rows,
    )

    write_csv(
        REPORT_DIR / "reused-id-label-changes.csv",
        [
            "Review decision",
            "MOH comments",
            "Priority",
            "Suggested review",
            "Data Element ID",
            "Sheet",
            "Ethiopia Row",
            "WHO Row",
            "WHO Label",
            "Ethiopia Label",
            "WHO Description",
            "Ethiopia Description",
            "Changed fields",
        ],
        [
            {
                "Review decision": "",
                "MOH comments": "",
                "Priority": "High",
                "Suggested review": "Confirm the ID still represents the same concept. If not, assign a new Ethiopia-specific ID.",
                "Data Element ID": data_element_id,
                "Sheet": et_element.sheet,
                "Ethiopia Row": str(et_element.row),
                "WHO Row": str(who_element.row),
                "WHO Label": who_element.label,
                "Ethiopia Label": et_element.label,
                "WHO Description": who_element.values.get("Description and Definition", ""),
                "Ethiopia Description": et_element.values.get("Description and Definition", ""),
                "Changed fields": "; ".join(fields),
            }
            for data_element_id, et_element, who_element, fields in changed
            if "Data Element Label" in fields
        ],
    )

    field_change_rows = []
    for data_element_id, et_element, who_element, fields in changed:
        for field in fields:
            field_change_rows.append({
                "Review decision": "",
                "MOH comments": "",
                "Priority": review_priority("Changed", [field]),
                "Suggested IG action": suggested_action("Changed", [field]),
                "Data Element ID": data_element_id,
                "Sheet": et_element.sheet,
                "Ethiopia Row": str(et_element.row),
                "WHO Row": str(who_element.row),
                "Field": field,
                "WHO value": who_element.values.get(field, ""),
                "Ethiopia value": et_element.values.get(field, ""),
                "WHO Label": who_element.values.get("Data Element Label", ""),
                "Ethiopia Label": et_element.values.get("Data Element Label", ""),
            })

    write_csv(
        REPORT_DIR / "field-level-changes.csv",
        [
            "Review decision",
            "MOH comments",
            "Priority",
            "Suggested IG action",
            "Data Element ID",
            "Sheet",
            "Ethiopia Row",
            "WHO Row",
            "Field",
            "WHO value",
            "Ethiopia value",
            "WHO Label",
            "Ethiopia Label",
        ],
        field_change_rows,
    )

    review_rows = []
    for element in added:
        review_rows.append({
            "Review decision": "",
            "MOH comments": "",
            "Change type": "Added",
            "Priority": review_priority("Added", []),
            "Suggested IG action": suggested_action("Added", []),
            "Changed fields": "",
            "Data Element ID": element.data_element_id,
            "Sheet": element.sheet,
            "Ethiopia Row": str(element.row),
            "WHO Row": "",
            "WHO Label": "",
            "Ethiopia Label": element.label,
            "WHO Data Type": "",
            "Ethiopia Data Type": element.values.get("Data Type", ""),
            "WHO Required": "",
            "Ethiopia Required": element.values.get("Required", ""),
        })
    for element in removed:
        review_rows.append({
            "Review decision": "",
            "MOH comments": "",
            "Change type": "Removed",
            "Priority": review_priority("Removed", []),
            "Suggested IG action": suggested_action("Removed", []),
            "Changed fields": "",
            "Data Element ID": element.data_element_id,
            "Sheet": element.sheet,
            "Ethiopia Row": "",
            "WHO Row": str(element.row),
            "WHO Label": element.label,
            "Ethiopia Label": "",
            "WHO Data Type": element.values.get("Data Type", ""),
            "Ethiopia Data Type": "",
            "WHO Required": element.values.get("Required", ""),
            "Ethiopia Required": "",
        })
    for data_element_id, et_element, who_element, fields in changed:
        review_rows.append({
            "Review decision": "",
            "MOH comments": "",
            "Change type": "Changed",
            "Priority": review_priority("Changed", fields),
            "Suggested IG action": suggested_action("Changed", fields),
            "Changed fields": "; ".join(fields),
            "Data Element ID": data_element_id,
            "Sheet": et_element.sheet,
            "Ethiopia Row": str(et_element.row),
            "WHO Row": str(who_element.row),
            "WHO Label": who_element.label,
            "Ethiopia Label": et_element.label,
            "WHO Data Type": who_element.values.get("Data Type", ""),
            "Ethiopia Data Type": et_element.values.get("Data Type", ""),
            "WHO Required": who_element.values.get("Required", ""),
            "Ethiopia Required": et_element.values.get("Required", ""),
        })

    review_rows.sort(key=lambda row: (
        {"High": 0, "Medium": 1, "Low": 2}.get(row["Priority"], 9),
        {"Added": 0, "Removed": 1, "Changed": 2}.get(row["Change type"], 9),
        row["Sheet"],
        row["Data Element ID"],
    ))

    write_csv(
        REPORT_DIR / "review-items.csv",
        [
            "Review decision",
            "MOH comments",
            "Change type",
            "Priority",
            "Suggested IG action",
            "Changed fields",
            "Data Element ID",
            "Sheet",
            "Ethiopia Row",
            "WHO Row",
            "WHO Label",
            "Ethiopia Label",
            "WHO Data Type",
            "Ethiopia Data Type",
            "WHO Required",
            "Ethiopia Required",
        ],
        review_rows,
    )

    field_by_sheet_counter = Counter()
    for _, element, _, fields in changed:
        for field in fields:
            field_by_sheet_counter[(element.sheet, field)] += 1

    write_csv(
        REPORT_DIR / "changed-fields-by-sheet.csv",
        ["Sheet", "Field", "Changed shared IDs"],
        [
            {"Sheet": sheet, "Field": field, "Changed shared IDs": str(count)}
            for (sheet, field), count in sorted(field_by_sheet_counter.items())
        ],
    )

    write_csv(
        REPORT_DIR / "data-quality-observations.csv",
        ["Review decision", "MOH comments", "Category", "Priority", "Sheet", "Row", "Data Element ID", "Observation", "Suggested review"],
        [
            {"Review decision": "", "MOH comments": "", **row}
            for row in sorted(quality_observations, key=lambda row: (
                {"High": 0, "Medium": 1, "Low": 2}.get(row["Priority"], 9),
                row["Category"],
                row["Sheet"],
                row["Row"],
                row["Data Element ID"],
            ))
        ],
    )

    report = render_report(ethiopia, who, added, removed, changed, quality_observations)
    (REPORT_DIR / "README.md").write_text(report + "\n", encoding="utf-8")

    print(f"Wrote report package to {relative(REPORT_DIR)}")
    print(f"Added: {len(added)}")
    print(f"Removed: {len(removed)}")
    print(f"Changed shared IDs: {len(changed)}")
    print(f"Quality observations: {len(quality_observations)}")


if __name__ == "__main__":
    main()
