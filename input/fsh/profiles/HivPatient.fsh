Profile: HivPatient
Parent: Patient
Title: "HIV Patient"
Description: "Patient profile supporting Ethiopia HIV.A registration demographics, identifiers, catchment area, and contact details."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^status = #active
* ^title = "HIV Patient"

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
* name.given 1..* MS
* name.given ^short = "First name"
* name.family 1..1 MS
* name.family ^short = "Grand Father's Name / family name"

* gender 1..1 MS
* gender ^short = "Administrative sex recorded for registration"
* gender ^definition = "Administrative sex/gender recorded for HIV registration. Ethiopia HIV.A currently retains Female and Male options for HIV.A.DE18."

* birthDate 0..1 MS
* birthDate ^short = "Date of birth"
* birthDate ^comment = "Ethiopia HIV.A.DE14 is conditional. If date of birth is unknown, use the data-absent-reason extension on birthDate and capture estimated age through QuestionnaireResponse or another approved national mapping."
* birthDate.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason named birthDateAbsentReason 0..1 MS
* birthDate.extension[birthDateAbsentReason] ^short = "Reason date of birth is absent"

* maritalStatus 0..1 MS
* maritalStatus ^short = "Marital Status"

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

* address 1..* MS
* address ^short = "Catchment area"
* address ^definition = "Address or catchment-area information used to group and flag client data for the responsible facility or administrative area."
* address.text 0..1 MS
* address.district 1..1 MS
* address.district ^short = "Catchment area"
* address.district ^definition = "Context-specific catchment area or administrative area for Ethiopia HIV.A.DE43."
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
