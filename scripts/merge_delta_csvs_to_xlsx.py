#!/usr/bin/env python3
"""Merge delta-report CSV files into one XLSX workbook.

This script intentionally uses only the Python standard library. It writes a
minimal, valid XLSX package directly, with one worksheet per CSV file.
"""

from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path
from typing import Iterable, List, Sequence
from xml.sax.saxutils import escape
from zipfile import ZIP_DEFLATED, ZipFile


DEFAULT_REPORT_DIR = Path("reports/ethiopia-dak-delta")
DEFAULT_OUTPUT = DEFAULT_REPORT_DIR / "ethiopia-dak-delta-review.xlsx"
INVALID_SHEET_CHARS = re.compile(r"[\[\]:*?/\\]")


def column_name(index: int) -> str:
    """Convert 1-based column index to Excel column letters."""
    name = ""
    while index:
        index, remainder = divmod(index - 1, 26)
        name = chr(65 + remainder) + name
    return name


def safe_sheet_name(csv_path: Path, used_names: set[str]) -> str:
    name = csv_path.stem.replace("-", " ").replace("_", " ")
    name = INVALID_SHEET_CHARS.sub(" ", name)
    name = re.sub(r"\s+", " ", name).strip() or "Sheet"
    name = name[:31]

    candidate = name
    counter = 2
    while candidate in used_names:
        suffix = f" {counter}"
        candidate = f"{name[:31 - len(suffix)]}{suffix}"
        counter += 1
    used_names.add(candidate)
    return candidate


def read_csv(path: Path) -> List[List[str]]:
    with path.open(newline="", encoding="utf-8-sig") as handle:
        return [row for row in csv.reader(handle)]


def worksheet_xml(rows: Sequence[Sequence[str]]) -> str:
    max_columns = max((len(row) for row in rows), default=1)
    max_rows = max(len(rows), 1)
    dimension = f"A1:{column_name(max_columns)}{max_rows}"

    parts = [
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>',
        '<worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"',
        ' xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">',
        f'<dimension ref="{dimension}"/>',
        "<sheetViews><sheetView workbookViewId=\"0\"><pane ySplit=\"1\" topLeftCell=\"A2\" activePane=\"bottomLeft\" state=\"frozen\"/></sheetView></sheetViews>",
        '<sheetFormatPr defaultRowHeight="15"/>',
        column_widths(rows),
        "<sheetData>",
    ]

    for row_index, row in enumerate(rows, start=1):
        parts.append(f'<row r="{row_index}">')
        for column_index, value in enumerate(row, start=1):
            cell_ref = f"{column_name(column_index)}{row_index}"
            style = ' s="1"' if row_index == 1 else ""
            parts.append(
                f'<c r="{cell_ref}" t="inlineStr"{style}><is><t>{escape(value)}</t></is></c>'
            )
        parts.append("</row>")

    parts.extend([
        "</sheetData>",
        f'<autoFilter ref="{dimension}"/>',
        "</worksheet>",
    ])
    return "".join(parts)


def column_widths(rows: Sequence[Sequence[str]]) -> str:
    if not rows:
        return ""

    max_columns = max(len(row) for row in rows)
    sample_rows = rows[:200]
    widths = []
    for column_index in range(max_columns):
        max_length = 0
        for row in sample_rows:
            if column_index < len(row):
                max_length = max(max_length, len(row[column_index]))
        width = min(max(max_length + 2, 10), 60)
        widths.append(
            f'<col min="{column_index + 1}" max="{column_index + 1}" width="{width}" customWidth="1"/>'
        )
    return "<cols>" + "".join(widths) + "</cols>"


def workbook_xml(sheet_names: Sequence[str]) -> str:
    sheets = []
    for index, name in enumerate(sheet_names, start=1):
        sheets.append(
            f'<sheet name="{escape(name)}" sheetId="{index}" r:id="rId{index}"/>'
        )
    return (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"'
        ' xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">'
        "<sheets>"
        + "".join(sheets)
        + "</sheets></workbook>"
    )


def workbook_rels_xml(sheet_count: int) -> str:
    rels = []
    for index in range(1, sheet_count + 1):
        rels.append(
            f'<Relationship Id="rId{index}" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet{index}.xml"/>'
        )
    rels.append(
        f'<Relationship Id="rId{sheet_count + 1}" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/>'
    )
    return (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
        + "".join(rels)
        + "</Relationships>"
    )


def content_types_xml(sheet_count: int) -> str:
    overrides = [
        '<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>',
        '<Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>',
        '<Override PartName="/docProps/core.xml" ContentType="application/vnd.openxmlformats-package.core-properties+xml"/>',
        '<Override PartName="/docProps/app.xml" ContentType="application/vnd.openxmlformats-officedocument.extended-properties+xml"/>',
    ]
    for index in range(1, sheet_count + 1):
        overrides.append(
            f'<Override PartName="/xl/worksheets/sheet{index}.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>'
        )
    return (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">'
        '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>'
        '<Default Extension="xml" ContentType="application/xml"/>'
        + "".join(overrides)
        + "</Types>"
    )


