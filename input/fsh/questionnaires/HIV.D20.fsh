RuleSet: CareDiagnosticsCd4
* item[+]
  * id = "HIV.D.DE364"
  * linkId = "HIV.D.DE364"
  * type = #integer
  * text = "CD4 count"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"{cells}/mm3" "{cells}/mm3"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.D.DE365"
  * linkId = "HIV.D.DE365"
  * type = #decimal
  * text = "CD4 cell percentage"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"%" "%"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueDecimal = 100
* item[+]
  * id = "HIV.D.DE366"
  * linkId = "HIV.D.DE366"
  * type = #dateTime
  * text = "Date of CD4 count test"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE367"
  * linkId = "HIV.D.DE367"
  * code = HIVConcepts#HIV.SURV.3
  * type = #decimal
  * text = "Baseline CD4 count"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"{cells}/mm3" "{cells}/mm3"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
* item[+]
  * id = "HIV.D.DE368"
  * linkId = "HIV.D.DE368"
  * code = HIVConcepts#HIV.SURV.4
  * type = #dateTime
  * text = "Date of baseline CD4 count test"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE369"
  * linkId = "HIV.D.DE369"
  * type = #boolean
  * text = "Late ART initiation (baseline CD4 measure)"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "baselineCd4"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE367').answer.value.where(($this is decimal or $this is integer) and $this >= 0)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%baselineCd4.count() = 1, %baselineCd4 < 200, {})"

RuleSet: DocumentedTbDiagnosticFindings
* item[+]
  * id = "HIV.D.DE1024"
  * linkId = "HIV.D.DE1024"
  * type = #boolean
  * text = "TB meningitis"
* item[+]
  * linkId = "HIV.D.ET.DE1024"
  * type = #boolean
  * text = "Documented multidrug-resistant TB (MDR-TB)"

RuleSet: DocumentedMaternalDiagnostics
* item[+]
  * id = "HIV.E.DE149"
  * linkId = "HIV.E.DE149"
  * type = #choice
  * text = "Maternal syphilis test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE149)
* item[+]
  * id = "HIV.E.DE153"
  * linkId = "HIV.E.DE153"
  * type = #boolean
  * text = "Hypertension"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE154"
  * linkId = "HIV.E.DE154"
  * type = #boolean
  * text = "Pre-eclampsia"
  * required = false
  * repeats = false
  * readOnly = false

Instance: HIV.D20Diagnostics
InstanceOf: sdc-questionnaire-extr-smap
Title: "Diagnostics"
Description: "Questionnaire for diagnostics"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* insert DiagnosticsLaboratoryConstraints

* insert CareDiagnosticsCd4
* item[+]
  * id = "HIV.D.DE387"
  * linkId = "HIV.D.DE387"
  * type = #integer
  * text = "Viral load test result"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE388"
  * linkId = "HIV.D.DE388"
  * type = #boolean
  * text = "Virally suppressed"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE389"
  * linkId = "HIV.D.DE389"
  * type = #date
  * text = "Date viral load test results received"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE390"
  * linkId = "HIV.D.DE390"
  * type = #date
  * text = "Viral load suppression date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE391"
  * linkId = "HIV.D.DE391"
  * type = #choice
  * text = "Reason for HIV viral load test"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE391)
* item[+]
  * id = "HIV.D.DE396"
  * linkId = "HIV.D.DE396"
  * type = #boolean
  * text = "Hepatitis B test required"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE397"
  * linkId = "HIV.D.DE397"
  * type = #boolean
  * text = "Hepatitis C test recommended"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE398"
  * linkId = "HIV.D.DE398"
  * type = #boolean
  * text = "Syphilis test required"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE399"
  * linkId = "HIV.D.DE399"
  * type = #choice
  * text = "Monitoring examinations"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE399)
* item[+]
  * id = "HIV.D.DE414"
  * linkId = "HIV.D.DE414"
  * type = #boolean
  * text = "Hepatitis C test ordered"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE415"
  * linkId = "HIV.D.DE415"
  * type = #boolean
  * text = "Syphilis test ordered"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE416"
  * linkId = "HIV.D.DE416"
  * type = #boolean
  * text = "Received viral load test results"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE417"
  * linkId = "HIV.D.DE417"
  * type = #date
  * text = "Date viral load test results received by client"
  * required = false
  * repeats = false
  * readOnly = false
* insert DocumentedTbDiagnosticFindings
* insert DocumentedMaternalDiagnostics
* insert DiagnosticsLaboratoryFields
