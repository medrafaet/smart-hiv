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

Extension: HivPatientHouseNumber
Id: hiv-patient-house-number
Title: "HIV Patient House Number"
Description: "Client residency house number. Supports HIV.A.ET.DE7 in the October 2026 MoH workbook."
* ^context[+].type = #element
* ^context[=].expression = "Address"
* value[x] only string
* valueString 1..1 MS

Extension: HivPatientCatchmentArea
Id: hiv-patient-catchment-area
Title: "HIV Patient Catchment Area"
Description: "The facility, district, or other administrative area associated with the client. Supports Ethiopia HIV.A.DE43."
* ^context.type = #element
* ^context.expression = "Patient"
* value[x] only string
* valueString 1..1 MS

Invariant: hiv-a-registration-gender-ethiopia
Description: "Ethiopia HIV.A.DE18 currently permits only Female and Male, represented as FHIR administrative gender female or male."
Severity: #error
Expression: "gender = 'female' or gender = 'male'"

Invariant: hiv-a-registration-birth-date-or-age
Description: "Ethiopia HIV.A requires a birth date or estimated age. An estimated age is required when the birth date is marked unknown."
Severity: #error
Expression: "(birthDate.hasValue() or extension('http://smart.who.int/hiv/StructureDefinition/hiv-patient-estimated-age').value.value.hasValue()) and (extension('http://smart.who.int/hiv/StructureDefinition/hiv-patient-date-of-birth-unknown').where(value = true).exists() implies extension('http://smart.who.int/hiv/StructureDefinition/hiv-patient-estimated-age').value.value.hasValue())"

Profile: HivPatient
Parent: http://fhir.et/core/StructureDefinition/ETPatient
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
    HivPatientCatchmentArea named catchmentArea 0..1 MS
* extension[dateOfBirthUnknown] ^short = "Date of birth unknown"
* extension[estimatedAge] ^short = "Estimated age"
* extension[communicationConsent] ^short = "Communication consent"
* extension[reminderMessages] ^short = "Reminder messages"
* extension[communicationPreference] ^short = "Communication preference"
* extension[education] MS
* extension[education] ^short = "Educational status"
* extension[Occupation] MS
* extension[Occupation] ^short = "Occupation"

* identifier 1..* MS
* identifier ^short = "Client identifiers"
* identifier ^definition = "Identifiers collected during HIV.A registration. Use the Ethiopian base MRN, national identifier, and health ID systems. Additional ART and health insurance identifiers use their assigning authority's system and identifier type."
// shortcut: ET Base defines no ART or insurance identifier systems, use the open slice until national systems are agreed.
* identifier.system 0..1 MS
* identifier.value 1..1 MS
* identifier.type 0..1 MS
* identifier[mrn] 1..1 MS
* identifier[mrn] ^short = "MRN"
* identifier[mrn] ^definition = "Medical record number or equivalent local facility record identifier. Corresponds to Ethiopia HIV.A.DE8."
* identifier[mrn].type = $identifier-type#MR "Medical record number"
* identifier[nationalIdentifier] MS
* identifier[nationalIdentifier] ^short = "National ID"
* identifier[nationalIdentifier] ^definition = "National unique identifier assigned to the client. Corresponds to Ethiopia HIV.A.DE9."
* identifier[nationalIdentifier].type = $identifier-type#NI "National unique individual identifier"
* identifier[healthID] MS

* name 1..1 MS
* name ^short = "Client name"
* name ^definition = "Client name collected during Ethiopia HIV.A registration using the Ethiopian base first-name, father-name, and grandfather-name elements."
* name.given 1..1 MS
* name.given ^short = "First name"
* name.family 1..1 MS
* name.family ^comment = "Use the string value for the client's family name when recorded. Carry the father's and grandfather's names in their respective extensions even when the family name string is absent."
* name.family.extension[fathersName] 1..1 MS
* name.family.extension[fathersName].valueString 1..1 MS
* name.family.extension[grandfathersName] 1..1 MS
* name.family.extension[grandfathersName].valueString 1..1 MS

* gender 1..1 MS
* gender ^short = "Administrative sex recorded for registration"
* gender ^definition = "Administrative sex/gender recorded for HIV registration. Ethiopia HIV.A.DE18 currently retains Female and Male options; these are represented as FHIR administrative gender codes female and male."

* birthDate 0..1 MS
* birthDate ^short = "Date of birth"
* birthDate ^comment = "Record a birth date or an estimated age. If the date is marked unknown using dateOfBirthUnknown, provide estimatedAge."
* birthDate.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named birthDateAbsentReason 0..1 MS
* birthDate.extension[birthDateAbsentReason] ^short = "Reason date of birth is absent"

* maritalStatus 0..1 MS
* maritalStatus ^short = "Marital Status"
* maritalStatus ^definition = "Client's current marital status using the Ethiopian base required value set."

* telecom 1..* MS
* telecom ^short = "Client contact details"
* telecom contains phone 1..* MS
* telecom.system 1..1 MS
* telecom.value 1..1 MS
* telecom[phone] ^short = "Telephone number"
* telecom[phone].system = #phone
* telecom[phone].value 1..1 MS
* telecom[email] ^short = "Client's email"
* telecom[email] MS
* telecom[email].value 1..1 MS

* address 0..* MS
* address ^short = "Client residence"
* address ^definition = "Client residence details from Ethiopia-specific HIV.A rows."
* address.extension contains HivPatientHouseNumber named houseNumber 0..1 MS
* address.extension[zone] MS
* address.extension[kebele] MS
* address.extension[kebele].valueString 1..1 MS
* address.extension[ketena_Gott] MS
* address.extension[ketena_Gott].valueString 1..1 MS
* address.text 0..1 MS
* address.line MS
* address.city 0..1 MS
* address.district 0..1 MS
* address.district ^short = "Woreda"
* address.state 0..1 MS
* address.state ^short = "Region"
* address.country 0..1 MS
* address.country ^comment = "Record the two-letter ISO 3166-1 code for the country of residence."

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
