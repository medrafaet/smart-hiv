Instance: HIVConfigurationForm
InstanceOf: sdc-questionnaire-extr-smap
Title: "HIV programme and facility configuration"
Description: "Records approved epidemiology, facility capabilities, priority populations and reporting dates for a site."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Location
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #hivConfiguration
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply reportingFacility references to verified ET Base MFR Locations that the user may configure. Resolve the selected Location and use its MFR Location identifier as the reporting site ID for this preview."
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "verifiedReportingFacilities"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = """
  %hivConfiguration.parameter.where(name = 'reportingFacility').value.ofType(Reference)
    .where(reference.matches('(^|/)Location/[A-Za-z0-9.-]{1,64}(/_history/[A-Za-z0-9.-]{1,64})?$')
      and (type.empty() or type = 'Location' or type = 'http://hl7.org/fhir/StructureDefinition/Location'))
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "configuration-quantity-range"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Check the rates in their displayed units and keep percentages between 0 and 100."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.Config.DE1').answer.value.ofType(integer).all($this >= 0 and $this <= 100000) and
  %resource.item.where(linkId = 'HIV.Config.DE3').answer.value.ofType(integer).all($this >= 0 and $this <= 100) and
  %resource.item.where(linkId in ('HIV.Config.DE4' | 'HIV.Config.DE5' | 'HIV.Config.DE7' | 'HIV.Config.DE8' | 'HIV.Config.DE9' | 'HIV.Config.DE10')).answer.value.ofType(decimal).all($this >= 0 and $this <= 100)
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "configuration-reporting-facility"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Select the reporting site from the verified MFR Locations."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.Config.DE17').answer.value.ofType(Reference).all(reference.exists() and reference in %verifiedReportingFacilities.reference)
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "configuration-reporting-period"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "The reporting period end must be on or after its start."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = """
  (%resource.item.where(linkId = 'HIV.Config.DE20').answer.value.ofType(date) >= %resource.item.where(linkId = 'HIV.Config.DE21').answer.value.ofType(date)).where($this = false).empty()
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "configuration-special-needs"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "Select the population with special needs category before recording its groups."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.Config.ET.DE19').answer.value.exists()
    implies %resource.item.where(linkId = 'HIV.Config.DE19').answer.value.ofType(Coding)
      .where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.Config.ET.DE19').exists()
"""

* item[+]
  * linkId = "HIV.Config.DE17"
  * type = #reference
  * text = "Reporting health facility"
  * code = HIVConcepts#HIV.Config.DE17
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Location
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = "http://fhir.et/core/StructureDefinition/ethiopian-mfr-location"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%verifiedReportingFacilities"
* item[+]
  * linkId = "HIV.Config.DE1"
  * type = #integer
  * text = "National TB prevalence (cases per 100,000 people)"
  * code = HIVConcepts#HIV.Config.DE1
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueInteger = 100000
* item[+]
  * linkId = "HIV.Config.DE3"
  * type = #integer
  * text = "National HIV incidence without PrEP (cases per 100 person-years)"
  * code = HIVConcepts#HIV.Config.DE3
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueInteger = 100
* item[+]
  * linkId = "HIV.Config.DE4"
  * type = #decimal
  * text = "National prevalence of HIV (%)"
  * code = HIVConcepts#HIV.Config.DE4
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueDecimal = 100
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#% "percent"
* item[+]
  * linkId = "HIV.Config.DE5"
  * type = #decimal
  * text = "Prevalence of pretreatment NNRTI drug resistance (%)"
  * code = HIVConcepts#HIV.Config.DE5
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueDecimal = 100
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#% "percent"
* item[+]
  * linkId = "HIV.Config.DE7"
  * type = #decimal
  * text = "National prevalence of syphilis (%)"
  * code = HIVConcepts#HIV.Config.DE7
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueDecimal = 100
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#% "percent"
* item[+]
  * linkId = "HIV.Config.DE8"
  * type = #decimal
  * text = "National prevalence of hepatitis B (%)"
  * code = HIVConcepts#HIV.Config.DE8
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueDecimal = 100
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#% "percent"
* item[+]
  * linkId = "HIV.Config.DE9"
  * type = #decimal
  * text = "National prevalence of hepatitis C (%)"
  * code = HIVConcepts#HIV.Config.DE9
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueDecimal = 100
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#% "percent"
* item[+]
  * linkId = "HIV.Config.DE10"
  * type = #decimal
  * text = "Prevalence of HIV in woreda (%)"
  * code = HIVConcepts#HIV.Config.DE10
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueDecimal = 100
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#% "percent"
* item[+]
  * linkId = "HIV.Config.DE6"
  * type = #boolean
  * text = "Malaria-endemic setting"
  * code = HIVConcepts#HIV.Config.DE6
  * required = true
* item[+]
  * linkId = "HIV.Config.DE11"
  * type = #boolean
  * text = "Ultrasound available at the health facility"
  * code = HIVConcepts#HIV.Config.DE11
  * required = true
* item[+]
  * linkId = "HIV.Config.DE12"
  * type = #choice
  * text = "Programme-approved HIV burden of the setting"
  * code = HIVConcepts#HIV.Config.DE12
  * required = true
  * answerValueSet = Canonical(HIV.Config.DE12)
* item[+]
  * linkId = "HIV.Config.DE15"
  * type = #boolean
  * text = "HPV DNA testing operational at the health facility"
  * code = HIVConcepts#HIV.Config.DE15
  * required = true
* item[+]
  * linkId = "HIV.Config.DE16"
  * type = #boolean
  * text = "Routine viral load testing available at the health facility"
  * code = HIVConcepts#HIV.Config.DE16
  * required = true
* item[+]
  * linkId = "HIV.Config.DE19"
  * type = #choice
  * text = "Programme priority populations"
  * code = HIVConcepts#HIV.Config.DE19
  * repeats = true
  * answerValueSet = Canonical(HIV.Config.DE19)
* item[+]
  * linkId = "HIV.Config.ET.DE19"
  * type = #choice
  * text = "Populations with special needs"
  * code = HIVConcepts#HIV.Config.ET.DE19
  * repeats = true
  * answerValueSet = Canonical(HIV.Config.ET.DE19)
  * enableWhen.question = "HIV.Config.DE19"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.Config.ET.DE19
* item[+]
  * linkId = "HIV.Config.DE21"
  * type = #date
  * text = "Reporting period start date"
  * code = HIVConcepts#HIV.Config.DE21
* item[+]
  * linkId = "HIV.Config.DE20"
  * type = #date
  * text = "Reporting period end date"
  * code = HIVConcepts#HIV.Config.DE20
* item[+]
  * linkId = "HIV.Config.DE22"
  * type = #date
  * text = "Reporting date for a point-in-time survey"
  * code = HIVConcepts#HIV.Config.DE22
