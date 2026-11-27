RuleSet: CareRegimenReview
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #careRegimenReview
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply approved coded choices for documented regimens as repeated firstLineRegimen, secondLineRegimen and thirdLineRegimen Coding parameters. Supply visitDate and lastScheduledAppointmentDate as one date each for the appointment interval. Supply empty Parameters when choices are unavailable."

* item[+]
  * id = "HIV.D.DE418"
  * linkId = "HIV.D.DE418"
  * type = #choice
  * text = "Reason for ARV drug regimen substitution"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE418)
* item[+]
  * id = "HIV.D.DE426"
  * linkId = "HIV.D.DE426"
  * type = #string
  * text = "Other reason for regimen substitution (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE418"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE425
* item[+]
  * id = "HIV.D.DE427"
  * linkId = "HIV.D.DE427"
  * type = #boolean
  * text = "Switch to second-line ART regimen recommended"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE428"
  * linkId = "HIV.D.DE428"
  * type = #boolean
  * text = "Switch to third-line ART regimen recommended"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE466"
  * linkId = "HIV.D.DE466"
  * type = #choice
  * text = "Type of treatment-limiting toxicity or serious drug reaction"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE466)
* item[+]
  * id = "HIV.D.DE480"
  * linkId = "HIV.D.DE480"
  * type = #string
  * text = "Unexpected adverse drug reaction (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE466"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE479
