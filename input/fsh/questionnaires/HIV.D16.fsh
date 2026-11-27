Instance: HIV.D16PerformOtherScreenings
InstanceOf: sdc-questionnaire-extr-smap
Title: "Perform other screenings"
Description: "Records documented nutrition assessment, other screening findings and treatment history."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #careOtherScreenings
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply ageAtVisit in completed years as one nonnegative integer, currentlyPregnant as one boolean, and muac as one UCUM cm Quantity from this visit when documented. Supply empty Parameters when context is unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "care-screening-muac-unit"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record a positive mid-upper arm circumference measurement in centimetres (UCUM cm)."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE884').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = 'cm' and value > 0 and comparator.empty())"

* item[+]
  * id = "HIV.D.DE884"
  * linkId = "HIV.D.DE884"
  * type = #quantity
  * text = "Mid-upper arm circumference (MUAC)"
  * required = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#cm "cm"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "agesAtVisit"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careOtherScreenings.parameter.where(name = 'ageAtVisit').value.ofType(integer)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "currentPregnancy"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%careOtherScreenings.parameter.where(name = 'currentlyPregnant').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "(%agesAtVisit.count() = 1 and %agesAtVisit.where($this >= 0 and $this < 5).exists()) or (%currentPregnancy.count() = 1 and %currentPregnancy.where($this = true).exists())"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.name = "visitMuac"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.expression = "%careOtherScreenings.parameter.where(name = 'muac').value.ofType(Quantity)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%visitMuac.count() = 1, %visitMuac.where(system = 'http://unitsofmeasure.org' and code = 'cm' and value > 0 and comparator.empty()), {})"
* item[+]
  * linkId = "HIV.D.ET.DE1288"
  * type = #boolean
  * text = "Nutrition assessment done"
* item[+]
  * linkId = "HIV.D.ET.DE1289"
  * type = #choice
  * text = "Nutritional status"
  * required = true
  * answerValueSet = Canonical(HIV.D.ET.DE1289)
  * enableWhen.question = "HIV.D.ET.DE1288"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "HIV.D.ET.DE1293"
  * type = #choice
  * text = "Nutrition support provided"
  * required = true
  * answerValueSet = Canonical(HIV.D.ET.DE1293)
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.D.ET.DE1289"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.D.ET.DE1291
  * enableWhen[+].question = "HIV.D.ET.DE1289"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.D.ET.DE1292
* item[+]
  * id = "HIV.D.DE885"
  * linkId = "HIV.D.DE885"
  * type = #date
  * text = "Date of start of fluconazole prophylaxis"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE886"
  * linkId = "HIV.D.DE886"
  * type = #boolean
  * text = "Fluconazole prophylaxis"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE887"
  * linkId = "HIV.D.DE887"
  * type = #date
  * text = "Date started cryptococcal meningitis treatment induction regimen"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE888"
  * linkId = "HIV.D.DE888"
  * type = #date
  * text = "Date completed cryptococcal meningitis treatment induction regimen"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE889"
  * linkId = "HIV.D.DE889"
  * type = #date
  * text = "Date started cryptococcal meningitis treatment maintenance regimen"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE890"
  * linkId = "HIV.D.DE890"
  * type = #date
  * text = "Date completed cryptococcal meningitis treatment maintenance regimen"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE891"
  * linkId = "HIV.D.DE891"
  * type = #date
  * text = "Date started cryptococcal meningitis treatment consolidation regimen"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE892"
  * linkId = "HIV.D.DE892"
  * type = #date
  * text = "Date completed cryptococcal meningitis treatment consolidation regimen"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE893"
  * linkId = "HIV.D.DE893"
  * type = #choice
  * text = "Staging of liver disease"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE893)
* item[+]
  * id = "HIV.D.DE896"
  * linkId = "HIV.D.DE896"
  * type = #boolean
  * text = "Advanced HIV disease"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE897"
  * linkId = "HIV.D.DE897"
  * type = #choice
  * text = "WHO functional status"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE897)
* item[+]
  * id = "HIV.D.DE901"
  * linkId = "HIV.D.DE901"
  * type = #boolean
  * text = "Tailored adherence counselling for advanced HIV disease"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE902"
  * linkId = "HIV.D.DE902"
  * type = #date
  * text = "Date(s) of tracing interventions"
  * required = false
  * repeats = true
  * readOnly = false
