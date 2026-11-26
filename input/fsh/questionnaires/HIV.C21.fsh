Instance: HIV.C21Diagnostics
InstanceOf: sdc-questionnaire-extr-smap
Title: "Diagnostics"
Description: "Records the serum creatinine test date and reported concentration."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "prep-serum-creatinine-result"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Enter the reported serum creatinine concentration with its laboratory unit."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.C.DE72').answer.value.ofType(Quantity).all(system.where($this = 'http://unitsofmeasure.org').exists() and code.where($this in ('mg/dL' | 'umol/L')).exists() and value.where($this >= 0).exists())"

* item[+]
  * id = "HIV.C.DE71"
  * linkId = "HIV.C.DE71"
  * type = #date
  * text = "Serum creatinine test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.DE72"
  * linkId = "HIV.C.DE72"
  * type = #quantity
  * text = "Serum creatinine test result"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#mg/dL "mg/dL"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption][1].valueCoding = http://unitsofmeasure.org#umol/L "µmol/L"
