Extension: HivPatientDateOfBirthUnknown
Id: hiv-patient-date-of-birth-unknown
Title: "HIV Patient Date of Birth Unknown"
Description: "Indicates that the client's date of birth is unknown. Supports Ethiopia HIV.A.DE15."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* value[x] only boolean
* valueBoolean 1..1 MS

Extension: HivPatientEstimatedAge
Id: hiv-patient-estimated-age
Title: "HIV Patient Estimated Age"
Description: "Estimated age in years when date of birth is unknown. Supports Ethiopia HIV.A.DE16."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* value[x] only Age
* valueAge 1..1 MS

Extension: HivPatientCommunicationConsent
Id: hiv-patient-communication-consent
Title: "HIV Patient Communication Consent"
Description: "Indicates that the client gave consent to be contacted. Supports Ethiopia HIV.A.DE44."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* value[x] only boolean
* valueBoolean 1..1 MS

Extension: HivPatientReminderMessages
Id: hiv-patient-reminder-messages
Title: "HIV Patient Reminder Messages"
Description: "Indicates whether the client wants reminder or follow-up messages. Supports Ethiopia HIV.A.DE45."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* value[x] only boolean
* valueBoolean 1..1 MS

Extension: HivPatientCommunicationPreference
Id: hiv-patient-communication-preference
Title: "HIV Patient Communication Preference"
Description: "Client communication preference, such as SMS or voice call. Supports Ethiopia HIV.A.DE46."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.A.DE46 (preferred)

Extension: HivPatientEducationStatus
Id: hiv-patient-education-status
Title: "HIV Patient Education Status"
Description: "Client educational status. Supports Ethiopia-specific registration rows HIV.A.ET.DE7 through HIV.A.ET.DE12."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.A.ET.DE7 (preferred)

Extension: HivPatientOccupation
Id: hiv-patient-occupation
Title: "HIV Patient Occupation"
Description: "Client occupation. Supports Ethiopia-specific registration rows HIV.A.ET.DE13 through HIV.A.ET.DE16."
* ^context[+].type = #element
* ^context[=].expression = "Patient"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.A.ET.DE13 (preferred)

Extension: HivPatientKebele
Id: hiv-patient-kebele
Title: "HIV Patient Kebele"
Description: "Client residency kebele. Supports Ethiopia HIV.A.ET.DE4."
* ^context[+].type = #element
* ^context[=].expression = "Address"
* value[x] only string
* valueString 1..1 MS

Extension: HivPatientKetenaGott
Id: hiv-patient-ketena-gott
Title: "HIV Patient Ketena/Gott"
Description: "Client residency ketena or gott. Supports Ethiopia HIV.A.ET.DE5."
* ^context[+].type = #element
* ^context[=].expression = "Address"
* value[x] only string
* valueString 1..1 MS

Extension: HivPatientHouseNumber
Id: hiv-patient-house-number
Title: "HIV Patient House Number"
Description: "Client residency house number. Supports Ethiopia HIV.A.ET.DE6."
* ^context[+].type = #element
* ^context[=].expression = "Address"
* value[x] only string
* valueString 1..1 MS

Invariant: hiv-a-registration-gender-ethiopia
Description: "Ethiopia HIV.A.DE18 currently permits only Female and Male, represented as FHIR administrative gender female or male."
Severity: #error
Expression: "gender = 'female' or gender = 'male'"

Invariant: hiv-a-registration-birth-date-or-age
Description: "Ethiopia HIV.A requires date of birth, date of birth unknown, or estimated age."
Severity: #error
Expression: "birthDate.exists() or extension('http://smart.who.int/hiv/StructureDefinition/hiv-patient-date-of-birth-unknown').value = true or extension('http://smart.who.int/hiv/StructureDefinition/hiv-patient-estimated-age').exists()"

Profile: HivPatient
Parent: Patient
Title: "HIV Patient"
Description: "Patient profile supporting Ethiopia HIV.A registration demographics, identifiers, residence, communication preferences, and contact details."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^status = #active
* ^title = "HIV Patient"
* obeys hiv-a-registration-gender-ethiopia and hiv-a-registration-birth-date-or-age

* extension contains
    HivPatientDateOfBirthUnknown named dateOfBirthUnknown 0..1 MS and
    HivPatientEstimatedAge named estimatedAge 0..1 MS and
    HivPatientCommunicationConsent named communicationConsent 0..1 MS and
    HivPatientReminderMessages named reminderMessages 0..1 MS and
    HivPatientCommunicationPreference named communicationPreference 0..* MS and
    HivPatientEducationStatus named educationStatus 0..1 MS and
    HivPatientOccupation named occupation 0..1 MS
* extension[dateOfBirthUnknown] ^short = "Date of birth unknown"
* extension[estimatedAge] ^short = "Estimated age"
* extension[communicationConsent] ^short = "Communication consent"
* extension[reminderMessages] ^short = "Reminder messages"
* extension[communicationPreference] ^short = "Communication preference"
* extension[educationStatus] ^short = "Educational status"
* extension[occupation] ^short = "Occupation"

