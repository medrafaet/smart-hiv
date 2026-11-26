Instance: HIV.F2TakeVitalSigns
InstanceOf: sdc-questionnaire-extr-smap
Title: "Take vital signs"
Description: "Questionnaire for take vital signs"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "pmtct-infant-measurements-2"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Use the specified unit for each positive infant measurement."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.E.DE95').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = 'cm' and value > 0 and comparator.empty()) and
  %resource.item.where(linkId = 'HIV.E.DE96').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = 'kg' and value > 0 and comparator.empty())
"""

* item[+]
  * id = "HIV.E.DE95"
  * linkId = "HIV.E.DE95"
  * type = #quantity
  * text = "Infant height"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#cm "cm"
* item[+]
  * id = "HIV.E.DE96"
  * linkId = "HIV.E.DE96"
  * type = #quantity
  * text = "Infant weight"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#kg "kg"
