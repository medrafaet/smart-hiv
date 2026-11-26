Instance: HIV.C1DetermineReasonForVisit
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine reason for visit"
Description: "Records the PrEP visit reason, PEP counselling, and PrEP follow-up details."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "prep-visit-reason"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Select a PrEP visit type or record PEP counselling."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.C.DE1').answer.value.ofType(Coding).where(code.exists()).exists() or %resource.item.where(linkId = 'HIV.C.DE5').answer.value.where($this = true).exists()"

* item[+]
  * id = "HIV.C.DE1"
  * linkId = "HIV.C.DE1"
  * type = #choice
  * text = "Type of PrEP visit"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE1)
* item[+]
  * id = "HIV.C.DE5"
  * linkId = "HIV.C.DE5"
  * type = #boolean
  * text = "Counselling on PEP"
  * required = false
  * repeats = false
* item[+]
  * id = "HIV.C.DE7"
  * linkId = "HIV.C.DE7"
  * type = #date
  * text = "PrEP follow-up visit date"
  * required = false
  * repeats = false
  * enableWhen.question = "HIV.C.DE1"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE3
* item[+]
  * id = "HIV.C.ET.DE7.1"
  * linkId = "HIV.C.ET.DE7.1"
  * type = #boolean
  * text = "2-month PrEP follow-up visit"
  * required = false
  * repeats = false
  * enableWhen.question = "HIV.C.DE1"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE3
* item[+]
  * id = "HIV.C.ET.DE7.2"
  * linkId = "HIV.C.ET.DE7.2"
  * type = #boolean
  * text = "6-month PrEP follow-up visit"
  * required = false
  * repeats = false
  * enableWhen.question = "HIV.C.DE1"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE3
