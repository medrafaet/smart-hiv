Instance: HIV.B6CaptureOrUpdateClientHistory
InstanceOf: sdc-questionnaire-extr-smap
Title: "Capture or update client history"
Description: "Questionnaire for capture or update client history"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #htsHistory
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Application-supplied visit history. Use ageAtVisit (integer years) and gender (registration code) for age-based population options, hivStatus (Coding) for confirmed HIV status, firstPositiveTestDate (date) for the earliest confirmed positive test, and diagnosingFacility (repeated MFR Organization resources) for eligible diagnosing facilities. Supply empty Parameters when no history is available."
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "hasPositiveHivHistory"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%htsHistory.parameter.where(name = 'hivStatus').value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.B.DE116').exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "hts-gestational-age"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Enter gestational age between 4 and 40 weeks, or 28 and 280 days."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.B.DE30').answer.value.all(system = 'http://unitsofmeasure.org' and value.exists() and comparator.empty() and ((code = 'wk' and value >= 4 and value <= 40) or (code = 'd' and value >= 28 and value <= 280)))"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "hts-key-population"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "A key population type cannot be selected when key population membership is recorded as No."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.B.DE50').answer.value.where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.B.DE51' | 'HIV.B.DE54' | 'HIV.B.DE55')).exists() implies %resource.item.where(linkId = 'HIV.B.DE49').answer.value.where($this = false).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "hts-diagnosis-notification-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "The date informed of an HIV-positive diagnosis must be today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.B.DE65').answer.value.all($this <= today())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "prevention-history-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "Record prevention service and OAMT dates as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = """
  %resource.repeat(item).where(linkId in ('HIV.PRV.DE10' | 'HIV.PRV.DE24' | 'HIV.PRV.DE25')).answer.value.ofType(date)
    .all($this <= today().toString().substring(0, $this.toString().length()).toDate())
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[key].valueId = "prevention-access-pair"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[human].valueString = "Record the service and access date together for each prevention entry."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'preventionServiceAccess' and item.answer.value.exists()).all(
    item.where(linkId = 'HIV.PRV.DE2').answer.value.ofType(Coding).exists() and
    item.where(linkId = 'HIV.PRV.DE10').answer.value.ofType(date).exists())
