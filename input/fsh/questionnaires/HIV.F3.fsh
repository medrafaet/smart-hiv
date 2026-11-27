Instance: HIV.F3CaptureOrUpdateInfantSChildSHistory
InstanceOf: sdc-questionnaire-extr-smap
Title: "Capture or update infant's/child's history"
Description: "Questionnaire for capture or update infant's/child's history"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "pmtct-infant-measurements-3"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record birth weight in grams and birth length and head circumference in whole centimetres."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.E.DE97').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = 'g' and value > 0 and comparator.empty()) and
  %resource.item.where(linkId = 'HIV.E.DE99').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = 'cm' and value > 0 and comparator.empty() and value mod 1 = 0) and
  %resource.item.where(linkId = 'HIV.E.DE100').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = 'cm' and value > 0 and comparator.empty() and value mod 1 = 0)
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "pmtct-infant-history-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Use today or an earlier date for recorded infant feeding, counselling and prophylaxis events."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE123' | 'HIV.E.DE131' | 'HIV.E.DE133' | 'HIV.E.DE140')).answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"

* item[+]
  * id = "HIV.E.DE97"
  * linkId = "HIV.E.DE97"
  * type = #quantity
  * text = "Birth weight"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#g "g"
* item[+]
  * id = "HIV.E.DE98"
  * linkId = "HIV.E.DE98"
  * type = #boolean
  * text = "Low birth weight"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "validBirthWeight"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE97').answer.value.ofType(Quantity).where(system = 'http://unitsofmeasure.org' and code = 'g' and value > 0 and comparator.empty())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%validBirthWeight.count() = 1"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%validBirthWeight.count() = 1, %validBirthWeight.value < 2500, {})"
* item[+]
  * id = "HIV.E.DE99"
  * linkId = "HIV.E.DE99"
  * type = #quantity
  * text = "Length of infant"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#cm "cm"
* item[+]
  * id = "HIV.E.DE100"
  * linkId = "HIV.E.DE100"
  * type = #quantity
  * text = "Head circumference"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#cm "cm"
* item[+]
  * id = "HIV.E.DE119"
  * linkId = "HIV.E.DE119"
  * type = #boolean
  * text = "Postpartum family planning counselling conducted"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE121"
  * linkId = "HIV.E.DE121"
  * type = #boolean
  * text = "ARV adherence counselling"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE122"
  * linkId = "HIV.E.DE122"
  * type = #boolean
  * text = "Infant feeding counselling provided"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE123"
  * linkId = "HIV.E.DE123"
  * type = #date
  * text = "Date infant feeding counselling provided"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE122"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE124"
  * linkId = "HIV.E.DE124"
  * type = #boolean
  * text = "Malaria prevention counselling conducted"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE125"
  * linkId = "HIV.E.DE125"
  * type = #boolean
  * text = "Insecticide treated bednet (ITN) provided or referred"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE126"
  * linkId = "HIV.E.DE126"
  * type = #boolean
  * text = "Maternal syphilis treatment"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE127"
  * linkId = "HIV.E.DE127"
  * type = #choice
  * text = "Infant feeding practice"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE127)
* item[+]
  * id = "HIV.E.DE131"
  * linkId = "HIV.E.DE131"
  * type = #date
  * text = "Infant feeding practice recorded date"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE127"
  * enableWhen.operator = #exists
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE132"
  * linkId = "HIV.E.DE132"
  * type = #boolean
  * text = "Stopped breastfeeding"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE133"
  * linkId = "HIV.E.DE133"
  * type = #date
  * text = "Date stopped breastfeeding"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE132"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE140"
  * linkId = "HIV.E.DE140"
  * type = #date
  * text = "Date infant ARV prophylaxis dispensed (or started)"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE178"
  * linkId = "HIV.E.DE178"
  * type = #date
  * text = "Birth cohort"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE179"
  * linkId = "HIV.E.DE179"
  * type = #boolean
  * text = "Registered in birth cohort"
  * required = false
  * repeats = false
  * readOnly = false
