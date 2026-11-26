Instance: HIV.D10CounselReturningClient
InstanceOf: sdc-questionnaire-extr-smap
Title: "Counsel returning client"
Description: "Records viral load follow-up, ART interruption and adherence or stopping reasons documented during counselling."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #careCounselling
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply one fairOrPoorAdherence boolean from the documented adherence assessment and one stoppedArt boolean from documented ART history (HIV.D.DE40), when known. Supply viralLoadTurnaroundDays as one nonnegative integer for the expected time in calendar days from sample collection to review. Supply empty Parameters when context is unavailable."

* item[+]
  * id = "HIV.D.DE192"
  * linkId = "HIV.D.DE192"
  * type = #boolean
  * text = "Received viral load test result"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE193"
  * linkId = "HIV.D.DE193"
  * type = #date
  * text = "Date viral load test results received by client"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE194"
  * linkId = "HIV.D.DE194"
  * type = #dateTime
  * text = "Date of viral load test (sample collection)"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE195"
  * linkId = "HIV.D.DE195"
  * type = #date
  * text = "Date of scheduled review of viral load test results"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "sampleDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE194').answer.value.ofType(dateTime).toString().substring(0, 10).where(length() = 10)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "turnaroundDays"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%careCounselling.parameter.where(name = 'viralLoadTurnaroundDays').value.ofType(integer)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%sampleDate.exists() and %turnaroundDays.count() = 1, iif(%turnaroundDays >= 0, %sampleDate.toDate() + (%turnaroundDays * 1 day), {}), {})"
* item[+]
  * id = "HIV.D.DE196"
  * linkId = "HIV.D.DE196"
  * type = #date
  * text = "Date of ART interruption"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE197"
  * linkId = "HIV.D.DE197"
  * type = #choice
  * text = "Reason(s) for adherence problem"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE197)
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%careCounselling.parameter.where(name = 'fairOrPoorAdherence').value.ofType(boolean).where($this = true).exists()"
* item[+]
  * id = "HIV.D.DE216"
  * linkId = "HIV.D.DE216"
  * type = #string
  * text = "Other reason for nonadherence (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE197"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE215
* item[+]
  * id = "HIV.D.DE217"
  * linkId = "HIV.D.DE217"
  * type = #choice
  * text = "Reason ART stopped"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE217)
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%careCounselling.parameter.where(name = 'stoppedArt').value.ofType(boolean).where($this = true).exists()"
* item[+]
  * id = "HIV.D.DE224"
  * linkId = "HIV.D.DE224"
  * type = #string
  * text = "Other reason for stopping ART (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE217"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE223
