ValueSet: HIV.D.DE457
Title: "Medications prescribed ValueSet"
Description: "Value set of name or regimen code of all other medications prescribed during the visit"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset"
* ^status = #active
* ^experimental = true
* ^name = "HIVDDE457"
* ^url = "https://hiv.fhir.et/ValueSet/HIV.D.DE457"

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-rules-text"
* ^extension[=].valueMarkdown = "Use approved medication codes from the prescribing application. Record the date, dose and duration separately for each medication."
