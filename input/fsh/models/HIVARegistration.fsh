Invariant:    HIV-A-1
Description:  "Enter a birth date or an estimated age."
Expression:   "dateOfBirth.hasValue() or estimatedAge.hasValue()"
Severity:     #error

Invariant:    HIV-A-2
Description:  "Can be a drop-down list of input options"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant:    HIV-A-3
Description:  "Can be based on the structure and format of addresses in the country"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant:    HIV-A-4
Description:  "DateTime <= Current DateTime"
Expression:   "visitDate <= now()"
Severity:     #error

Invariant:    HIV-A-5
Description:  "If 'Date of birth unknown' = True, 'Estimated age' is required"
Expression:   "dateOfBirthUnknown.where($this = true).exists() implies estimatedAge.hasValue()"
Severity:     #error

Invariant:    HIV-A-6
Description:  "List of countries"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant:    HIV-A-7
Description:  "Minimum and maximum number of characters based on country"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant:    HIV-A-8
Description:  "Minimum and maximum number of characters based on local policy"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant:    HIV-A-9
Description:  "Minimum and maximum number of characters, based on local policy"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant:    HIV-A-10
Description:  "Must be appropriate email format with '@' sign"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant:    HIV-A-11
Description:  "Only letters and special characters (period, dash) allowed"
Expression:   "(firstName | fatherName | grandfatherName | clientFamilyName).all($this.matches('^[\\\\p{L}\\\\p{M}.-]+$'))"
Severity:     #error

Invariant: HIV-A-referral-source
Description: "Select who referred the client when Referral is Yes."
Expression: "referral.where($this = true).exists() implies referredBy.exists()"
Severity: #error

Invariant: HIV-A-residence-address
Description: "Provide Region, Zone/Subcity, and Woreda for residence in Ethiopia, or Address for residence outside Ethiopia."
Expression: "iif(countryOfResidence.code = 'ET', residenceRegion.exists() and residenceZone.exists() and residenceWoreda.exists(), address.hasValue())"
Severity: #error

Logical: HIVARegistration
Title: "HIV.A Registration"
Description: "This tab describes the data that are collected during the registration workflow (HIV.A)"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^experimental = true
* ^name = "HIVARegistration"
* ^status = #active
// The parent Element already has the HL7 RIM mapping at index 0.
* ^mapping[1].identity = "moh-hiv-dak"
* ^mapping[=].name = "Ethiopia MoH HIV DAK Data Dictionary (October 2026)"
* obeys HIV-A-1 and HIV-A-4 and HIV-A-5 and HIV-A-11 and HIV-A-referral-source and HIV-A-residence-address

* firstName 1..1 string "First name" "Client's first or given name"
  * ^code[+] = HIVConcepts#HIV.A.DE1
* fatherName 1..1 string "Father name" "Father name, exchanged using the Ethiopian base name.family fathersName extension"
  * ^code[+] = HIVConcepts#HIV.A.ET.DE1
* grandfatherName 1..1 string "Grandfather name" "Grandfather name, exchanged using the Ethiopian base name.family grandfathersName extension"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE2"
* clientFamilyName 0..1 string "Family name" "Client's family name or last name, exchanged as the name.family string when recorded"
  * ^code[+] = HIVConcepts#HIV.A.DE2
* visitDate 1..1 dateTime "Visit date" "The date and time of the client's visit"
  * ^code[+] = HIVConcepts#HIV.A.DE3
* referral 1..1 boolean "Referral" "If client was referred for care"
  * ^code[+] = HIVConcepts#HIV.A.DE4
* referredBy 0..1 Coding "Referred by" "Required when the client was referred for care"
  * ^code[+] = HIVConcepts#HIV.A.DE5
* referredBy from HIV.A.DE5
* uniqueIdentifier 1..1 Identifier "Medical record number (MRN)" "Facility medical record number, exchanged using the Ethiopian base Patient MRN identifier"
  * ^code[+] = HIVConcepts#HIV.A.DE8
* nationalId 0..1 Identifier "National ID" "National unique identifier assigned to the client, if used in the country"
  * ^code[+] = HIVConcepts#HIV.A.DE9
* nationalProgrammeId 0..1 Identifier "Unique ART number" "Unique number assigned by the HIV programme for antiretroviral treatment"
  * ^code[+] = HIVConcepts#HIV.A.DE11
* nationalHealthInsuranceId 0..1 Identifier "National health insurance ID" "National health insurance unique identifier assigned to the client, if used in the country"
  * ^code[+] = HIVConcepts#HIV.A.DE12
* dateOfBirth 0..1 date "Date of birth" "The client's date of birth (DOB) if known"
  * ^code[+] = HIVConcepts#HIV.A.DE14
* dateOfBirthUnknown 0..1 boolean "Date of birth unknown" "Is the client's DOB is unknown?"
  * ^code[+] = HIVConcepts#HIV.A.DE15
