RuleSet: CareFollowUp
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #careFollowUp
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply one nextAppointmentDate (date) and, when known, one nextAppointmentType (string) from the same verified scheduled appointment. Supply empty Parameters when there is no documented next appointment."

* item[+]
  * linkId = "followUpAppointment"
  * type = #group
  * text = "Follow-up appointment"
  * repeats = true
  * item[+]
    * linkId = "HIV.D.DE524"
    * type = #dateTime
    * text = "Date and time of follow-up appointment"
  * item[+]
    * linkId = "HIV.D.DE525"
    * type = #choice
    * text = "Type of follow-up appointment"
    * required = true
    * repeats = true
    * answerValueSet = Canonical(HIV.D.DE525)
  * item[+]
    * linkId = "HIV.D.DE530"
    * type = #string
    * text = "Other appointment type (specify)"
    * required = true
    * enableWhen.question = "HIV.D.DE525"
    * enableWhen.operator = #=
    * enableWhen.answerCoding = HIVConcepts#HIV.D.DE529
* item[+]
  * linkId = "HIV.D.DE531"
  * type = #date
  * text = "Follow-up test recommended date"
* item[+]
  * linkId = "HIV.D.DE776"
  * type = #date
  * text = "Date of next scheduled follow-up appointment"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "nextDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careFollowUp.parameter.where(name = 'nextAppointmentDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%nextDates.count() = 1, %nextDates, {})"
* item[+]
  * linkId = "HIV.D.DE777"
  * type = #string
  * text = "Type of next follow-up appointment"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "nextTypes"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careFollowUp.parameter.where(name = 'nextAppointmentType').value.ofType(string).where(trim().length() > 0)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%careFollowUp.parameter.where(name = 'nextAppointmentDate').value.ofType(date).count() = 1 and %nextTypes.count() = 1, %nextTypes, {})"

Instance: HIV.D29ScheduleFollowUp
InstanceOf: sdc-questionnaire-extr-smap
Title: "Schedule follow-up"
Description: "Questionnaire for schedule follow-up"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* status = #draft
* experimental = true

* insert CareFollowUp

Instance: HIV.D29CareFollowUp
InstanceOf: sdc-questionnaire-extr-smap
Title: "Schedule follow-up"
Description: "Records each follow-up appointment and the date a follow-up test is recommended."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* insert CareFollowUp
