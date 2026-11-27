Extension: HivHivTestConfirmationDate
Id: hiv-hiv-test-confirmation-date
Title: "Date Positive HIV Test Confirmed"
Description: "Date the patient received written confirmation of a positive HIV test result. Supports HIV.B.DE119."
* ^context.type = #element
* ^context.expression = "Observation"
* value[x] only date
* valueDate 1..1 MS

Extension: HivHivTestConfirmationFacility
Id: hiv-hiv-test-confirmation-facility
Title: "Site Where Positive HIV Test Confirmed"
Description: "MFR organization where the positive HIV test result was confirmed. Supports HIV.B.DE120."
* ^context.type = #element
* ^context.expression = "Observation"
* value[x] only Reference(HivHtsDiagnosingFacilityOrganization)
* valueReference 1..1 MS

Invariant: hiv-positive-test-confirmation
Description: "A positive test confirmation date or facility applies to a positive overall HIV test result."
Severity: #error
Expression: "(extension('https://hiv.fhir.et/StructureDefinition/hiv-hiv-test-confirmation-date').exists() or extension('https://hiv.fhir.et/StructureDefinition/hiv-hiv-test-confirmation-facility').exists()) implies value.coding.where(system = 'https://hiv.fhir.et/CodeSystem/HIVConcepts' and code = 'HIV.B.DE112').exists()"

Profile: HivHivTest
Parent: HivLabTestObservation
Description: "Overall HIV test result recorded after applying the testing algorithm."
* ^title = "HIV Test"
* code = HIVConcepts#HIV.B.DE81
* valueCodeableConcept from HIV.B.DE111 (required)
* extension contains
    HivHivTestConfirmationDate named confirmationDate 0..1 MS and
    HivHivTestConfirmationFacility named confirmationFacility 0..1 MS
* obeys hiv-positive-test-confirmation
