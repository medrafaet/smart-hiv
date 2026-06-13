Extension: HivHtsVisitTestingEntryPoint
Id: hiv-hts-visit-testing-entry-point
Title: "HIV HTS Visit Testing Entry Point"
Description: "Whether HIV testing is happening in the community or at a facility. Supports Ethiopia HIV.B.DE15."
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.B.DE15 (required)

Extension: HivHtsVisitCommunityEntryPoint
Id: hiv-hts-visit-community-entry-point
Title: "HIV HTS Visit Community Entry Point"
Description: "Specific community point where HIV testing is happening. Supports Ethiopia HIV.B.DE18."
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.B.DE18 (required)

Extension: HivHtsVisitFacilityEntryPoint
Id: hiv-hts-visit-facility-entry-point
Title: "HIV HTS Visit Facility Entry Point"
Description: "Specific facility point where HIV testing is happening. Supports Ethiopia HIV.B.DE22."
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.B.DE22 (required)

Extension: HivHtsVisitReferredThroughPartnerServices
Id: hiv-hts-visit-referred-through-partner-services
Title: "HIV HTS Visit Referred Through Partner Services"
Description: "How the client was referred through partner services. Supports Ethiopia HIV.B.DE5."
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.B.DE5 (required)

Extension: HivHtsVisitContactWithSuspectedExposureToHiv
Id: hiv-hts-visit-contact-with-suspected-exposure-to-hiv
Title: "HIV HTS Visit Contact With Suspected Exposure To HIV"
Description: "Indicates whether the client had contact with or suspected exposure to HIV. Supports Ethiopia HIV.B.DE13."
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
* value[x] only boolean
* valueBoolean 1..1 MS

Extension: HivHtsVisitSuspectedExposureDateTime
Id: hiv-hts-visit-suspected-exposure-date-time
Title: "HIV HTS Visit Suspected Exposure Date Time"
Description: "Date and time when the client had suspected exposure to HIV. Supports Ethiopia HIV.B.DE14."
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
* value[x] only dateTime
* valueDateTime 1..1 MS

Extension: HivHtsVisitHivDiagnosingFacility
Id: hiv-hts-visit-hiv-diagnosing-facility
Title: "HIV HTS Visit HIV Diagnosing Facility"
Description: "Organization where the client received an HIV-positive diagnosis. Supports Ethiopia HIV.B.DE66 as an Organization reference."
* ^context[+].type = #element
* ^context[=].expression = "Encounter"
* value[x] only Reference
* valueReference 1..1 MS
* valueReference only Reference(HivHtsDiagnosingFacilityOrganization)

Invariant: hiv-b-hts-community-entry-point
Description: "Community-level HTS visits should include the community entry point."
Severity: #warning
Expression: "extension('http://smart.who.int/hiv/StructureDefinition/hiv-hts-visit-testing-entry-point').value.coding.where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.B.DE16').exists() implies extension('http://smart.who.int/hiv/StructureDefinition/hiv-hts-visit-community-entry-point').exists()"

Invariant: hiv-b-hts-facility-entry-point
Description: "Facility-level HTS visits should include the facility entry point."
Severity: #warning
Expression: "extension('http://smart.who.int/hiv/StructureDefinition/hiv-hts-visit-testing-entry-point').value.coding.where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.B.DE17').exists() implies extension('http://smart.who.int/hiv/StructureDefinition/hiv-hts-visit-facility-entry-point').exists()"

Invariant: hiv-b-hts-suspected-exposure-date
Description: "If suspected HIV exposure is recorded as true, the suspected exposure date/time should be captured when known."
Severity: #warning
Expression: "extension('http://smart.who.int/hiv/StructureDefinition/hiv-hts-visit-contact-with-suspected-exposure-to-hiv').value = true implies extension('http://smart.who.int/hiv/StructureDefinition/hiv-hts-visit-suspected-exposure-date-time').exists()"

Profile: HivHtsVisit
Parent: HivEncounter
Title: "HTS Visit"
Description: "Encounter for HIV testing services visit. This profile captures the Ethiopia HTS visit service event and links to separate resources for HIV tests, HIV status, pregnancy/breastfeeding, partner services, STI testing, VMMC, and follow-up details."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^status = #active
* ^title = "HTS Visit"
* obeys hiv-b-hts-community-entry-point and hiv-b-hts-facility-entry-point and hiv-b-hts-suspected-exposure-date

