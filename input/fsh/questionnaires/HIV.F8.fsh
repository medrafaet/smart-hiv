Instance: HIV.F8TestInfantChildForHivUsingTestingAlgorithm
InstanceOf: sdc-questionnaire-extr-smap
Title: "Test infant/child for HIV using testing algorithm"
Description: "Questionnaire for test infant/child for HIV using testing algorithm"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #infantHivTest
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply one verified birthDate and one testDate for this infant and HIV test, with ageInYears as the elapsed calendar days divided by 365.25. Use empty Parameters if the dates or age are unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "pmtct-infant-hiv-test-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record the HIV test date when a test result is documented. Use today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.E.DE186').answer.value.ofType(Coding).exists() or %resource.item.where(linkId = 'HIV.E.DE190').answer.value.ofType(Coding).exists() or %resource.item.where(linkId = 'HIV.E.ET.DE194').answer.value.ofType(Coding).exists() or %resource.item.where(linkId in ('HIV.E.ET.DE202' | 'HIV.E.ET.DE206' | 'HIV.E.ET.DE210' | 'HIV.E.ET.DE214')).answer.value.ofType(Coding).exists()) implies %resource.item.where(linkId = 'HIV.E.DE224').answer.value.ofType(date).exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "pmtct-infant-test-past"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Record the HIV test date as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE224')).answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "pmtct-eid-sample"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Record the sample number when an early infant diagnosis result is documented."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE186' | 'HIV.E.DE190')).answer.value.ofType(Coding).exists() implies %resource.item.where(linkId = 'HIV.E.DE180').answer.value.ofType(Coding).exists()"

* item[+]
  * linkId = "HIV.E.DE168"
  * type = #choice
  * text = "Infant HIV test type"
  * answerValueSet = Canonical(HIV.E.DE168-capture)
* item[+]
  * id = "HIV.E.DE224"
  * linkId = "HIV.E.DE224"
  * type = #date
  * text = "HIV test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE120"
  * linkId = "HIV.E.DE120"
  * type = #decimal
  * text = "Age of infant on HIV test date (years)"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#a "years"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "birthDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%infantHivTest.parameter.where(name = 'birthDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "ageTestDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%infantHivTest.parameter.where(name = 'testDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.name = "recordedTestDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE224').answer.value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.name = "verifiedAges"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.expression = "%infantHivTest.parameter.where(name = 'ageInYears').value.ofType(decimal)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = """
    iif(%birthDates.count() = 1 and %ageTestDates.count() = 1 and %recordedTestDates.count() = 1 and %verifiedAges.count() = 1,
      iif(%birthDates.toString().length() = 10 and %ageTestDates.toString().length() = 10 and %recordedTestDates = %ageTestDates and
        %birthDates.toDate() <= %ageTestDates.toDate() and %ageTestDates.toDate() <= today(), %verifiedAges.where($this >= 0), {}), {})
  """
* item[+]
  * id = "HIV.E.DE180"
  * linkId = "HIV.E.DE180"
  * type = #choice
  * text = "EID sample number"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE180)
  * enableWhen.question = "HIV.E.DE168"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE171
* item[+]
  * id = "HIV.E.DE183"
  * linkId = "HIV.E.DE183"
  * type = #choice
  * text = "EID test number"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE183)
  * enableWhen.question = "HIV.E.DE168"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE171
* item[+]
  * id = "HIV.E.DE186"
  * linkId = "HIV.E.DE186"
  * type = #choice
  * text = "EID test number 1 test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE186)
  * enableWhen.question = "HIV.E.DE183"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE184
* item[+]
  * id = "HIV.E.DE190"
  * linkId = "HIV.E.DE190"
  * type = #choice
  * text = "EID test number 2 test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE190)
  * enableWhen.question = "HIV.E.DE183"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE185
* item[+]
  * linkId = "HIV.E.ET.DE197"
  * type = #choice
  * text = "Child antibody assay number"
  * answerValueSet = Canonical(HIV.E.ET.DE197)
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE168').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE169' | 'HIV.E.DE170')).exists()"
* item[+]
  * linkId = "HIV.E.ET.DE202"
  * type = #choice
  * text = "Result for selected antibody assay"
  * answerValueSet = Canonical(HIV.E.ET.DE202)
  * enableWhen.question = "HIV.E.ET.DE197"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.ET.DE198
* item[+]
  * linkId = "HIV.E.ET.DE206"
  * type = #choice
  * text = "Result for selected antibody assay"
  * answerValueSet = Canonical(HIV.E.ET.DE206)
  * enableWhen.question = "HIV.E.ET.DE197"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.ET.DE199
* item[+]
  * linkId = "HIV.E.ET.DE210"
  * type = #choice
  * text = "Result for selected antibody assay"
  * answerValueSet = Canonical(HIV.E.ET.DE210)
  * enableWhen.question = "HIV.E.ET.DE197"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.ET.DE200
* item[+]
  * linkId = "HIV.E.ET.DE214"
  * type = #choice
  * text = "Result for selected antibody assay"
  * answerValueSet = Canonical(HIV.E.ET.DE214)
  * enableWhen.question = "HIV.E.ET.DE197"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.ET.DE201
* item[+]
  * linkId = "HIV.E.ET.DE194"
  * type = #choice
  * text = "Infant confirmatory antibody result"
  * answerValueSet = Canonical(HIV.E.ET.DE194)
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE168').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE169' | 'HIV.E.DE170')).exists()"
* item[+]
  * id = "HIV.E.DE225"
  * linkId = "HIV.E.DE225"
  * type = #choice
  * text = "Infant HIV status"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE225)
