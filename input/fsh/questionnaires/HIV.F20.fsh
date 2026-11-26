Instance: HIV.F20RecordInfantSChildSFinalHivDiagnosis
InstanceOf: sdc-questionnaire-extr-smap
Title: "Record infant's/child's final HIV diagnosis"
Description: "Questionnaire for record infant's/child's final HIV diagnosis"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #infantOutcome
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply one confirmed infantHivStatus Coding from HIV.E.DE225, one stillBreastfeeding boolean when documented, one finalNegativeTimingMet boolean from the verified assessment of the workbook’s follow-up timing, and one verified birthDateTime with a time zone when known. Supply the approved causes of death as repeated causeOfDeath Coding parameters. Supply empty Parameters when unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "pmtct-final-hiv-status"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Use confirmed infant HIV status for a positive or negative final diagnosis. A final negative outcome also requires documented cessation of breastfeeding and confirmation that the programme follow-up date was reached."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  (%resource.item.where(linkId = 'HIV.E.DE230').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE231')).exists() implies (%resource.item.where(linkId = 'verifiedInfantHivStatus').answer.value.ofType(Coding).count() = 1 and %resource.item.where(linkId = 'verifiedInfantHivStatus').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.E.DE226').exists())) and
  (%resource.item.where(linkId = 'HIV.E.DE230').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE232')).exists() implies (%resource.item.where(linkId = 'verifiedInfantHivStatus').answer.value.ofType(Coding).count() = 1 and %resource.item.where(linkId = 'verifiedInfantHivStatus').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.E.DE227').exists() and (%resource.item.where(linkId = 'verifiedInfantStillBreastfeeding').answer.value.ofType(boolean).count() = 1 and %resource.item.where(linkId = 'verifiedInfantStillBreastfeeding').answer.value.ofType(boolean).where($this = false).exists()) and %resource.item.where(linkId = 'verifiedFinalNegativeTimingMet').answer.value.ofType(boolean).count() = 1 and %resource.item.where(linkId = 'verifiedFinalNegativeTimingMet').answer.value.ofType(boolean).where($this = true).exists())) and
  (%resource.item.where(linkId = 'HIV.E.DE230').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE233')).exists() implies (%resource.item.where(linkId = 'verifiedInfantHivStatus').answer.value.ofType(Coding).count() <= 1 and (%resource.item.where(linkId = 'verifiedInfantHivStatus').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.E.DE226').exists() or %resource.item.where(linkId = 'verifiedInfantHivStatus').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.E.DE227').exists()).not()))
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "pmtct-infant-death-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Use the current time or earlier for the recorded death. A documented death time must be at or after birth."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE239').answer.value.ofType(dateTime).where($this > now()).empty() and iif(%resource.item.where(linkId = 'HIV.E.DE239').answer.value.ofType(dateTime).count() = 1 and %resource.item.where(linkId = 'verifiedInfantBirthTime').answer.value.ofType(dateTime).count() = 1, (%resource.item.where(linkId = 'HIV.E.DE239').answer.value.ofType(dateTime).toDateTime() >= %resource.item.where(linkId = 'verifiedInfantBirthTime').answer.value.ofType(dateTime).toDateTime()).where($this = false).empty(), true)"

* item[+]
  * linkId = "verifiedInfantHivStatus"
  * type = #choice
  * text = "Confirmed infant HIV status"
  * readOnly = true
  * answerValueSet = Canonical(HIV.E.DE225)
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "verified"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%infantOutcome.parameter.where(name = 'infantHivStatus').value.ofType(Coding)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%verified.count() = 1, %verified.where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE226' | 'HIV.E.DE227' | 'HIV.E.DE228')), {})"
* item[+]
  * linkId = "verifiedInfantStillBreastfeeding"
  * type = #boolean
  * text = "Infant still breastfeeding"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "verified"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%infantOutcome.parameter.where(name = 'stillBreastfeeding').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%verified.count() = 1, %verified, {})"
* item[+]
  * linkId = "verifiedFinalNegativeTimingMet"
  * type = #boolean
  * text = "Final negative outcome follow-up date reached"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "verified"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%infantOutcome.parameter.where(name = 'finalNegativeTimingMet').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%verified.count() = 1, %verified, {})"
* item[+]
  * linkId = "verifiedInfantBirthTime"
  * type = #dateTime
  * text = "Documented infant birth time"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "verified"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%infantOutcome.parameter.where(name = 'birthDateTime').value.ofType(dateTime)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%verified.count() = 1, %verified, {})"
* item[+]
  * id = "HIV.E.DE230"
  * linkId = "HIV.E.DE230"
  * type = #choice
  * text = "Final diagnosis of HIV-exposed infant"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE230)
* item[+]
  * id = "HIV.E.DE234"
  * linkId = "HIV.E.DE234"
  * type = #choice
  * text = "HIV-exposed infant reason for unknown final status"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE234)
  * enableWhen.question = "HIV.E.DE230"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE233
* item[+]
  * id = "HIV.E.DE239"
  * linkId = "HIV.E.DE239"
  * type = #dateTime
  * text = "Date of death of infant"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * linkId = "HIV.E.DE240"
  * type = #choice
  * text = "Documented cause of death of infant"
  * enableWhen.question = "HIV.E.DE239"
  * enableWhen.operator = #exists
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%infantOutcome.parameter.where(name = 'causeOfDeath').value.ofType(Coding).where(system.exists() and code.exists() and (system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.E.DE241').not())"
* item[+]
  * id = "HIV.E.DE241"
  * linkId = "HIV.E.DE241"
  * type = #boolean
  * text = "Infant died within 24 hours of childbirth"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "birthTimes"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'verifiedInfantBirthTime').answer.value.ofType(dateTime).where(toString().matches('T[0-9]{2}:[0-9]{2}:[0-9]{2}(\\.[0-9]+)?(Z|[+-][0-9]{2}:[0-9]{2})$'))"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "deathTimes"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE239').answer.value.ofType(dateTime).where(toString().matches('T[0-9]{2}:[0-9]{2}:[0-9]{2}(\\.[0-9]+)?(Z|[+-][0-9]{2}:[0-9]{2})$'))"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%birthTimes.count() = 1 and %deathTimes.count() = 1, iif(%deathTimes.toDateTime() >= %birthTimes.toDateTime() and %deathTimes.toDateTime() <= now(), %deathTimes.toDateTime() < (%birthTimes.toDateTime() + 24 hours), {}), {})"
* item[+]
  * id = "HIV.E.DE242"
  * linkId = "HIV.E.DE242"
  * type = #string
  * text = "Action(s) needed during infant follow-up visit"
  * required = false
  * repeats = false
  * readOnly = false