* extension contains
    HivHtsVisitTestingEntryPoint named testingEntryPoint 1..1 MS and
    HivHtsVisitCommunityEntryPoint named communityEntryPoint 0..1 MS and
    HivHtsVisitFacilityEntryPoint named facilityEntryPoint 0..1 MS and
    HivHtsVisitReferredThroughPartnerServices named referredThroughPartnerServices 1..* MS and
    HivHtsVisitContactWithSuspectedExposureToHiv named contactWithSuspectedExposureToHiv 1..1 MS and
    HivHtsVisitSuspectedExposureDateTime named suspectedExposureDateTime 0..1 MS and
    HivHtsVisitHivDiagnosingFacility named hivDiagnosingFacility 0..1 MS
* extension[testingEntryPoint] ^short = "Testing entry point"
* extension[testingEntryPoint] ^definition = "Whether testing is happening in the community or at a facility. Ethiopia HIV.B.DE15 is required."
* extension[communityEntryPoint] ^short = "Entry point for community-level testing"
* extension[communityEntryPoint] ^definition = "Specific point in the community where testing is happening. Ethiopia HIV.B.DE18 is conditional."
* extension[facilityEntryPoint] ^short = "Entry point for facility-level testing"
* extension[facilityEntryPoint] ^definition = "Specific point where testing is happening at a facility. Ethiopia HIV.B.DE22 is conditional."
* extension[referredThroughPartnerServices] ^short = "Referred through partner services"
* extension[referredThroughPartnerServices] ^definition = "Client reported coming to the facility after receiving a provider-assisted referral or patient referral from a contact or partner. Ethiopia HIV.B.DE5 is required."
* extension[contactWithSuspectedExposureToHiv] ^short = "Contact with and suspected exposure to HIV"
* extension[contactWithSuspectedExposureToHiv] ^definition = "When the client is reported to have had suspected exposure to HIV. Ethiopia HIV.B.DE13 is required."
* extension[suspectedExposureDateTime] ^short = "Date/time of suspected exposure to HIV"
* extension[hivDiagnosingFacility] ^short = "HIV diagnosing facility"
* extension[hivDiagnosingFacility] ^definition = "Organization where the client received an HIV-positive diagnosis. Use an Organization profile rather than a coded facility value set."

* status 1..1 MS
* class 1..1 MS
* type 1..1 MS
* type = HIVConcepts#HIV.B.ET.DE18 "HTS visit"
* type ^short = "HTS visit"
* type ^definition = "Fixed Ethiopia HTS visit code. The removed WHO HIV.B.DE4 option is not used."
* serviceType 1..1 MS
* serviceType = HIVConcepts#HIV.B.ET.DE18 "HTS visit"
* serviceType ^short = "HTS service type"
* serviceType ^definition = "Fixed Ethiopia HTS service code. The removed WHO HIV.B.DE4 option is not used."
* subject 1..1 MS
* subject only Reference(HivPatient)
* period 1..1 MS
* period ^short = "HTS visit date/time"
* period ^definition = "Authoritative date and time of the client's HTS visit. Linked tests, status observations, referrals, and follow-up appointments should reference this Encounter rather than redefining the visit date."
* reasonCode 1..* MS
* reasonCode ^short = "Reason for visit"
* reasonCode from HIV.B.DE1 (extensible)
* participant 0..* MS
* participant ^short = "HTS provider, counsellor, or other participant"
* location 0..* MS
* location ^short = "HTS service delivery location"
* serviceProvider 0..1 MS
* serviceProvider only Reference(HivHtsDiagnosingFacilityOrganization)
* serviceProvider ^short = "HTS service organization"
* appointment 0..* MS
* appointment only Reference(HivHtsFollowUpAppointment)
* appointment ^short = "HTS follow-up appointment"
* appointment ^definition = "Appointment created for the recommended HTS follow-up date or scheduled follow-up workflow."
* diagnosis 0..* MS
* diagnosis ^short = "Conditions linked to this HTS visit"
* diagnosis ^comment = "Use to reference confirmed diagnoses such as an HIV status condition when the national status representation is confirmed."
