Instance: HIV.F12Prescribe
InstanceOf: sdc-questionnaire-extr-smap
Title: "Prescribe"
Description: "Questionnaire for prescribe"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #infantProphylaxis
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply the verified infant birthDate and ctxStartDate together with ageAtCtxStart in months for that exact recorded start date. Supply empty Parameters when unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "pmtct-prophylaxis-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Use today or an earlier start date for documented infant prophylaxis."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE163' | 'HIV.E.DE167')).answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"

* item[+]
  * id = "HIV.E.DE163"
  * linkId = "HIV.E.DE163"
  * type = #date
  * text = "Infant's co-trimoxazole prophylaxis start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * linkId = "HIV.E.DE164"
  * type = #decimal
  * text = "Infant age at co-trimoxazole prophylaxis start (months)"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#mo "mo"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "birthDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%infantProphylaxis.parameter.where(name = 'birthDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "ageStartDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%infantProphylaxis.parameter.where(name = 'ctxStartDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.name = "startDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE163').answer.value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.name = "ages"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.expression = "%infantProphylaxis.parameter.where(name = 'ageAtCtxStart').value.ofType(decimal)"
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%birthDates.count() = 1 and %ageStartDates.count() = 1 and %startDates.count() = 1 and %ages.count() = 1, iif(%birthDates.toString().length() = 10 and %ageStartDates.toString().length() = 10 and %startDates = %ageStartDates and %ageStartDates.toDate() >= %birthDates.toDate() and %ageStartDates.toDate() <= (%birthDates.toDate() + 24 months) and %ageStartDates.toDate() <= today(), %ages.where($this >= 0 and $this <= 24), {}), {})"
* item[+]
  * id = "HIV.E.DE165"
  * linkId = "HIV.E.DE165"
  * type = #boolean
  * text = "Presumptive clinical diagnosis of severe HIV infection in infants"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE166"
  * linkId = "HIV.E.DE166"
  * type = #boolean
  * text = "Infant ARV prophylaxis"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE167"
  * linkId = "HIV.E.DE167"
  * type = #date
  * text = "Infant ARV prophylaxis start date"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE166"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
