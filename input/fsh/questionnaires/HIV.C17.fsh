Instance: HIV.C17DetermineRecommendedTests
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine recommended tests"
Description: "Records recommended screenings for a client starting or using PrEP."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.C.DE63"
  * linkId = "HIV.C.DE63"
  * type = #choice
  * text = "Screenings and diagnostics for PrEP users"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE63)
