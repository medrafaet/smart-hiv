Instance: HIV.D4ScreenForTb
InstanceOf: sdc-questionnaire-extr-smap
Title: "Screen for TB"
Description: "Records the documented TB screening, diagnostic tests and preventive treatment status."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true

* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "tb-screening-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record the TB screening date as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE990').answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "tb-screening-result-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Use the screening date for a symptom-only screening result. For other methods, use the documented result date on or after screening."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "iif((%resource.item.where(linkId = 'HIV.D.DE956').answer.value.ofType(Coding).exists() and %resource.item.where(linkId = 'HIV.D.DE956').answer.value.ofType(Coding).all(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE958' | 'HIV.D.DE959'))), (%resource.item.where(linkId = 'HIV.D.DE991').answer.value.ofType(date) = %resource.item.where(linkId = 'HIV.D.DE990').answer.value.ofType(date)).where($this = false).empty(), (%resource.item.where(linkId = 'HIV.D.DE991').answer.value.ofType(date) >= %resource.item.where(linkId = 'HIV.D.DE990').answer.value.ofType(date)).where($this = false).empty())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "tb-diagnostic-category"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Record the diagnostic test category when a diagnostic test, sample collection or test result date is entered."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.D.DE997').answer.value.exists() or %resource.item.where(linkId = 'HIV.D.DE998').answer.value.exists() or %resource.item.where(linkId = 'HIV.D.DE999').answer.value.exists()) implies %resource.item.where(linkId = 'HIV.D.DE992').answer.value.ofType(Coding).exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "tb-crp-units"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "Record a nonnegative CRP measurement in mg/L."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE1026').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = 'mg/L' and value >= 0 and comparator.empty())"

* item[+]
  * id = "HIV.D.DE972"
  * linkId = "HIV.D.DE972"
  * type = #boolean
  * text = "TB screening conducted"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE956"
  * linkId = "HIV.D.DE956"
  * type = #choice
  * text = "TB screening algorithm"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE956-capture)
  * enableWhen.question = "HIV.D.DE972"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE971"
  * linkId = "HIV.D.DE971"
  * type = #string
  * text = "Other TB screening algorithm (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE956"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE970
* item[+]
  * id = "HIV.D.DE973"
  * linkId = "HIV.D.DE973"
  * type = #choice
  * text = "Symptoms of TB"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE973)
* item[+]
  * id = "HIV.D.DE985"
  * linkId = "HIV.D.DE985"
  * type = #boolean
  * text = "History of contact with a person with TB"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE990"
  * linkId = "HIV.D.DE990"
  * type = #date
  * text = "TB screening date"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE972"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE986"
  * linkId = "HIV.D.DE986"
  * type = #choice
  * text = "TB screening result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE986-capture)
  * enableWhen.question = "HIV.D.DE972"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE991"
  * linkId = "HIV.D.DE991"
  * type = #date
  * text = "TB screening result date"
  * required = true
  * repeats = false
  * readOnly = false
  * enableBehavior = #all
  * enableWhen[0].question = "HIV.D.DE990"
  * enableWhen[=].operator = #exists
  * enableWhen[=].answerBoolean = true
  * enableWhen[+].question = "HIV.D.DE986"
  * enableWhen[=].operator = #exists
  * enableWhen[=].answerBoolean = true
* item[+]
  * id = "HIV.D.DE992"
  * linkId = "HIV.D.DE992"
  * type = #choice
  * text = "TB diagnostic test category"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE992)
* item[+]
  * id = "HIV.D.DE997"
  * linkId = "HIV.D.DE997"
  * type = #date
  * text = "TB diagnostic test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE998"
  * linkId = "HIV.D.DE998"
  * type = #date
  * text = "Test sample collection date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE999"
  * linkId = "HIV.D.DE999"
  * type = #date
  * text = "TB diagnostic test result date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE1025"
  * linkId = "HIV.D.DE1025"
  * type = #date
  * text = "C reactive protein test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE1026"
  * linkId = "HIV.D.DE1026"
  * type = #quantity
  * text = "C reactive protein test result"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#mg/L "mg/L"
* item[+]
  * id = "HIV.D.DE1027"
  * linkId = "HIV.D.DE1027"
  * type = #date
  * text = "C reactive protein test result date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE1034"
  * linkId = "HIV.D.DE1034"
  * type = #choice
  * text = "TB preventive treatment (TPT) status"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE1034)
* item[+]
  * id = "HIV.D.DE1028"
  * linkId = "HIV.D.DE1028"
  * type = #choice
  * text = "TPT regimen type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE1028-capture)
  * enableWhen.question = "HIV.D.DE1034"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE1036
