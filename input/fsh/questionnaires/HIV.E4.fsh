Instance: HIV.E4TestMotherForHivUsingTestingAlgorithm
InstanceOf: sdc-questionnaire-extr-smap
Title: "Test mother for HIV using testing algorithm"
Description: "Records maternal HIV testing and the reported result after applying the national testing algorithm."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "pmtct-maternal-hiv-test-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record the test date when a maternal HIV test result is documented. Use the current time or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  (%resource.item.where(linkId = 'HIV.E.DE104').answer.value.ofType(Coding).exists() implies %resource.item.where(linkId = 'HIV.E.DE103').answer.value.ofType(dateTime).exists()) and
  %resource.item.where(linkId = 'HIV.E.DE103').answer.value.ofType(dateTime).where($this > now()).empty()
"""
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #maternalTest
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply one currentlyPregnant boolean for the maternal client at this test. Supply empty Parameters when pregnancy status is unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "pmtct-dual-test-pregnancy"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "The workbook selects the dual HIV and syphilis test only when pregnancy is documented."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE168').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE172')).exists() implies (%resource.item.where(linkId = 'maternalPregnancyAtTest').answer.value.ofType(boolean).count() = 1 and %resource.item.where(linkId = 'maternalPregnancyAtTest').answer.value.ofType(boolean).where($this = true).exists())"

* item[+]
  * id = "HIV.E.DE101"
  * linkId = "HIV.E.DE101"
  * type = #boolean
  * text = "Mother HIV test conducted"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.E.DE104').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE105' | 'HIV.E.DE106' | 'HIV.E.DE107')).count() = 1, true, {})"
* item[+]
  * id = "HIV.E.DE102"
  * linkId = "HIV.E.DE102"
  * type = #boolean
  * text = "Mother HIV test ordered"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE103"
  * linkId = "HIV.E.DE103"
  * type = #dateTime
  * text = "Mother HIV test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE104"
  * linkId = "HIV.E.DE104"
  * type = #choice
  * text = "Maternal HIV test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE104)
* item[+]
  * linkId = "maternalPregnancyAtTest"
  * type = #boolean
  * text = "Pregnant at time of HIV testing"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "verified"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%maternalTest.parameter.where(name = 'currentlyPregnant').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%verified.count() = 1, %verified, {})"
* item[+]
  * id = "HIV.E.DE168"
  * linkId = "HIV.E.DE168"
  * type = #choice
  * text = "HIV test type"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE168)
* item[+]
  * id = "HIV.E.DE194"
  * linkId = "HIV.E.DE194"
  * type = #choice
  * text = "Assay number in testing strategy"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE194)
* item[+]
  * id = "HIV.E.DE200"
  * linkId = "HIV.E.DE200"
  * type = #choice
  * text = "Test result of HIV assay 1"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE200)
  * enableWhen.question = "HIV.E.DE194"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE196
* item[+]
  * id = "HIV.E.DE204"
  * linkId = "HIV.E.DE204"
  * type = #choice
  * text = "Test result of HIV assay 2"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE204)
  * enableWhen.question = "HIV.E.DE194"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE197
* item[+]
  * id = "HIV.E.DE208"
  * linkId = "HIV.E.DE208"
  * type = #choice
  * text = "Test result of HIV assay 3"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE208)
  * enableWhen.question = "HIV.E.DE194"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE198
* item[+]
  * id = "HIV.E.DE212"
  * linkId = "HIV.E.DE212"
  * type = #choice
  * text = "Test result of HIV assay 1 repeated"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE212)
  * enableWhen.question = "HIV.E.DE194"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE199
* item[+]
  * id = "HIV.E.DE216"
  * linkId = "HIV.E.DE216"
  * type = #choice
  * text = "Test result of syphilis assay 1"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE216-capture)
* item[+]
  * linkId = "HIV.E.ET.DE222"
  * type = #choice
  * text = "Maternal hepatitis B assay 1 result"
  * answerValueSet = Canonical(HIV.E.ET.DE222)
