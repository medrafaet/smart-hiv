ValueSet: HIV.D.DE606
Title: "Vaccination location ValueSet"
Description: "Retired coded answer list. Vaccination location is recorded as a reference to a verified ET Base MFR Location."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset"
* ^status = #retired
* ^experimental = true
* ^name = "HIVDDE606"
* ^url = "http://smart.who.int/hiv/ValueSet/HIV.D.DE606"

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-rules-text"
* ^extension[=].valueMarkdown = "Use the verified MFR Location referenced by Immunization.location."
