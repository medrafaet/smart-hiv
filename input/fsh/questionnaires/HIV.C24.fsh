Instance: HIV.C24ScheduleFollowUp
InstanceOf: sdc-questionnaire-extr-smap
Title: "Schedule follow-up"
Description: "Records the date, time and reason for the planned PrEP or PEP follow-up."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "prep-follow-up-reason"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Select a follow-up reason when an appointment date is recorded."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.C.DE124').answer.value.exists() implies %resource.item.where(linkId = 'HIV.C.DE125').answer.value.exists()"

* item[+]
  * id = "HIV.C.DE124"
  * linkId = "HIV.C.DE124"
  * type = #dateTime
  * text = "Date/time of follow-up appointment"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.DE125"
  * linkId = "HIV.C.DE125"
  * type = #choice
  * text = "Type of follow-up appointment"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE125)
* item[+]
  * id = "HIV.C.DE129"
  * linkId = "HIV.C.DE129"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE125"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE128
