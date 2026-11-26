Instance: HIV.A2GatherClientDetails
InstanceOf: sdc-questionnaire-extr-smap
Title: "Gather client details"
Description: "Questionnaire for gather client details"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "registration-visit-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "The visit date and time must be at or before the current time."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.A.DE3').answer.value <= now()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "registration-name-characters"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Use only letters, periods, and hyphens in names."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.A.DE1' or linkId = 'HIV.A.ET.DE1' or linkId = 'HIV.A.ET.DE2' or linkId = 'HIV.A.DE2').answer.value.all($this.matches('^[\\\\p{L}\\\\p{M}.-]+$'))"

* item[+]
  * id = "HIV.A.DE1"
  * linkId = "HIV.A.DE1"
  * type = #string
  * text = "First name"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.ET.DE1"
  * linkId = "HIV.A.ET.DE1"
  * type = #string
  * text = "Father name"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.ET.DE2"
  * linkId = "HIV.A.ET.DE2"
  * type = #string
  * text = "Grandfather name"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE2"
  * linkId = "HIV.A.DE2"
  * type = #string
  * text = "Family name"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE3"
  * linkId = "HIV.A.DE3"
  * type = #dateTime
  * text = "Visit date"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE4"
  * linkId = "HIV.A.DE4"
  * type = #boolean
  * text = "Referral"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE5"
  * linkId = "HIV.A.DE5"
  * type = #choice
  * text = "Referred by"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.A.DE5)
  * enableWhen[+].question = "HIV.A.DE4"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerBoolean = true
