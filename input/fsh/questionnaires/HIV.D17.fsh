Instance: HIV.D17CheckForSignsOfTreatmentFailure
InstanceOf: sdc-questionnaire-extr-smap
Title: "Check for signs of treatment failure"
Description: "Records the types of ART treatment failure documented by the clinician."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.D.DE225"
  * linkId = "HIV.D.DE225"
  * type = #choice
  * text = "Treatment failure"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE225)
