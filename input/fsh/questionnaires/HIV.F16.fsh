Instance: HIV.F16ImmediatelyStartInfantOnArt
InstanceOf: sdc-questionnaire-extr-smap
Title: "Immediately start infant on ART"
Description: "Questionnaire for immediately start infant on ART"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "pmtct-infant-art-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record the documented ART start date as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE229')).answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"

* item[+]
  * id = "HIV.E.DE229"
  * linkId = "HIV.E.DE229"
  * type = #date
  * text = "Infant ART start date"
  * required = false
  * repeats = false
  * readOnly = false
