Instance: HIV.D15DetermineClinicalStageOfHiv
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine clinical stage of HIV"
Description: "Records findings from one Care and Treatment staging assessment, the documented clinical stage at ART initiation, and the date of clinical status change."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "care-staging-asymptomatic"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Select Asymptomatic on its own for this assessment."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE289').answer.value.ofType(Coding).count() <= 1 or %resource.item.where(linkId = 'HIV.D.DE289').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.D.DE290').empty()"

* item[+]
  * id = "HIV.D.DE289"
  * linkId = "HIV.D.DE289"
  * type = #choice
  * text = "WHO HIV clinical stage condition or symptom"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE289)
* item[+]
  * id = "HIV.D.DE358"
  * linkId = "HIV.D.DE358"
  * type = #choice
  * text = "Clinical stage at start of ART"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE358)
* item[+]
  * id = "HIV.D.DE363"
  * linkId = "HIV.D.DE363"
  * type = #date
  * text = "Date of clinical status change"
  * required = false
  * repeats = false
  * readOnly = false