* estimatedAge 0..1 integer "Estimated age" "If DOB is unknown, enter the client's estimated age. Display client's age in number of years."
  * ^code[+] = HIVConcepts#HIV.A.DE16
* age 0..1 integer "Age" "Calculated age (number of years) of the client based on date of birth"
  * ^code[+] = HIVConcepts#HIV.A.DE17
* gender 1..1 Coding "Sex" "Sex as collected at registration, exchanged as Ethiopian base Patient administrative gender"
  * ^code[+] = HIVConcepts#HIV.A.DE18
* gender from http://fhir.et/core/ValueSet/gender-vs (required)
* countryOfResidence 1..1 Coding "Country of residence" "Client's country of residence, exchanged as the two-letter country code in Patient.address.country"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.DE54"
* countryOfResidence from http://hl7.org/fhir/ValueSet/iso3166-1-2 (required)
* residenceRegion 0..1 Coding "Region" "Required for Ethiopian residence, exchanged using the Ethiopian base Patient region code"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE18"
* residenceRegion from http://fhir.et/core/ValueSet/EthiopiaStateVS (required)
* residenceZone 0..1 Coding "Zone/Subcity" "Zone or Subcity selected from the official MFR geographic list for Ethiopian residence"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE3"
* residenceWoreda 0..1 Coding "Woreda" "Woreda selected from the official MFR geographic list for Ethiopian residence"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE4"
* residenceKebele 0..1 string "Kebele" "Kebele for Ethiopian residence, exchanged using the Ethiopian base Patient address Kebele extension"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE5"
* residenceKetenaGott 0..1 string "Ketena/Gott" "Ketena or Gott for Ethiopian residence, exchanged using the Ethiopian base Patient address Ketena/Gott extension"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE6"
* residenceHouseNumber 0..1 string "House number" "House number for Ethiopian residence, exchanged using the Patient address house number extension"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE7"
* address 0..1 string "Address" "Required for residence outside Ethiopia, exchanged as Patient.address.text"
  * ^code[+] = HIVConcepts#HIV.A.DE29
* maritalStatus 0..1 Coding "Marital Status" "Client's current marital status "
  * ^code[+] = HIVConcepts#HIV.A.DE30
* maritalStatus from HIV.A.DE30
* educationalStatus 0..1 Coding "Educational status" "The client's educational status, exchanged using the Ethiopian base Patient education extension"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE8"
* educationalStatus from http://fhir.et/core/ValueSet/education-status-vs (required)
* occupation 0..1 Coding "Occupation" "The client's occupation, exchanged using the Ethiopian base Patient occupation extension"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE14"
* occupation from http://fhir.et/core/ValueSet/occupation-vs (required)
* otherOccupation 0..1 string "Other (specify)" "Occupation details entered when Other is selected, exchanged as text alongside the Other code in the Patient occupation extension"
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.A.ET.DE24"
* telephoneNumber 1..1 string "Telephone number" "Client's landline or mobile number as recorded, including any leading zero or international prefix"
  * ^code[+] = HIVConcepts#HIV.A.DE42
* administrativeArea 1..1 string "Catchment area" "The facility, district, or other administrative area associated with the client, drawn from the implementing system's local list and exchanged as the Patient catchment area extension"
  * ^code[+] = HIVConcepts#HIV.A.DE43
* communicationConsent 0..1 boolean "Communication consent" "Indication that client gave consent to be contacted"
  * ^code[+] = HIVConcepts#HIV.A.DE44
* reminderMessages 0..1 boolean "Reminder messages" "Whether client wants to receive text or other messages as follow-up for HIV services"
  * ^code[+] = HIVConcepts#HIV.A.DE45
* communicationPreferences 0..* Coding "Communication preference(s)" "How the client would like to receive HIV service communications"
  * ^code[+] = HIVConcepts#HIV.A.DE46
* communicationPreferences from HIV.A.DE46
* clientEmail 0..1 string "Client's email" "Client's primary email account where the client can be contacted"
  * ^code[+] = HIVConcepts#HIV.A.DE49
* alternateContactName 0..1 string "Alternate contact's name" "Name of an alternate contact, which could be next of kin (e.g. partner, husband, mother, sibling, etc.). The alternate contact would be used in the case of an emergency situation."
  * ^code[+] = HIVConcepts#HIV.A.DE50
* alternateContactPhoneNumber 0..1 string "Alternate contact's phone number" "Phone number of the alternate contact as recorded, including any leading zero or international prefix"
  * ^code[+] = HIVConcepts#HIV.A.DE51
* alternateContactAddress 0..1 string "Alternate contact's address" "Alternate contact's home address or address which the client is consenting to disclose"
  * ^code[+] = HIVConcepts#HIV.A.DE52
* alternateContactRelationship 0..1 string "Alternate contact relationship" "The alternate contact's relationship to the client (e.g. partner, husband, mother, sibling, etc.)"
  * ^code[+] = HIVConcepts#HIV.A.DE53
