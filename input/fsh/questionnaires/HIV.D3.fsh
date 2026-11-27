Instance: HIV.D3CheckForSignsOfSeriousIllness
InstanceOf: sdc-questionnaire-extr-smap
Title: "Check for signs of serious illness"
Description: "Records whether any signs of serious illness were found and which signs were documented."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "care-serious-signs-conflict"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "A check recorded as finding no signs must have an empty signs list."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'seriousIllnessSignsPresent').answer.value.where($this = false).exists() implies %resource.item.where(linkId = 'HIV.D.DE17').answer.value.empty()"

* item[+]
  * id = "seriousIllnessSignsPresent"
  * linkId = "seriousIllnessSignsPresent"
  * type = #boolean
  * text = "Were any signs of serious illness found?"
  * required = true
  * repeats = false
* item[+]
  * id = "HIV.D.DE17"
  * linkId = "HIV.D.DE17"
  * type = #choice
  * text = "Signs of serious illness"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE17)
  * enableWhen.question = "seriousIllnessSignsPresent"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE30"
  * linkId = "HIV.D.DE30"
  * type = #string
  * text = "Other sign of serious illness (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE17"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE29
