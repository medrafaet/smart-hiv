Instance: HIV.H3RecordOutreachAndResult
InstanceOf: sdc-questionnaire-extr-smap
Title: "Record outreach and result"
Description: "Records the outreach result separately from the documented HIV treatment outcome."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #followUpRegistry
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply repeated transferFacility references to verified ET Base MFR Organizations offering ART. Supply empty Parameters when verified destinations are unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "eligibleTransferFacilities"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = """
  %followUpRegistry.parameter.where(name = 'transferFacility').value.ofType(Reference)
    .where(reference.matches('(^|/)Organization/[A-Za-z0-9.-]{1,64}(/_history/[A-Za-z0-9.-]{1,64})?$')
      and (type.empty() or type = 'Organization' or type = 'http://hl7.org/fhir/StructureDefinition/Organization'))
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "follow-up-event-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record documented event dates as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId in ('HIV.H.DE31' | 'HIV.H.DE38' | 'HIV.H.DE46' | 'HIV.H.DE48' | 'HIV.H.DE51' | 'HIV.H.DE73')).answer.value.ofType(date)
    .all($this <= today().toString().substring(0, $this.toString().length()).toDate())
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "follow-up-transfer-facility"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Select a receiving ART facility from the verified registry choices."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.H.DE50').answer.value.ofType(Reference).all(reference.exists() and reference in %eligibleTransferFacilities.reference)
"""

* item[+]
  * id = "HIV.H.DE23"
  * linkId = "HIV.H.DE23"
  * type = #choice
  * text = "Outcome from outreach attempt"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.H.DE23)
* item[+]
  * id = "HIV.H.DE30"
  * linkId = "HIV.H.DE30"
  * type = #boolean
  * text = "Moved from catchment area"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.H.DE31"
  * linkId = "HIV.H.DE31"
  * type = #date
  * text = "Date client moved from catchment area"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.H.DE30"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.H.DE32"
  * linkId = "HIV.H.DE32"
  * type = #string
  * text = "New catchment area"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.H.DE30"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.H.DE41"
  * linkId = "HIV.H.DE41"
  * type = #choice
  * text = "HIV treatment outcome"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.H.DE41)
* item[+]
  * id = "HIV.H.DE38"
  * linkId = "HIV.H.DE38"
  * type = #date
  * text = "Date of death"
  * required = false
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.H.DE23"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE29
  * enableWhen[+].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE44
* item[+]
  * id = "HIV.H.DE39"
  * linkId = "HIV.H.DE39"
  * type = #string
  * text = "Cause of death"
  * required = false
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.H.DE23"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE29
  * enableWhen[+].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE44
* item[+]
  * id = "HIV.H.DE40"
  * linkId = "HIV.H.DE40"
  * type = #string
  * text = "Place of death"
  * required = false
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.H.DE23"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE29
  * enableWhen[+].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE44
* item[+]
  * id = "HIV.H.DE46"
  * linkId = "HIV.H.DE46"
  * type = #date
  * text = "Date patient lost to follow-up"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.H.DE41"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.H.DE42
* item[+]
  * id = "HIV.H.DE48"
  * linkId = "HIV.H.DE48"
  * type = #date
  * text = "Date HIV treatment outcome changed"
  * required = false
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE42
  * enableWhen[+].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE43
  * enableWhen[+].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE44
  * enableWhen[+].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE45
* item[+]
  * id = "HIV.H.DE49"
  * linkId = "HIV.H.DE49"
  * type = #boolean
  * text = "Transfer confirmed"
  * required = false
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.H.DE23"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE25
  * enableWhen[+].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE43
* item[+]
  * id = "HIV.H.DE50"
  * linkId = "HIV.H.DE50"
  * type = #reference
  * text = "Receiving ART facility"
  * required = false
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.H.DE23"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE25
  * enableWhen[+].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE43
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Organization
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = "http://fhir.et/core/StructureDefinition/ethiopian-mfr-organization"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%eligibleTransferFacilities"
* item[+]
  * id = "HIV.H.DE51"
  * linkId = "HIV.H.DE51"
  * type = #date
  * text = "Date of transfer out"
  * required = false
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.H.DE23"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE25
  * enableWhen[+].question = "HIV.H.DE41"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.H.DE43
* item[+]
  * id = "HIV.H.DE52"
  * linkId = "HIV.H.DE52"
  * type = #boolean
  * text = "Was the client assessed as adherent to ART?"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.H.DE53"
  * linkId = "HIV.H.DE53"
  * type = #choice
  * text = "Reason(s) for adherence problem"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.H.DE53)
  * enableWhen.question = "HIV.H.DE52"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = false
* item[+]
  * id = "HIV.H.DE72"
  * linkId = "HIV.H.DE72"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.H.DE53"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.H.DE71
* item[+]
  * id = "HIV.H.DE73"
  * linkId = "HIV.H.DE73"
  * type = #date
  * text = "Date ART stopped"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.H.DE74"
  * linkId = "HIV.H.DE74"
  * type = #choice
  * text = "Reason ART stopped"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.H.DE74)
* item[+]
  * id = "HIV.H.DE81"
  * linkId = "HIV.H.DE81"
  * type = #string
  * text = "Other reason for stopping ART (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.H.DE74"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.H.DE80
