Instance: HIV.D19AssessForVaccinePreventableDiseases
InstanceOf: sdc-questionnaire-extr-smap
Title: "Assess for vaccine-preventable diseases"
Description: "Records one vaccination assessment, including the product and site when administered and a reason when it was not given."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #careVaccination
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply approved national vaccineBrand and vaccineType Coding choices and vaccinationLocation references to verified ET Base MFR Locations. Supply repeated parameters for choices and empty Parameters when context is unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "care-vaccination-dose"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record a positive dose with its unit. The dose number must fit within the documented series total when both are known."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.D.DE608').answer.value.ofType(Quantity).all(
    value.exists() and value > 0 and comparator.empty() and (unit.where(trim().length() > 0).exists() or (system.exists() and code.exists()))) and
  (%resource.item.where(linkId = 'HIV.D.DE607').answer.value.ofType(integer) >
    %resource.item.where(linkId = 'HIV.D.DE609').answer.value.ofType(integer)).where($this = true).empty()
"""

* item[+]
  * linkId = "HIV.D.DE602"
  * type = #boolean
  * text = "Hepatitis B negative counselling conducted"
* item[+]
  * linkId = "vaccinationProvided"
  * type = #boolean
  * text = "Was the vaccine administered?"
* item[+]
  * linkId = "HIV.D.DE603"
  * type = #choice
  * text = "Vaccine brand"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careVaccination.parameter.where(name = 'vaccineBrand').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * linkId = "HIV.D.DE604"
  * type = #choice
  * text = "Vaccine type"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careVaccination.parameter.where(name = 'vaccineType').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * linkId = "HIV.D.DE605"
  * type = #dateTime
  * text = "Date and time of vaccination"
  * enableWhen.question = "vaccinationProvided"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "HIV.D.DE606"
  * type = #reference
  * text = "Vaccination location"
  * enableWhen.question = "vaccinationProvided"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Location
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = "http://fhir.et/core/StructureDefinition/ethiopian-mfr-location"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careVaccination.parameter.where(name = 'vaccinationLocation').value.ofType(Reference).where(reference.matches('(^|/)Location/[A-Za-z0-9.-]+(/_history/[A-Za-z0-9.-]+)?$'))"
* item[+]
  * linkId = "HIV.D.DE607"
  * type = #integer
  * text = "Dose number"
  * enableWhen.question = "vaccinationProvided"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 1
* item[+]
  * linkId = "HIV.D.DE608"
  * type = #quantity
  * text = "Administered dose and unit"
  * enableWhen.question = "vaccinationProvided"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "HIV.D.DE609"
  * type = #integer
  * text = "Total doses in series"
  * enableWhen.question = "vaccinationProvided"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 1
* item[+]
  * linkId = "HIV.D.DE610"
  * type = #choice
  * text = "Disease targeted"
  * repeats = true
  * answerValueSet = Canonical(HIV.D.DE610)
* item[+]
  * linkId = "HIV.D.DE636"
  * type = #choice
  * text = "Reason immunization was not provided"
  * required = true
  * answerValueSet = Canonical(HIV.D.DE636)
  * enableWhen.question = "vaccinationProvided"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = false
* item[+]
  * linkId = "HIV.D.DE642"
  * type = #string
  * text = "Other reason immunization was not provided (specify)"
  * required = true
  * enableWhen.question = "HIV.D.DE636"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE641