def root_rels_xml() -> str:
    return (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">'
        '<Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/>'
        '<Relationship Id="rId2" Type="http://schemas.openxmlformats.org/package/2006/relationships/metadata/core-properties" Target="docProps/core.xml"/>'
        '<Relationship Id="rId3" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/extended-properties" Target="docProps/app.xml"/>'
        "</Relationships>"
    )


def styles_xml() -> str:
    return (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">'
        '<fonts count="2"><font><sz val="11"/><name val="Calibri"/></font><font><b/><sz val="11"/><name val="Calibri"/></font></fonts>'
        '<fills count="2"><fill><patternFill patternType="none"/></fill><fill><patternFill patternType="gray125"/></fill></fills>'
        '<borders count="1"><border><left/><right/><top/><bottom/><diagonal/></border></borders>'
        '<cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>'
        '<cellXfs count="2"><xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/><xf numFmtId="0" fontId="1" fillId="0" borderId="0" xfId="0"/></cellXfs>'
        '<cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles>'
        "</styleSheet>"
    )


def core_props_xml() -> str:
    return (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<cp:coreProperties xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties"'
        ' xmlns:dc="http://purl.org/dc/elements/1.1/"'
        ' xmlns:dcterms="http://purl.org/dc/terms/"'
        ' xmlns:dcmitype="http://purl.org/dc/dcmitype/"'
        ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">'
        "<dc:title>Ethiopia HIV DAK Delta Review</dc:title>"
        "<dc:creator>Codex</dc:creator>"
        "</cp:coreProperties>"
    )


def app_props_xml(sheet_names: Sequence[str]) -> str:
    headings_count = len(sheet_names)
    sheet_titles = "".join(f'<vt:lpstr>{escape(name)}</vt:lpstr>' for name in sheet_names)
    return (
        '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'
        '<Properties xmlns="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties"'
        ' xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes">'
        "<Application>Codex</Application>"
        '<HeadingPairs><vt:vector size="2" baseType="variant"><vt:variant><vt:lpstr>Worksheets</vt:lpstr></vt:variant>'
        f'<vt:variant><vt:i4>{headings_count}</vt:i4></vt:variant></vt:vector></HeadingPairs>'
        f'<TitlesOfParts><vt:vector size="{headings_count}" baseType="lpstr">{sheet_titles}</vt:vector></TitlesOfParts>'
        "</Properties>"
    )


def csv_files(input_dir: Path, requested_files: Sequence[str] | None = None) -> List[Path]:
    if requested_files:
        paths = [input_dir / name for name in requested_files]
    else:
        paths = sorted(input_dir.glob("*.csv"))

    missing = [path for path in paths if not path.exists()]
    if missing:
        missing_text = ", ".join(str(path) for path in missing)
        raise FileNotFoundError(f"Missing CSV file(s): {missing_text}")
    return paths


def write_xlsx(csv_paths: Sequence[Path], output_path: Path) -> None:
    if not csv_paths:
        raise ValueError("No CSV files found to merge.")

    used_sheet_names: set[str] = set()
    sheets = [(safe_sheet_name(path, used_sheet_names), read_csv(path)) for path in csv_paths]

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with ZipFile(output_path, "w", ZIP_DEFLATED) as workbook:
        workbook.writestr("[Content_Types].xml", content_types_xml(len(sheets)))
        workbook.writestr("_rels/.rels", root_rels_xml())
        workbook.writestr("docProps/core.xml", core_props_xml())
        workbook.writestr("docProps/app.xml", app_props_xml([name for name, _ in sheets]))
        workbook.writestr("xl/workbook.xml", workbook_xml([name for name, _ in sheets]))
        workbook.writestr("xl/_rels/workbook.xml.rels", workbook_rels_xml(len(sheets)))
        workbook.writestr("xl/styles.xml", styles_xml())
        for index, (_, rows) in enumerate(sheets, start=1):
            workbook.writestr(f"xl/worksheets/sheet{index}.xml", worksheet_xml(rows))


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Merge delta report CSV files into a single XLSX workbook."
    )
    parser.add_argument(
        "--input-dir",
        type=Path,
        default=DEFAULT_REPORT_DIR,
        help=f"Directory containing CSV files. Default: {DEFAULT_REPORT_DIR}",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=DEFAULT_OUTPUT,
        help=f"Output XLSX path. Default: {DEFAULT_OUTPUT}",
    )
    parser.add_argument(
        "csv_files",
        nargs="*",
        help="Optional CSV filenames, relative to --input-dir, to include in this order.",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    paths = csv_files(args.input_dir, args.csv_files)
    write_xlsx(paths, args.output)
    print(f"Wrote {args.output} with {len(paths)} sheets.")


if __name__ == "__main__":
    main()
