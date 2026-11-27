Instance: HIV.H2AttemptToLocateClient
InstanceOf: sdc-questionnaire-extr-smap
Title: "Attempt to locate client"
Description: "Records a tracing attempt, including attempts that yielded no information about the client."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true

* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "follow-up-attempt-time"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record the contact attempt at the current time or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.H.DE11').answer.value.ofType(dateTime).where($this > now()).empty()
"""

* item[+]
  * id = "HIV.H.DE10"
  * linkId = "HIV.H.DE10"
  * type = #boolean
  * text = "Was a contact tracing attempt made?"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.H.DE11"
  * linkId = "HIV.H.DE11"
  * type = #dateTime
  * text = "Date of contact attempt"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.H.DE10"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.H.DE12"
  * linkId = "HIV.H.DE12"
  * type = #string
  * text = "Contact attempted by"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.H.DE10"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.H.DE13"
  * linkId = "HIV.H.DE13"
  * type = #choice
  * text = "Contact method"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.H.DE13)
  * enableWhen.question = "HIV.H.DE10"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "informationObtained"
  * type = #boolean
  * text = "Was information about the client obtained?"
  * required = true
  * enableWhen.question = "HIV.H.DE10"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.H.DE17"
  * linkId = "HIV.H.DE17"
  * type = #choice
  * text = "Source of information"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.H.DE17)
  * enableWhen.question = "informationObtained"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.H.DE22"
  * linkId = "HIV.H.DE22"
  * type = #string
  * text = "Other source of information (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.H.DE17"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.H.DE21
