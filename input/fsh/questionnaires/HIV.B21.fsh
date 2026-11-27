Instance: HIV.B21OfferPreventionOptions
InstanceOf: sdc-questionnaire-extr-smap
Title: "Offer prevention options"
Description: "Records documented VMMC and OAMT service events when offering HIV prevention options."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "prevention-oamt-events"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record OAMT events as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.repeat(item).where(linkId in ('HIV.PRV.DE17' | 'HIV.PRV.DE18' | 'HIV.PRV.DE19')).answer.value.ofType(date)
    .all($this <= today().toString().substring(0, $this.toString().length()).toDate())
"""

* item[+]
  * id = "HIV.B.DE197"
  * linkId = "HIV.B.DE197"
  * type = #boolean
  * text = "VMMC procedure"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE198"
  * linkId = "HIV.B.DE198"
  * type = #date
  * text = "VMMC procedure date"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE197"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE199"
  * linkId = "HIV.B.DE199"
  * type = #boolean
  * text = "Adverse event reported from a VMMC"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE200"
  * linkId = "HIV.B.DE200"
  * type = #boolean
  * text = "Serious adverse event"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE199"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE201"
  * linkId = "HIV.B.DE201"
  * type = #choice
  * text = "Adverse event severity"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE201)
  * enableWhen.question = "HIV.B.DE199"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE204"
  * linkId = "HIV.B.DE204"
  * type = #choice
  * text = "Timing of adverse event"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE204)
  * enableWhen.question = "HIV.B.DE199"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE207"
  * linkId = "HIV.B.DE207"
  * type = #choice
  * text = "Type of adverse VMMC event"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE207)
  * enableWhen.question = "HIV.B.DE199"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE223"
  * linkId = "HIV.B.DE223"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE207"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE222

* item[+]
  * linkId = "oamtServiceDates"
  * type = #group
  * text = "Documented opioid agonist maintenance treatment (OAMT) events"
  * item[+]
    * linkId = "HIV.PRV.DE17"
    * type = #date
    * text = "Date OAMT initiated"
    * code = HIVConcepts#HIV.PRV.DE17
  * item[+]
    * linkId = "HIV.PRV.DE18"
    * type = #date
    * text = "Date OAMT dose received"
    * code = HIVConcepts#HIV.PRV.DE18
  * item[+]
    * linkId = "HIV.PRV.DE19"
    * type = #date
    * text = "Date OAMT take-away doses dispensed"
    * code = HIVConcepts#HIV.PRV.DE19
