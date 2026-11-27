ValueSet: HIV.D.DE461
Title: "Medications dispensed ValueSet"
Description: "Value set of any other medications that were dispensed to client, including preventive treatment"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-computablevalueset"
* ^status = #active
* ^experimental = true
* ^name = "HIVDDE461"
* ^url = "https://hiv.fhir.et/ValueSet/HIV.D.DE461"

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-rules-text"
* ^extension[=].valueMarkdown = "Use approved medication codes from the prescribing application. Record the duration, dosage and frequency separately for each medication."
