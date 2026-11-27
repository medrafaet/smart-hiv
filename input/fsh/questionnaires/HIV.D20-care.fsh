Instance: HIV.D20CareDiagnostics
InstanceOf: sdc-questionnaire-extr-smap
Title: "Care and Treatment diagnostics"
Description: "Records CD4 results, viral load information, and tests planned or ordered during a Care and Treatment visit."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #careDiagnostics
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply verified numeric viral load results for this client, in copies/mL. Use latestViralLoad and priorViralLoad as integer parameters for the latest and immediately preceding final results. Supply latestViralLoadSampleCollection and priorViralLoadSampleCollection as dateTime parameters paired with those results. Supply hasPriorViralLoadResult as a boolean for whether a result is known before the test described in the reason field. Include each parameter once when known. Supply empty Parameters when context is unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "latestResult"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careDiagnostics.parameter.where(name = 'latestViralLoad').value.ofType(integer)"
* extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "latestSampleTime"
* extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%careDiagnostics.parameter.where(name = 'latestViralLoadSampleCollection').value.ofType(dateTime).select(toString())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "care-initial-viral-load"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Select Initial viral load test only after confirming there is no earlier viral load result for this client."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE391').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.D.DE394').exists() implies %resource.item.where(linkId = 'hasPriorViralLoadResult').answer.value.ofType(boolean).where($this = false).exists()"

* insert CareDiagnosticsCd4
* item[+]
  * linkId = "HIV.G.DE8"
  * type = #dateTime
  * text = "Date of latest viral load sample collection"
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%latestSampleTime.count() = 1, %latestSampleTime.toDateTime(), {})"
* item[+]
  * linkId = "HIV.G.DE12"
  * type = #integer
  * text = "Latest viral load test result"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"{copies}/mL" "{copies}/mL"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%latestResult.count() = 1, %latestResult.where($this >= 0), {})"
* item[+]
  * linkId = "HIV.D.DE389"
  * type = #date
  * text = "Date facility received or completed the viral load result"
* item[+]
  * linkId = "HIV.D.DE388"
  * code = HIVConcepts#HIV.SURV.14
  * type = #boolean
  * text = "Virally suppressed"
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%latestResult.count() = 1, %latestResult.where($this >= 0).select($this < 1000), {})"
* item[+]
  * linkId = "HIV.D.DE390"
  * type = #date
  * text = "Viral load suppression date"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "priorResult"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careDiagnostics.parameter.where(name = 'priorViralLoad').value.ofType(integer)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "priorSampleTime"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%careDiagnostics.parameter.where(name = 'priorViralLoadSampleCollection').value.ofType(dateTime).select(toString())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = """
    iif(%latestResult.count() = 1 and %priorResult.count() = 1 and %latestSampleTime.count() = 1 and %priorSampleTime.count() = 1,
      iif(%latestResult >= 0 and %latestResult < 1000 and %priorResult > 1000 and
        %latestSampleTime.length() >= 10 and %priorSampleTime.length() >= 10 and
        %latestSampleTime.toDateTime() > %priorSampleTime.toDateTime(),
        %latestSampleTime.substring(0, 10).toDate(), {}), {})
    """
* item[+]
  * linkId = "hasPriorViralLoadResult"
  * type = #boolean
  * text = "An earlier viral load result is on record"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "priorResultFlags"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careDiagnostics.parameter.where(name = 'hasPriorViralLoadResult').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%priorResultFlags.count() = 1, %priorResultFlags, {})"
* item[+]
  * linkId = "HIV.D.DE391"
  * type = #choice
  * text = "Reason for HIV viral load test"
  * answerValueSet = Canonical(HIV.D.DE391)
* item[+]
  * linkId = "HIV.D.DE396"
  * type = #boolean
  * text = "Hepatitis B test required"
  * required = true
* item[+]
  * linkId = "HIV.D.DE397"
  * type = #boolean
  * text = "Hepatitis C test recommended"
  * required = true
* item[+]
  * linkId = "HIV.D.DE398"
  * type = #boolean
  * text = "Syphilis test required"
  * required = true
* item[+]
  * linkId = "HIV.D.DE399"
  * type = #choice
  * text = "Monitoring examinations"
  * repeats = true
  * answerValueSet = Canonical(HIV.D.DE399)
* item[+]
  * linkId = "HIV.D.DE414"
  * type = #boolean
  * text = "Hepatitis C test ordered"
  * required = true
* item[+]
  * linkId = "HIV.D.DE415"
  * type = #boolean
  * text = "Syphilis test ordered"
  * required = true
* item[+]
  * linkId = "HIV.D.DE416"
  * type = #boolean
  * text = "Client received viral load test results"
* item[+]
  * linkId = "HIV.D.DE417"
  * type = #date
  * text = "Date client received the viral load test results"
  * enableWhen.question = "HIV.D.DE416"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* insert DocumentedTbDiagnosticFindings
* insert DocumentedMaternalDiagnostics
