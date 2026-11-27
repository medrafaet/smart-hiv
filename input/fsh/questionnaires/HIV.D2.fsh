Instance: HIV.D2TakeVitalSigns
InstanceOf: sdc-questionnaire-extr-smap
Title: "Take vital signs"
Description: "Records vital signs and anthropometry, including a reason when blood pressure cannot be taken."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "statureInCm"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE12').answer.value.ofType(Quantity).where(system = 'http://unitsofmeasure.org' and code = 'cm' and value > 0 and comparator.empty()).value"
* extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "weightInKg"
* extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE13').answer.value.ofType(Quantity).where(system = 'http://unitsofmeasure.org' and code = 'kg' and value > 0 and comparator.empty()).value"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "care-vital-units-and-values"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Use the listed units and a valid numeric measurement."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId in ('HIV.D.DE9')).answer.value.ofType(Quantity).all(system.where($this = 'http://unitsofmeasure.org').exists() and code.where($this = 'Cel').exists() and value.exists() and comparator.empty()) and
  %resource.item.where(linkId in ('HIV.D.DE10' | 'HIV.D.DE11')).answer.value.ofType(Quantity).all(system.where($this = 'http://unitsofmeasure.org').exists() and code.where($this = '/min').exists() and value.exists() and comparator.empty() and value >= 0 and value mod 1 = 0) and
  %resource.item.where(linkId in ('HIV.D.DE12' | 'HIV.D.ET.DE1' | 'HIV.D.ET.DE3')).answer.value.ofType(Quantity).all(system.where($this = 'http://unitsofmeasure.org').exists() and code.where($this = 'cm').exists() and value.exists() and comparator.empty() and value > 0) and
  %resource.item.where(linkId in ('HIV.D.DE13')).answer.value.ofType(Quantity).all(system.where($this = 'http://unitsofmeasure.org').exists() and code.where($this = 'kg').exists() and value.exists() and comparator.empty() and value > 0) and
  %resource.item.where(linkId in ('HIV.D.DE14' | 'HIV.D.DE15')).answer.value.ofType(Quantity).all(system.where($this = 'http://unitsofmeasure.org').exists() and code.where($this = 'mm[Hg]').exists() and value.exists() and comparator.empty() and value >= 0 and value mod 1 = 0)
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "care-blood-pressure-absent"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Record blood pressure readings or indicate that blood pressure could not be taken."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE16').answer.value.where($this = true).exists() implies (%resource.item.where(linkId = 'HIV.D.DE14').answer.value.empty() and %resource.item.where(linkId = 'HIV.D.DE15').answer.value.empty())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "care-vital-range-9"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #warning
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Verify the temperature. It falls outside the range in the October workbook."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE9').answer.value.ofType(Quantity).all(value >= 35 and value <= 42)"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "care-vital-range-12"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #warning
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "Verify the height. It falls outside the range in the October workbook."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE12').answer.value.ofType(Quantity).all(value >= 50 and value <= 250)"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[key].valueId = "care-vital-range-13"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[severity].valueCode = #warning
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[human].valueString = "Verify the weight. It falls outside the range in the October workbook."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE13').answer.value.ofType(Quantity).all(value <= 180)"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[key].valueId = "care-vital-range-14"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[severity].valueCode = #warning
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[human].valueString = "Verify the systolic pressure. It falls outside the range in the October workbook."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE14').answer.value.ofType(Quantity).all(value >= 60 and value <= 260)"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[key].valueId = "care-vital-range-15"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[severity].valueCode = #warning
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[human].valueString = "Verify the diastolic pressure. It falls outside the range in the October workbook."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE15').answer.value.ofType(Quantity).all(value <= 260)"

* item[+]
  * id = "HIV.D.DE9"
  * linkId = "HIV.D.DE9"
  * type = #quantity
  * text = "Body temperature"
  * required = false
  * repeats = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#Cel "Cel"
* item[+]
  * id = "HIV.D.DE10"
  * linkId = "HIV.D.DE10"
  * type = #quantity
  * text = "Respiratory rate"
  * required = false
  * repeats = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#/min "/min"
* item[+]
  * id = "HIV.D.DE11"
  * linkId = "HIV.D.DE11"
  * type = #quantity
  * text = "Heart rate"
  * required = false
  * repeats = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#/min "/min"
* item[+]
  * id = "HIV.D.DE12"
  * linkId = "HIV.D.DE12"
  * type = #quantity
  * text = "Body height"
  * required = false
  * repeats = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#cm "cm"
* item[+]
  * id = "HIV.D.DE13"
  * linkId = "HIV.D.DE13"
  * type = #quantity
  * text = "Body weight"
  * required = true
  * repeats = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#kg "kg"
* item[+]
  * id = "HIV.D.ET.DE1"
  * linkId = "HIV.D.ET.DE1"
  * type = #quantity
  * text = "Head circumference"
  * required = false
  * repeats = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#cm "cm"
* item[+]
  * id = "HIV.D.ET.DE3"
  * linkId = "HIV.D.ET.DE3"
  * type = #quantity
  * text = "Mid-upper arm circumference"
  * required = false
  * repeats = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#cm "cm"
* item[+]
  * id = "HIV.D.ET.DE2"
  * linkId = "HIV.D.ET.DE2"
  * type = #decimal
  * text = "Body mass index (kg/m²)"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#kg/m2 "kg/m2"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%statureInCm.exists() and %weightInKg.exists()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%statureInCm.exists() and %weightInKg.exists(), (%weightInKg / ((%statureInCm / 100) * (%statureInCm / 100))).round(2), {})"
* item[+]
  * id = "HIV.D.DE16"
  * linkId = "HIV.D.DE16"
  * type = #boolean
  * text = "Blood pressure cannot be taken"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE14"
  * linkId = "HIV.D.DE14"
  * type = #quantity
  * text = "Systolic blood pressure"
  * required = false
  * repeats = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#"mm[Hg]" "mm[Hg]"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE16').answer.value.where($this = true).empty()"
* item[+]
  * id = "HIV.D.DE15"
  * linkId = "HIV.D.DE15"
  * type = #quantity
  * text = "Diastolic blood pressure"
  * required = false
  * repeats = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#"mm[Hg]" "mm[Hg]"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE16').answer.value.where($this = true).empty()"
* item[+]
  * id = "HIV.D.DE532"
  * linkId = "HIV.D.DE532"
  * type = #choice
  * text = "Reason blood pressure reading not done"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE532)
  * enableWhen.question = "HIV.D.DE16"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE536"
  * linkId = "HIV.D.DE536"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE532"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE535