* identifier 1..* MS
* identifier ^short = "Client identifiers"
* identifier ^definition = "Identifiers collected during HIV.A registration. Ethiopia HIV.A requires an MRN and may also capture National ID, Unique ART number, and National health insurance ID."
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains
    mrn 1..1 MS and
    nationalId 0..1 MS and
    uniqueArtNumber 0..1 MS and
    nationalHealthInsuranceId 0..1 MS
* identifier.system 0..1 MS
* identifier.value 1..1 MS
* identifier.type 0..1 MS
* identifier[mrn] ^short = "MRN"
* identifier[mrn] ^definition = "Medical record number or equivalent local facility record identifier. Corresponds to Ethiopia HIV.A.DE8."
* identifier[mrn].type = $identifier-type#MR "Medical record number"
* identifier[mrn].system 0..1 MS
* identifier[mrn].value 1..1 MS
* identifier[nationalId] ^short = "National ID"
* identifier[nationalId] ^definition = "National unique identifier assigned to the client, if used in the country. Corresponds to Ethiopia HIV.A.DE9."
* identifier[nationalId].type = $identifier-type#NI "National unique individual identifier"
* identifier[nationalId].system 0..1 MS
* identifier[nationalId].value 1..1 MS
* identifier[uniqueArtNumber] ^short = "Unique ART number"
* identifier[uniqueArtNumber] ^definition = "National HIV programme or ART identifier assigned to the client. Corresponds to Ethiopia HIV.A.DE11."
* identifier[uniqueArtNumber].type = HIVConcepts#HIV.A.DE11 "Unique ART number"
* identifier[uniqueArtNumber].system 0..1 MS
* identifier[uniqueArtNumber].value 1..1 MS
* identifier[nationalHealthInsuranceId] ^short = "National health insurance ID"
* identifier[nationalHealthInsuranceId] ^definition = "National health insurance identifier assigned to the client, if used in the country. Corresponds to Ethiopia HIV.A.DE12."
* identifier[nationalHealthInsuranceId].type = HIVConcepts#HIV.A.DE12 "National health insurance ID"
* identifier[nationalHealthInsuranceId].system 0..1 MS
* identifier[nationalHealthInsuranceId].value 1..1 MS

* name 1..* MS
* name ^short = "Client name"
* name ^definition = "Client name collected during Ethiopia HIV.A registration. The first given component represents HIV.A.DE1 First name; the second given component represents HIV.A.ET.DE1 Father name; family represents HIV.A.DE2 Grand Father's Name."
* name.given 2..* MS
* name.given ^short = "First name and father name"
* name.given ^definition = "At least two given name values are required: first name and father name."
* name.family 1..1 MS
* name.family ^short = "Grand Father's Name"
* name.family ^definition = "Grand Father's Name, represented in Patient.name.family as the family/last-name component for exchange."

* gender 1..1 MS
* gender ^short = "Administrative sex recorded for registration"
* gender ^definition = "Administrative sex/gender recorded for HIV registration. Ethiopia HIV.A.DE18 currently retains Female and Male options; these are represented as FHIR administrative gender codes female and male."

* birthDate 0..1 MS
* birthDate ^short = "Date of birth"
* birthDate ^comment = "Ethiopia HIV.A.DE14 is conditional. If date of birth is unknown, use the Patient dateOfBirthUnknown extension and, when available, the estimatedAge extension."
* birthDate.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named birthDateAbsentReason 0..1 MS
* birthDate.extension[birthDateAbsentReason] ^short = "Reason date of birth is absent"

* maritalStatus 0..1 MS
* maritalStatus ^short = "Marital Status"
* maritalStatus from HIV.A.DE30 (extensible)
* maritalStatus ^definition = "Client's current marital status. Ethiopia HIV.A currently retains Single, Married, Divorced, and Widowed."

* telecom 1..* MS
* telecom ^short = "Client contact details"
* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom contains
    phone 1..* MS and
    email 0..1 MS
* telecom.system 1..1 MS
* telecom.value 1..1 MS
* telecom[phone] ^short = "Telephone number"
* telecom[phone].system = #phone
* telecom[phone].value 1..1 MS
* telecom[email] ^short = "Client's email"
* telecom[email].system = #email
* telecom[email].value 1..1 MS

* address 0..* MS
* address ^short = "Client residence"
* address ^definition = "Client residence details from Ethiopia-specific HIV.A rows."
* address.extension contains
    HivPatientKebele named kebele 0..1 MS and
    HivPatientKetenaGott named ketenaGott 0..1 MS and
    HivPatientHouseNumber named houseNumber 0..1 MS
* address.text 0..1 MS
* address.line 0..* MS
* address.city 0..1 MS
* address.city ^short = "Zone/Subcity"
* address.district 0..1 MS
* address.district ^short = "Woreda"
* address.state 0..1 MS
* address.state ^short = "Region"
* address.country 0..1 MS

* contact 0..* MS
* contact ^short = "Alternate contact"
* contact.relationship 0..* MS
* contact.relationship.text 0..1 MS
* contact.name 0..1 MS
* contact.name.text 0..1 MS
* contact.telecom 0..* MS
* contact.telecom.system 1..1 MS
* contact.telecom.value 1..1 MS
* contact.address 0..1 MS
