Instance: HIV.B8ProvidePostTestCounselling
InstanceOf: sdc-questionnaire-extr-smap
Title: "Provide post-test counselling"
Description: "Records the counselling and linkage actions provided after testing and the relevant HIV diagnosis details."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Patient
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "The patient whose date of birth is used to calculate age at diagnosis."
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext][1].extension[name].valueCoding.code = #htsCounselling
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext][1].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext][1].extension[description].valueString = "The confirmed HIV status reported for this visit as an hivStatus parameter with valueCoding. Supply empty Parameters when the status is unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "hasPositiveHivStatus"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%htsCounselling.parameter.where(name = 'hivStatus').value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.B.DE116').exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "hts-art-start-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "The ART start date must be today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.B.DE72').answer.value.all($this <= today())"

* item[+]
  * id = "HIV.B.DE71"
  * linkId = "HIV.B.DE71"
  * type = #date
  * text = "HIV diagnosis date"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%hasPositiveHivStatus"
* item[+]
  * id = "HIV.B.DE72"
  * linkId = "HIV.B.DE72"
  * type = #date
  * text = "ART start date"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%hasPositiveHivStatus"
* item[+]
  * id = "HIV.B.DE73"
  * linkId = "HIV.B.DE73"
  * type = #integer
  * text = "Age at diagnosis (years)"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%hasPositiveHivStatus"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "birthDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%patient.birthDate.toString()"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "diagnosisDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%resource.item.where(linkId = 'HIV.B.DE71').answer.value.toString()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%hasPositiveHivStatus and %birthDate.length() = 10 and %diagnosisDate.length() = 10 and %birthDate.toDate() <= %diagnosisDate.toDate(), (%diagnosisDate.replace('-', '').toInteger() - %birthDate.replace('-', '').toInteger()) div 10000, {})"
* item[+]
  * id = "HIV.B.DE121"
  * linkId = "HIV.B.DE121"
  * type = #choice
  * text = "Probable route of transmission"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE121)
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%hasPositiveHivStatus"
* item[+]
  * id = "HIV.B.DE142"
  * linkId = "HIV.B.DE142"
  * type = #choice
  * text = "Counselling provided"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE142)
