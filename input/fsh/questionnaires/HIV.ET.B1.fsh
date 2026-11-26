Instance: HIV.ET.B1DetermineTestingModality
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine testing modality"
Description: "Captures the approach used to provide HIV testing services."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.B.ET.DE26"
  * linkId = "HIV.B.ET.DE26"
  * type = #choice
  * text = "HIV testing modality"
  * required = true
  * repeats = false
  * answerValueSet = Canonical(HIV.B.ET.DE26)
