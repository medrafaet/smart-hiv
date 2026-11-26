Instance: HIV.B7TestForHivUsingTestingAlgorithm
InstanceOf: sdc-questionnaire-extr-smap
Title: "Test for HIV using testing algorithm"
Description: "Captures assay results, the overall test result, and the HIV status reported after applying the national testing algorithm."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #htsConfirmationFacilities
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Application-supplied MFR organizations eligible to confirm an HIV test. Supply each as a confirmationFacility parameter resource, or supply empty Parameters when none are available."

* item[+]
  * id = "HIV.B.DE79"
  * linkId = "HIV.B.DE79"
  * type = #boolean
  * text = "HIV test ordered"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE81"
  * linkId = "HIV.B.DE81"
  * type = #choice
  * text = "HIV test type"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE81)
* item[+]
  * id = "HIV.B.DE87"
  * linkId = "HIV.B.DE87"
  * type = #dateTime
  * text = "Date HIV test sent"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE88"
  * linkId = "HIV.B.DE88"
  * type = #choice
  * text = "Assay number in testing strategy"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE88)
* item[+]
  * id = "HIV.B.DE94"
  * linkId = "HIV.B.DE94"
  * code = HIVConcepts#HIV.SURV.21
  * type = #choice
  * text = "Test result of HIV assay 1"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE94)
* item[+]
  * id = "HIV.B.DE98"
  * linkId = "HIV.B.DE98"
  * type = #choice
  * text = "Test result of HIV assay 2"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE98)
* item[+]
  * id = "HIV.B.DE102"
  * linkId = "HIV.B.DE102"
  * type = #choice
  * text = "Test result of HIV assay 3"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE102)
* item[+]
  * id = "HIV.B.DE106"
  * linkId = "HIV.B.DE106"
  * type = #choice
  * text = "Test result of HIV assay 1 repeated"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE106)
* item[+]
  * id = "HIV.B.DE110"
  * linkId = "HIV.B.DE110"
  * code = HIVConcepts#HIV.SURV.1
  * type = #date
  * text = "HIV test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE111"
  * linkId = "HIV.B.DE111"
  * code = HIVConcepts#HIV.SURV.2
  * type = #choice
  * text = "HIV test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE111)
* item[+]
  * id = "HIV.B.DE80"
  * linkId = "HIV.B.DE80"
  * type = #boolean
  * text = "HIV test conducted"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.B.DE111').answer.value.ofType(Coding).where(code.exists()).exists()"
* item[+]
  * id = "HIV.B.DE115"
  * linkId = "HIV.B.DE115"
  * type = #choice
  * text = "HIV status"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE115)
* item[+]
  * id = "HIV.B.DE68"
  * linkId = "HIV.B.DE68"
  * type = #choice
  * text = "HIV serotype"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE68)
  * enableWhen.question = "HIV.B.DE115"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE116
* item[+]
  * id = "HIV.B.DE119"
  * linkId = "HIV.B.DE119"
  * type = #date
  * text = "Date positive HIV test confirmed"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE111"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE112
* item[+]
  * id = "HIV.B.DE120"
  * linkId = "HIV.B.DE120"
  * type = #reference
  * text = "Site where positive HIV test confirmed"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE111"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE112
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Organization
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = Canonical(HivHtsDiagnosingFacilityOrganization)
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%htsConfirmationFacilities.parameter.where(name = 'confirmationFacility').resource.ofType(Organization)"
* item[+]
  * id = "HIV.B.DE129"
  * linkId = "HIV.B.DE129"
  * type = #boolean
  * text = "Partner HIV test conducted"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE130"
  * linkId = "HIV.B.DE130"
  * type = #boolean
  * text = "Partner HIV test ordered"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE131"
  * linkId = "HIV.B.DE131"
  * type = #dateTime
  * text = "Partner HIV test date"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE129"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE132"
  * linkId = "HIV.B.DE132"
  * type = #choice
  * text = "Partner HIV test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE132)
  * enableWhen.question = "HIV.B.DE129"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
