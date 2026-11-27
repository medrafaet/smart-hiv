Instance: HIV.D23Prescribe
InstanceOf: sdc-questionnaire-extr-smap
Title: "Prescribe"
Description: "Records regimen changes and the medications documented as prescribed or dispensed during the visit."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #carePrescribing
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply approved ART regimen choices as repeated artRegimen codings and approved other medication choices as repeated medication codings. Supply one regimenSubstitutionRecommended and one doseAdjustmentRecommended boolean when verified national decision-support outputs are available. Supply empty Parameters when context is unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "approvedMedications"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%carePrescribing.parameter.where(name = 'medication').value.ofType(Coding).where(system.exists() and code.exists())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "care-prescribed-quantity-unit"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record a positive quantity and its prescribed unit or frequency period. Use whole numbers for the co-trimoxazole dose and frequency."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.repeat(item).where(linkId in ('HIV.D.DE441' | 'HIV.D.DE463' | 'HIV.D.DE464')).answer.value.ofType(Quantity).all(
    value.exists() and value > 0 and comparator.empty() and (unit.where(trim().length() > 0).exists() or (system.exists() and code.exists()))) and
  %resource.repeat(item).where(linkId in ('HIV.D.DE441' | 'HIV.D.DE464')).answer.value.ofType(Quantity).all(value mod 1 = 0)
"""

* item[+]
  * linkId = "HIV.D.DE429"
  * type = #boolean
  * text = "Regimen switch made"
* item[+]
  * linkId = "HIV.D.DE430"
  * type = #choice
  * text = "Reason for regimen switch"
  * repeats = true
  * answerValueSet = Canonical(HIV.D.DE430)
  * enableWhen.question = "HIV.D.DE429"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "HIV.D.DE435"
  * type = #string
  * text = "Other reason for regimen switch (specify)"
  * required = true
  * enableWhen.question = "HIV.D.DE430"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE434
* item[+]
  * linkId = "HIV.D.DE436"
  * type = #boolean
  * text = "Regimen substitution recommended"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "recommendation"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%carePrescribing.parameter.where(name = 'regimenSubstitutionRecommended').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%recommendation.count() = 1, %recommendation, {})"
* item[+]
  * linkId = "HIV.D.DE437"
  * type = #boolean
  * text = "Dose adjustment recommended"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "recommendation"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%carePrescribing.parameter.where(name = 'doseAdjustmentRecommended').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%recommendation.count() = 1, %recommendation, {})"
* item[+]
  * linkId = "HIV.D.DE438"
  * type = #boolean
  * text = "Regimen substitution made"
* item[+]
  * linkId = "HIV.D.DE439"
  * type = #date
  * text = "Co-trimoxazole prophylaxis start date"
* item[+]
  * linkId = "HIV.D.DE440"
  * type = #date
  * text = "Co-trimoxazole prophylaxis completion date"
* item[+]
  * linkId = "HIV.D.DE441"
  * type = #quantity
  * text = "Co-trimoxazole prophylaxis dosage"
* item[+]
  * linkId = "HIV.D.DE442"
  * type = #integer
  * text = "Number of days of co-trimoxazole prescribed"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#d "d"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * linkId = "suspectedTreatmentFailure"
  * type = #boolean
  * text = "Suspicion of treatment failure"
* item[+]
  * linkId = "documentedTreatmentInterruption"
  * type = #boolean
  * text = "Treatment interruption of at least 28 days"
* item[+]
  * linkId = "HIV.D.DE444"
  * type = #choice
  * text = "ART regimen prescribed"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%carePrescribing.parameter.where(name = 'artRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * linkId = "HIV.D.DE445"
  * type = #boolean
  * text = "Antiretroviral toxicity"
* item[+]
  * linkId = "prescribedMedication"
  * type = #group
  * text = "Other medication prescribed"
  * repeats = true
  * item[+]
    * linkId = "HIV.D.DE457"
    * type = #choice
    * text = "Medication prescribed"
    * required = true
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%approvedMedications"
  * item[+]
    * linkId = "HIV.D.DE458"
    * type = #date
    * text = "Date medication prescribed"
  * item[+]
    * linkId = "HIV.D.DE459"
    * type = #integer
    * text = "Number of doses prescribed per administration"
    * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
  * item[+]
    * linkId = "HIV.D.DE460"
    * type = #integer
    * text = "Number of days of medication prescribed"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#d "d"
    * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * linkId = "dispensedMedication"
  * type = #group
  * text = "Other medication dispensed"
  * repeats = true
  * item[+]
    * linkId = "HIV.D.DE461"
    * type = #choice
    * text = "Medication dispensed"
    * required = true
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
    * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%approvedMedications"
  * item[+]
    * linkId = "HIV.D.DE462"
    * type = #integer
    * text = "Number of days of medication dispensed"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#d "d"
    * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
  * item[+]
    * linkId = "HIV.D.DE463"
    * type = #quantity
    * text = "Dosage"
  * item[+]
    * linkId = "HIV.D.DE464"
    * type = #quantity
    * text = "Frequency"
* item[+]
  * linkId = "HIV.D.DE1019"
  * type = #choice
  * text = "TB status at ART start"
  * answerValueSet = Canonical(HIV.D.DE1019)
