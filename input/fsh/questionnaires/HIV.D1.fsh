Instance: HIV.D1DetermineReasonForVisit
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine reason for visit"
Description: "Records the reasons for a Care and Treatment visit and whether it was scheduled."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #careVisit
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply facilityTestingEntryPoint as one HIV.D.DE746 Coding only when the testing service entry point for this visit is verified. Supply empty Parameters when it is unavailable."

* item[+]
  * id = "HIV.D.DE1"
  * linkId = "HIV.D.DE1"
  * type = #choice
  * text = "Reason for visit"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE1)
* item[+]
  * id = "HIV.D.DE8"
  * linkId = "HIV.D.DE8"
  * type = #boolean
  * text = "Scheduled visit"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE746"
  * linkId = "HIV.D.DE746"
  * type = #choice
  * text = "Entry point for facility-level testing"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE746)
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "facilityEntryPoints"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careVisit.parameter.where(name = 'facilityTestingEntryPoint').value.ofType(Coding).where(system = 'https://hiv.fhir.et/CodeSystem/HIVConcepts' and code in ('HIV.D.DE747' | 'HIV.D.DE748' | 'HIV.D.DE749' | 'HIV.D.DE750' | 'HIV.D.DE751' | 'HIV.D.DE752'))"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%facilityEntryPoints.count() = 1, %facilityEntryPoints, {})"
