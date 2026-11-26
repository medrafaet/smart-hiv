Instance: HIV.B1DetermineReasonForVisit
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine reason for visit"
Description: "Questionnaire for determine reason for visit"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.B.DE1"
  * linkId = "HIV.B.DE1"
  * type = #choice
  * text = "Reason for visit"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE1)
* item[+]
  * id = "HIV.B.DE5"
  * linkId = "HIV.B.DE5"
  * type = #choice
  * text = "Referred through partner services"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE5)
* item[+]
  * id = "HIV.B.DE8"
  * linkId = "HIV.B.DE8"
  * type = #choice
  * text = "Type of contact or partner for partner services"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE8)
  * enableBehavior = #any
  * enableWhen[+].question = "HIV.B.DE5"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.B.DE6
  * enableWhen[+].question = "HIV.B.DE5"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.B.DE7
* item[+]
  * id = "HIV.B.DE13"
  * linkId = "HIV.B.DE13"
  * type = #boolean
  * text = "Contact with and (suspected) exposure to HIV"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE14"
  * linkId = "HIV.B.DE14"
  * type = #dateTime
  * text = "Date/time of suspected exposure to HIV"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen[+].question = "HIV.B.DE13"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerBoolean = true
* item[+]
  * id = "HIV.B.DE15"
  * linkId = "HIV.B.DE15"
  * type = #choice
  * text = "Testing entry point"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE15)
* item[+]
  * id = "HIV.B.DE18"
  * linkId = "HIV.B.DE18"
  * type = #choice
  * text = "Entry point for community-level testing"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE18)
  * enableWhen[+].question = "HIV.B.DE15"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.B.DE16
* item[+]
  * id = "HIV.B.DE22"
  * linkId = "HIV.B.DE22"
  * type = #choice
  * text = "Entry point for facility-level testing"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE22)
  * enableWhen[+].question = "HIV.B.DE15"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.B.DE17