"""

* item[+]
  * id = "HIV.B.DE29"
  * linkId = "HIV.B.DE29"
  * type = #boolean
  * text = "Currently pregnant"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE30"
  * linkId = "HIV.B.DE30"
  * type = #quantity
  * text = "Gestational age"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE29"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#wk "wk"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption][1].valueCoding = http://unitsofmeasure.org#d "d"
* item[+]
  * id = "HIV.B.DE31"
  * linkId = "HIV.B.DE31"
  * type = #date
  * text = "Expected date of delivery (EDD)"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE29"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE32"
  * linkId = "HIV.B.DE32"
  * type = #boolean
  * text = "Breastfeeding"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE33"
  * linkId = "HIV.B.DE33"
  * type = #choice
  * text = "Partner HIV status (reported)"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE33)
* item[+]
  * id = "HIV.B.DE37"
  * linkId = "HIV.B.DE37"
  * type = #choice
  * text = "Partner is from a population at high risk for HIV"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE37)
* item[+]
  * id = "HIV.B.DE43"
  * linkId = "HIV.B.DE43"
  * type = #boolean
  * text = "Has used an HIV self-test before (reported)"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE44"
  * linkId = "HIV.B.DE44"
  * type = #choice
  * text = "HIV self-test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE44)
  * enableWhen.question = "HIV.B.DE43"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE48"
  * linkId = "HIV.B.DE48"
  * type = #date
  * text = "Date of HIV self-test"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE43"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE49"
  * linkId = "HIV.B.DE49"
  * type = #boolean
  * text = "Key population member"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE50"
  * linkId = "HIV.B.DE50"
  * type = #choice
  * text = "Key and priority population member type"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE50)
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "ageAtVisit"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%htsHistory.parameter.where(name = 'ageAtVisit').value.ofType(integer)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%htsHistory.parameter.where(name = 'gender').value.ofType(code) = 'female', iif(%ageAtVisit >= 10 and %ageAtVisit < 20, 'HIV.B.DE56', iif(%ageAtVisit >= 20 and %ageAtVisit < 25, 'HIV.B.DE57', {})), {})"
* item[+]
  * id = "HIV.B.DE59"
  * linkId = "HIV.B.DE59"
  * type = #boolean
  * text = "Informed of HIV test result"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE60"
  * linkId = "HIV.B.DE60"
  * type = #date
  * text = "Date HIV test results returned"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE59"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE61"
  * linkId = "HIV.B.DE61"
  * type = #choice
  * text = "HIV exposure type"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE61)
* item[+]
  * id = "HIV.B.DE65"
  * linkId = "HIV.B.DE65"
  * type = #date
  * text = "Date informed of HIV-positive diagnosis"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%hasPositiveHivHistory"
* item[+]
  * id = "HIV.B.DE66"
  * linkId = "HIV.B.DE66"
  * type = #reference
  * text = "HIV diagnosing facility"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%hasPositiveHivHistory"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Organization
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = Canonical(HivHtsDiagnosingFacilityOrganization)
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%htsHistory.parameter.where(name = 'diagnosingFacility').resource.ofType(Organization)"
* item[+]
  * id = "HIV.B.DE67"
  * linkId = "HIV.B.DE67"
  * type = #date
  * text = "Date of first positive test indicative of HIV diagnosis"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%hasPositiveHivHistory"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%hasPositiveHivHistory, %htsHistory.parameter.where(name = 'firstPositiveTestDate').value.ofType(date), {})"
* item[+]
  * id = "HIV.B.DE136"
  * linkId = "HIV.B.DE136"
  * type = #choice
  * text = "Partner HIV status (confirmed)"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE136)
* item[+]
  * id = "HIV.B.DE140"
  * linkId = "HIV.B.DE140"
  * type = #boolean
  * text = "Partner on ART"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE141"
  * linkId = "HIV.B.DE141"
  * type = #boolean
  * text = "Partner virally suppressed on ART"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE140"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE225"
  * linkId = "HIV.B.DE225"
  * code[+] = HIVConcepts#HIV.B.DE225
  * code[+] = HIVConcepts#HIV.PRV.DE1
  * type = #boolean
  * text = "At elevated risk for HIV acquisition"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.H.DE33"
  * linkId = "HIV.H.DE33"
  * type = #boolean
  * text = "Partner or contact of index case"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.H.DE34"
  * linkId = "HIV.H.DE34"
  * type = #choice
  * text = "HIV status of partner or contact"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.H.DE34)
  * enableWhen.question = "HIV.H.DE33"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true

* item[+]
  * linkId = "preventionServiceAccess"
  * type = #group
  * text = "Prevention service accessed at this facility"
  * repeats = true
  * item[+]
    * linkId = "HIV.PRV.DE2"
    * type = #choice
    * text = "HIV prevention intervention"
    * code = HIVConcepts#HIV.PRV.DE2
    * required = true
    * answerValueSet = Canonical(HIV.PRV.DE2-capture)
  * item[+]
    * linkId = "HIV.PRV.DE10"
    * type = #date
    * text = "Documented date the client accessed this service"
    * code = HIVConcepts#HIV.PRV.DE10
    * required = true
  * item[+]
    * linkId = "HIV.PRV.DE9"
    * type = #string
    * text = "Other prevention service (specify)"
    * code = HIVConcepts#HIV.PRV.DE9
    * enableWhen.question = "HIV.PRV.DE2"
    * enableWhen.operator = #=
    * enableWhen.answerCoding = HIVConcepts#HIV.PRV.DE8
* item[+]
  * linkId = "HIV.PRV.DE11"
  * type = #choice
  * text = "HIV status of the client’s contact (reported)"
  * code = HIVConcepts#HIV.PRV.DE11
  * answerValueSet = Canonical(HIV.PRV.DE11)
* item[+]
  * linkId = "oamtHistory"
  * type = #group
  * text = "Documented opioid agonist maintenance treatment (OAMT) history"
  * item[+]
    * linkId = "HIV.PRV.DE20"
    * type = #boolean
    * text = "Currently on OAMT for the reporting period"
    * code = HIVConcepts#HIV.PRV.DE20
  * item[+]
    * linkId = "HIV.PRV.DE21"
    * type = #boolean
    * text = "Retained on OAMT for the reporting period"
    * code = HIVConcepts#HIV.PRV.DE21
  * item[+]
    * linkId = "HIV.PRV.DE22"
    * type = #boolean
    * text = "Currently being inducted on OAMT"
    * code = HIVConcepts#HIV.PRV.DE22
  * item[+]
    * linkId = "HIV.PRV.DE23"
    * type = #boolean
    * text = "Currently on reducing doses of OAMT"
    * code = HIVConcepts#HIV.PRV.DE23
  * item[+]
    * linkId = "HIV.PRV.DE24"
    * type = #date
    * text = "Date the first maintenance dose was received"
    * code = HIVConcepts#HIV.PRV.DE24
  * item[+]
    * linkId = "HIV.PRV.DE25"
    * type = #date
    * text = "Date of loss to follow-up or OAMT stopped"
    * code = HIVConcepts#HIV.PRV.DE25
