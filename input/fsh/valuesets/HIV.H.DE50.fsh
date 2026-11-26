ValueSet: HIV.H.DE50
Title: "Transfer to facility ValueSet"
Description: "Retired coded answer list. Transfer destination is recorded as a reference to a verified ET Base MFR Organization."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablevalueset"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablevalueset"
* ^status = #retired
* ^experimental = true
* ^name = "HIVHDE50"
* ^url = "http://smart.who.int/hiv/ValueSet/HIV.H.DE50"

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/valueset-rules-text"
* ^extension[=].valueMarkdown = "Use the verified MFR Organization for the receiving facility."
