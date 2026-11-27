Instance: HIV.I6ProvideInformationToReferralFacility
InstanceOf: sdc-questionnaire-extr-smap
Title: "Provide information to referral facility"
Description: "Prepares referral details for the receiving facility, including the reason, appointment and referring provider."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true

* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #referralContext
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply visitDateTime (dateTime), providerName (string) for the authenticated user and providerTelephone (string) from the verified provider or facility profile. Supply destinationLocation references to verified MFR Locations that can deliver the requested services and referringLocation references to verified sites associated with the user. Supply one defaultReferringLocation from the referringLocation list when known. Refresh eligible destinations if the requested services change."
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "eligibleReferralLocations"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = """
  %referralContext.parameter.where(name in ('destinationLocation' | 'referringLocation'))
    .where(value.ofType(Reference).where(reference.matches('(^|/)Location/[A-Za-z0-9.-]{1,64}(/_history/[A-Za-z0-9.-]{1,64})?$')
      and (type.empty() or type = 'Location' or type = 'http://hl7.org/fhir/StructureDefinition/Location')).exists())
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "referral-other-reason"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Select Other general services only when no listed reason applies and enter the reason."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.I.DE2').answer.value.ofType(Coding).where(system = 'https://hiv.fhir.et/CodeSystem/HIVConcepts' and code = 'HIV.I.DE7').exists()
    implies (%resource.item.where(linkId = 'HIV.I.DE2').answer.value.ofType(Coding).count() = 1 and %resource.item.where(linkId = 'HIV.I.DE8').answer.value.ofType(string).where(trim().length() > 0).exists())
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "referral-sites"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Select the receiving and referring sites from their verified facility registry lists."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.I.DE11').answer.value.ofType(Reference).all(reference.exists() and reference in %eligibleReferralLocations.where(name = 'destinationLocation').value.ofType(Reference).reference) and
  %resource.item.where(linkId = 'HIV.I.DE14').answer.value.ofType(Reference).all(reference.exists() and reference in %eligibleReferralLocations.where(name = 'referringLocation').value.ofType(Reference).reference)
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "referral-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Record when the referral was made. The scheduled appointment must be on or after that time."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.I.DE12').answer.value.ofType(dateTime).where($this > now()).empty() and
  (%resource.item.where(linkId = 'HIV.I.DE10').answer.value.ofType(dateTime) >= %resource.item.where(linkId = 'HIV.I.DE12').answer.value.ofType(dateTime)).where($this = false).empty()
"""

* item[+]
  * id = "HIV.I.DE2"
  * linkId = "HIV.I.DE2"
  * type = #choice
  * text = "Reason for referral"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.I.DE2)
* item[+]
  * id = "HIV.I.DE8"
  * linkId = "HIV.I.DE8"
  * type = #string
  * text = "Referral for other general services (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.I.DE2"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.I.DE7
* item[+]
  * id = "HIV.I.DE9"
  * linkId = "HIV.I.DE9"
  * type = #boolean
  * text = "Any treatment given before referral?"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.I.DE10"
  * linkId = "HIV.I.DE10"
  * type = #dateTime
  * text = "Date of scheduled referral appointment"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.I.DE11"
  * linkId = "HIV.I.DE11"
  * type = #reference
  * text = "Location of scheduled referral appointment"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Location
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = "http://fhir.et/core/StructureDefinition/ethiopian-mfr-location"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%eligibleReferralLocations.where(name = 'destinationLocation').value.ofType(Reference)"
* item[+]
  * id = "HIV.I.DE12"
  * linkId = "HIV.I.DE12"
  * type = #dateTime
  * text = "Date referral was made"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%referralContext.parameter.where(name = 'visitDateTime').value.ofType(dateTime).single()"
* item[+]
  * id = "HIV.I.DE13"
  * linkId = "HIV.I.DE13"
  * type = #string
  * text = "Provider who made referral"
  * required = true
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%referralContext.parameter.where(name = 'providerName').value.ofType(string).where(trim().length() > 0).single()"
* item[+]
  * id = "HIV.I.DE14"
  * linkId = "HIV.I.DE14"
  * type = #reference
  * text = "Provider's facility"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Location
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = "http://fhir.et/core/StructureDefinition/ethiopian-mfr-location"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%eligibleReferralLocations.where(name = 'referringLocation').value.ofType(Reference)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%referralContext.parameter.where(name = 'defaultReferringLocation').value.ofType(Reference).where(reference in %eligibleReferralLocations.where(name = 'referringLocation').value.ofType(Reference).reference).single()"
* item[+]
  * id = "HIV.I.DE15"
  * linkId = "HIV.I.DE15"
  * type = #string
  * text = "Provider's telephone number"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%referralContext.parameter.where(name = 'providerTelephone').value.ofType(string).where(trim().length() > 0).single()"
* item[+]
  * id = "HIV.I.DE16"
  * linkId = "HIV.I.DE16"
  * type = #text
  * text = "Referral notes"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.I.DE17"
  * linkId = "HIV.I.DE17"
  * type = #text
  * text = "Client history summary"
  * required = true
  * repeats = false
  * readOnly = false
