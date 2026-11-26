RuleSet: RegistrationGeographyContext
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #etMfrGeography
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Official MFR Zone/Subcity and Woreda choices supplied by the application, with their parent geography."

RuleSet: RegistrationResidenceQuestions
* insert Question(HIV.A.DE54, Country of residence, choice, true, false)
* item[=].id = "HIV.A.DE54"
* item[=].answerValueSet = "http://hl7.org/fhir/ValueSet/iso3166-1-2"
* insert EthiopiaResidenceQuestion(HIV.A.ET.DE18, Region, choice, true)
* item[=].answerValueSet = "http://fhir.et/core/ValueSet/EthiopiaStateVS"
* insert RegistrationGeographyQuestion(HIV.A.ET.DE3, Zone/Subcity, zone, HIV.A.ET.DE18)
* insert RegistrationGeographyQuestion(HIV.A.ET.DE4, Woreda, woreda, HIV.A.ET.DE3)
* insert EthiopiaResidenceQuestion(HIV.A.ET.DE5, Kebele, string, false)
* insert EthiopiaResidenceQuestion(HIV.A.ET.DE6, Ketena/Gott, string, false)
* insert EthiopiaResidenceQuestion(HIV.A.ET.DE7, House number, string, false)
* insert Question(HIV.A.DE29, Address, string, true, false)
* item[=].id = "HIV.A.DE29"
* item[=].enableWhen[+].question = "HIV.A.DE54"
* item[=].enableWhen[=].operator = #exists
* item[=].enableWhen[=].answerBoolean = true
* item[=].enableWhen[+].question = "HIV.A.DE54"
* item[=].enableWhen[=].operator = #!=
* item[=].enableWhen[=].answerCoding = urn:iso:std:iso:3166#ET
* item[=].enableBehavior = #all

RuleSet: RegistrationBirthConstraint
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "registration-birth-date-or-estimate"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Enter a birth date or an estimated age. An estimated age is required when the birth date is marked unknown."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.A.DE16').answer.value.exists() or (%resource.item.where(linkId = 'HIV.A.DE14').answer.value.exists() and %resource.item.where(linkId = 'HIV.A.DE15').answer.value.where($this = true).empty())"

RuleSet: RegistrationBirthQuestions
* insert Question(HIV.A.DE14, Date of birth, date, false, false)
* item[=].id = "HIV.A.DE14"
* insert Question(HIV.A.DE15, Date of birth unknown, boolean, false, false)
* item[=].id = "HIV.A.DE15"
* insert Question(HIV.A.DE16, Estimated age, integer, false, false)
* item[=].id = "HIV.A.DE16"
* insert Question(HIV.A.DE17, Age, integer, false, false)
* item[=].id = "HIV.A.DE17"
* item[=].readOnly = true
* item[=].extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "registrationBirthDate"
* item[=].extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* item[=].extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.A.DE14').answer.value.toString()"
* item[=].extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
* item[=].extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%registrationBirthDate.length() = 10 and %registrationBirthDate.toDate() <= today(), (today().toString().replace('-', '').toInteger() - %registrationBirthDate.replace('-', '').toInteger()) div 10000, {})"

RuleSet: EthiopiaResidenceQuestion(linkId, text, type, required)
* insert Question({linkId}, {text}, {type}, {required}, false)
* item[=].id = "{linkId}"
* item[=].enableWhen[+].question = "HIV.A.DE54"
* item[=].enableWhen[=].operator = #=
* item[=].enableWhen[=].answerCoding = urn:iso:std:iso:3166#ET

RuleSet: RegistrationGeographyQuestion(linkId, text, geography, parentLinkId)
* insert EthiopiaResidenceQuestion({linkId}, {text}, choice, true)
* item[=].enableWhen[+].question = "{parentLinkId}"
* item[=].enableWhen[=].operator = #exists
* item[=].enableWhen[=].answerBoolean = true
* item[=].enableBehavior = #all
* item[=].extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "selectedParent"
* item[=].extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* item[=].extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = '{parentLinkId}').answer.value"
* item[=].extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
* item[=].extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%etMfrGeography.parameter.where(name = '{geography}').where(part.where(name = 'parent').value.system = %selectedParent.system and part.where(name = 'parent').value.code = %selectedParent.code).part.where(name = 'choice').value.where(system.exists() and code.exists() and display.exists())"