* item[+]
  * linkId = "firstLineSubstitution"
  * type = #group
  * text = "Substitution within the first-line regimen"
  * repeats = true
  * item[+]
    * linkId = "HIV.D.DE481"
    * type = #date
    * text = "Date of substitution within first-line regimen"
  * item[+]
    * linkId = "HIV.D.DE482"
    * type = #choice
    * text = "Reason(s) for substitution within first-line regimen"
    * repeats = true
    * answerValueSet = Canonical(HIV.D.DE482)
  * item[+]
    * linkId = "HIV.D.DE483"
    * type = #choice
    * text = "New antiretroviral regimen after substitution within first-line regimen"
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careRegimenReview.parameter.where(name = 'firstLineRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * linkId = "secondLineSwitch"
  * type = #group
  * text = "Switch to a second-line regimen"
  * item[+]
    * linkId = "HIV.D.DE484"
    * type = #date
    * text = "Date of switch to second-line regimen"
  * item[+]
    * linkId = "HIV.D.DE485"
    * type = #choice
    * text = "New regimen after switch to second-line regimen"
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careRegimenReview.parameter.where(name = 'secondLineRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
  * item[+]
    * linkId = "HIV.D.DE486"
    * type = #choice
    * text = "Reason for switch to second-line regimen"
    * answerValueSet = Canonical(HIV.D.DE486)
* item[+]
  * linkId = "secondLineSubstitution"
  * type = #group
  * text = "Substitution within the second-line regimen"
  * repeats = true
  * item[+]
    * linkId = "HIV.D.DE487"
    * type = #date
    * text = "Date of substitution within second-line regimen"
  * item[+]
    * linkId = "HIV.D.DE488"
    * type = #choice
    * text = "Reason(s) for substitution within second-line regimen"
    * answerValueSet = Canonical(HIV.D.DE488)
  * item[+]
    * linkId = "HIV.D.DE489"
    * type = #choice
    * text = "New regimen after substitution within second-line regimen"
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careRegimenReview.parameter.where(name = 'secondLineRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * linkId = "thirdLineSwitch"
  * type = #group
  * text = "Switch to a third-line regimen"
  * item[+]
    * linkId = "HIV.D.DE490"
    * type = #date
    * text = "Date of switch to third-line regimen"
  * item[+]
    * linkId = "HIV.D.DE491"
    * type = #choice
    * text = "New regimen after switch to third-line regimen"
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careRegimenReview.parameter.where(name = 'thirdLineRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
  * item[+]
    * linkId = "HIV.D.DE492"
    * type = #choice
    * text = "Reason for switch to third-line regimen"
    * repeats = true
    * answerValueSet = Canonical(HIV.D.DE492)
* item[+]
  * linkId = "thirdLineSubstitution"
  * type = #group
  * text = "Substitution within the third-line regimen"
  * repeats = true
  * item[+]
    * linkId = "HIV.D.DE493"
    * type = #date
    * text = "Date of substitution within third-line regimen"
  * item[+]
    * linkId = "HIV.D.DE494"
    * type = #choice
    * text = "Reason(s) for substitution within third-line regimen"
    * repeats = true
    * answerValueSet = Canonical(HIV.D.DE494)
  * item[+]
    * linkId = "HIV.D.DE495"
    * type = #choice
    * text = "New regimen after substitution within third-line regimen"
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careRegimenReview.parameter.where(name = 'thirdLineRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * linkId = "malariaProphylaxisAssessment"
  * type = #group
  * text = "Malaria prophylaxis assessment"
  * item[+]
    * linkId = "HIV.D.DE643"
    * type = #boolean
    * text = "Malaria prophylaxis provided"
    * required = true
  * item[+]
    * linkId = "HIV.D.DE644"
    * type = #integer
    * text = "IPTp-SP dose number provided"
    * required = true
    * enableWhen.question = "HIV.D.DE643"
    * enableWhen.operator = #=
    * enableWhen.answerBoolean = true
    * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 1
  * item[+]
    * linkId = "HIV.D.DE645"
    * type = #date
    * text = "Date IPTp-SP dose provided"
    * enableWhen.question = "HIV.D.DE643"
    * enableWhen.operator = #=
    * enableWhen.answerBoolean = true
  * item[+]
    * linkId = "HIV.D.DE646"
    * type = #choice
    * text = "Reasons malaria prophylaxis was not provided"
    * repeats = true
    * answerValueSet = Canonical(HIV.D.DE646)
    * enableWhen.question = "HIV.D.DE643"
    * enableWhen.operator = #=
    * enableWhen.answerBoolean = false
  * item[+]
    * linkId = "HIV.D.DE651"
    * type = #string
    * text = "Other reason malaria prophylaxis was not provided (specify)"
    * required = true
    * enableWhen.question = "HIV.D.DE646"
    * enableWhen.operator = #=
    * enableWhen.answerCoding = HIVConcepts#HIV.D.DE650
* item[+]
  * linkId = "moreThan28DaysSinceLastScheduledAppointment"
  * code = HIVConcepts#HIV.SURV.16
  * type = #boolean
  * text = "More than 28 days since last scheduled appointment"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "lastScheduledDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careRegimenReview.parameter.where(name = 'lastScheduledAppointmentDate').value.ofType(date).select(toString())"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "visitDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%careRegimenReview.parameter.where(name = 'visitDate').value.ofType(date).select(toString())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = """
    iif(%lastScheduledDates.count() = 1 and %visitDates.count() = 1,
      iif(%lastScheduledDates.length() = 10 and %visitDates.length() = 10 and %lastScheduledDates.toDate() <= %visitDates.toDate(),
        %visitDates.toDate() > (%lastScheduledDates.toDate() + 28 days), {}), {})
    """
* item[+]
  * linkId = "HIV.D.DE760"
  * type = #boolean
  * text = "Eligible for DSD"
* item[+]
  * linkId = "HIV.D.DE761"
  * type = #date
  * text = "Date DSD eligibility assessed"
  * required = true
  * enableWhen.question = "HIV.D.DE760"
  * enableWhen.operator = #exists
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "HIV.D.DE762"
  * type = #boolean
  * text = "Currently enrolled in DSD ART model"
* item[+]
  * linkId = "HIV.D.DE763"
  * type = #date
  * text = "DSD start date"
  * required = true
  * enableWhen.question = "HIV.D.DE762"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "HIV.D.DE764"
  * type = #choice
  * text = "DSD models"
  * required = true
  * repeats = true
  * answerValueSet = Canonical(HIV.D.DE764)
  * enableWhen.question = "HIV.D.DE762"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "HIV.D.DE771"
  * type = #string
  * text = "Other DSD model (specify)"
  * required = true
  * enableWhen.question = "HIV.D.DE764"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE770

* item[+]
  * id = "HIV.D.DE903"
  * linkId = "HIV.D.DE903"
  * type = #choice
  * text = "Medication/drug"
  * repeats = true
  * answerValueSet = Canonical(HIV.D.DE903)
* item[+]
  * id = "HIV.D.DE932"
  * linkId = "HIV.D.DE932"
  * type = #string
  * text = "Other medication (specify)"
  * required = true
  * enableWhen.question = "HIV.D.DE903"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE931
* item[+]
  * id = "HIV.D.DE933"
  * linkId = "HIV.D.DE933"
  * type = #boolean
  * text = "Medication change recommended"
* item[+]
  * id = "HIV.D.DE1023"
  * linkId = "HIV.D.DE1023"
  * type = #boolean
  * text = "TB prevention services accepted"

Instance: HIV.D21DetermineRegimenAndTreatmentOptions
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine regimen and treatment options"
Description: "Questionnaire for determine regimen and treatment options"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true

* insert CareRegimenReview

Instance: HIV.D21CareRegimenReview
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine regimen and treatment options"
Description: "Records documented ART treatment options, regimen changes, DSD enrolment and medication review."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true

* insert CareRegimenReview
