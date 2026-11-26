Instance: HIV.C3CaptureOrUpdateClientHistory
InstanceOf: sdc-questionnaire-extr-smap
Title: "Capture or update client history"
Description: "Captures reported exposure, PrEP use, PEP history, and evidence relevant to assessment."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "prep-exposure-duration"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Enter the exposure duration in hours as a nonnegative number."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.C.DE9').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = 'h' and value.exists() and comparator.empty() and value >= 0)"

* item[+]
  * id = "HIV.C.DE8"
  * linkId = "HIV.C.DE8"
  * type = #boolean
  * text = "Contact with and (suspected) exposure to HIV"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.ET.DE1"
  * linkId = "HIV.C.ET.DE1"
  * type = #choice
  * text = "Source of exposure"
  * required = true
  * repeats = false
  * answerValueSet = Canonical(HIV.C.ET.DE1)
  * enableWhen.question = "HIV.C.DE8"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.C.ET.DE8"
  * linkId = "HIV.C.ET.DE8"
  * type = #string
  * text = "Other exposure source (specify)"
  * required = true
  * repeats = false
  * enableWhen.question = "HIV.C.ET.DE1"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.ET.DE7
* item[+]
  * id = "HIV.C.DE9"
  * linkId = "HIV.C.DE9"
  * type = #quantity
  * text = "Exposure duration (hours)"
  * required = true
  * repeats = false
  * enableWhen.question = "HIV.C.DE8"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#h "hours"
* item[+]
  * id = "HIV.C.DE10"
  * linkId = "HIV.C.DE10"
  * type = #boolean
  * text = "Currently on PrEP"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.DE11"
  * linkId = "HIV.C.DE11"
  * type = #choice
  * text = "PrEP dosing type"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE11)
  * enableWhen.question = "HIV.C.DE10"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.C.DE17"
  * linkId = "HIV.C.DE17"
  * type = #choice
  * text = "Current PrEP regimen"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE17)
  * enableWhen.question = "HIV.C.DE10"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.C.DE24"
  * linkId = "HIV.C.DE24"
  * type = #choice
  * text = "Experience with PrEP"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE24)
* item[+]
  * id = "HIV.C.DE28"
  * linkId = "HIV.C.DE28"
  * type = #date
  * text = "PrEP start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.DE29"
  * linkId = "HIV.C.DE29"
  * type = #boolean
  * text = "Stopped PrEP"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.DE30"
  * linkId = "HIV.C.DE30"
  * type = #date
  * text = "Date PrEP stopped"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE29"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.C.DE31"
  * linkId = "HIV.C.DE31"
  * type = #choice
  * text = "PEP history"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE31)
* item[+]
  * id = "HIV.C.DE34"
  * linkId = "HIV.C.DE34"
  * type = #date
  * text = "Date(s) of past PEP use"
  * required = true
  * repeats = true
  * readOnly = false
  * enableWhen.question = "HIV.C.DE31"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE33
* item[+]
  * id = "HIV.C.DE35"
  * linkId = "HIV.C.DE35"
  * type = #date
  * text = "Date client completes PEP course"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.DE36"
  * linkId = "HIV.C.DE36"
  * type = #choice
  * text = "Evidence of substantial risk of HIV infection"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE36)
* item[+]
  * id = "HIV.C.DE46"
  * linkId = "HIV.C.DE46"
  * type = #choice
  * text = "Acute HIV infection symptoms"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE46)
* item[+]
  * id = "HIV.C.DE55"
  * linkId = "HIV.C.DE55"
  * type = #choice
  * text = "Sex partner's HIV treatment status"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE55)
* item[+]
  * id = "HIV.C.DE101"
  * linkId = "HIV.C.DE101"
  * type = #choice
  * text = "Alternative third PEP drug"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE101)
