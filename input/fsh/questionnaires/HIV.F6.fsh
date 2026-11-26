Instance: HIV.F6CheckWhetherInfantChildHadHivExposure
InstanceOf: sdc-questionnaire-extr-smap
Title: "Check whether infant/child had HIV exposure"
Description: "Records the infant's documented HIV exposure and whether breastfeeding continues."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.E.DE108"
  * linkId = "HIV.E.DE108"
  * type = #choice
  * text = "Infant or child exposure to HIV"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE108)
* item[+]
  * id = "HIV.E.DE112"
  * linkId = "HIV.E.DE112"
  * type = #boolean
  * text = "HIV-exposed infant is still breastfeeding"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE108"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE110
* item[+]
  * linkId = "HIV.SURV.20"
  * type = #boolean
  * text = "HIV-exposed infant or child"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
  * code = HIVConcepts#HIV.SURV.20
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "exposureAnswers"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE108').answer.value.ofType(Coding)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = """
    iif(%exposureAnswers.count() = 1,
      %exposureAnswers.where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE109' | 'HIV.E.DE110'))
        .select(code = 'HIV.E.DE110'), {})
    """
