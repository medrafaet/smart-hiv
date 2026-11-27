Instance: HIV.H1IdentifyClientForFollowUp
InstanceOf: sdc-questionnaire-extr-smap
Title: "Identify client for follow-up"
Description: "Records why the client was identified for HIV follow-up."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true

* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "follow-up-exclusive-reasons"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Choose either Did not initiate ART or Inconclusive HIV status."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.H.DE1').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.H.DE4').empty() or
  %resource.item.where(linkId = 'HIV.H.DE1').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.H.DE6').empty()
"""

* item[+]
  * id = "HIV.H.DE1"
  * linkId = "HIV.H.DE1"
  * type = #choice
  * text = "Reason for follow-up"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.H.DE1)
* item[+]
  * id = "HIV.H.DE9"
  * linkId = "HIV.H.DE9"
  * type = #string
  * text = "Other follow-up reason (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.H.DE1"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.H.DE8
