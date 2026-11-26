# Ethiopian Ministry of Health SMART Guidelines - HIV Implementation Guide

This repository contains the Ethiopian Ministry of Health customization of the HIV SMART Guidelines Implementation Guide. It is based on the WHO SMART Guidelines HIV artifacts and adapted for Ethiopia's HIV service delivery, reporting, and interoperability needs.

Click to visit the generated Implementation Guide after publication.

## Pinned MoH data dictionary

The current MoH HIV Program data dictionary is pinned at
`input/l2/ET_HIV_DAK_DD_Final version after cleaning.xlsx`. This is also the
default MoH source used by `scripts/generate_et_delta_report.py`.

- Source: October 2026 workbook supplied by the MoH HIV Program team through the project owner.
- Original filename: `Oct 2026- WHO_HIV_DAK_DD_Final version after cleaning (6).xlsx`.
- Pinned on: 2026-11-26.
- SHA-256: `ea9bfa6092928de592d600bc0218a55280cd5e278bea4d7a16218d2ee7e9cb25`.
- The workbook is preserved byte-for-byte. Earlier versions remain in Git history.
- `2. ET_HIV_DAK_DD_Final version after cleaning.xlsx` is historical/reference
  content, not the current source. The WHO 2023 baseline workbooks remain unchanged.

**Precedence:** FHIR representation must conform to the pinned Ethiopian base
dependency (`et.fhir.core#0.9.0`). Where the workbook conflicts with ET Base,
ET Base takes priority. HIV-specific constraints may further restrict the base,
but must not weaken its constraints or replace its required bindings.
Keep WHO concept meanings and clinical logic intact; source row IDs must not
silently redefine existing coded concepts.

Use the workbook to review the questionnaires, logical models, terminology,
CQL, and dictionary narrative. The registration questionnaire and logical model
distinguish required grandfather name (`HIV.A.ET.DE2`) from optional family name
(`HIV.A.DE2`). The logical model maps grandfather name to the workbook ID
because the existing `HIVConcepts` code `HIV.A.ET.DE2` identifies Zone/Subcity.

### DevOps and validation handoff

- The source review found nine duplicate IDs and 16 IDs outside the comparison
  tool's expected formats, including placeholders. Do not renumber, merge, or
  generate ambiguous clinical concepts without MoH confirmation.
- The legacy comparison script does not recognize all new surveillance and
  nonstandard ID formats. Its output is not a complete extraction of this workbook.
- ET Base must be available in the FHIR package cache. If the default registries
  cannot resolve it, obtain the pinned package from
  <https://fhir.et/core/0.9.0/package.tgz>.
- The last local Publisher 3.0.5 run generated the site, but its final QA reported
  222 errors, 1,547 warnings, and 18 broken links. A generated website is not a
  conformance pass. SDC version metadata, terminology displays, malformed URLs,
  and CQL/ELM generation issues still need review; do not suppress them to publish.


## Changes and feedback

Feedback and issues about this Ethiopia MoH customization can be submitted via the project issue tracker and will be incorporated into subsequent releases.

### Building Locally
### Install nodejs
https://nodejs.org/en/download/

### Install Jekyll
Install ruby and ruby gems: https://www.ruby-lang.org/en/documentation/installation/

### Install Jekyll gem
    gem install jekyll
### Install Sushi
    npm install -g fsh-sushi
    sushi --help
### Update IG Publisher
    ./_updatePublisher.sh
### Run IG Publisher
    ./_genonce.sh
### Open Published IG
    Open `./output/




