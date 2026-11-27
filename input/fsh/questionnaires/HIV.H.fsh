Instance: HIV.HFollowingUpAndContactingClients
InstanceOf: sdc-questionnaire-extr-smap
Title: "Following up and contacting clients"
Description: "Records the date and documented cause of maternal death during follow-up."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "pmtct-maternal-death-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record the date of death as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE74').answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"

* item[+]
  * id = "HIV.E.DE74"
  * linkId = "HIV.E.DE74"
  * type = #date
  * text = "Date of death of mother"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE75"
  * linkId = "HIV.E.DE75"
  * type = #string
  * text = "Cause of death of mother"
  * required = false
  * repeats = false
  * readOnly = false
