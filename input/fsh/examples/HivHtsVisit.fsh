Instance: ExampleHivHtsVisit
InstanceOf: HivHtsVisit
Title: "Example HIV HTS Visit"
Description: "Example Ethiopia-focused HIV testing services visit encounter."

* status = #finished
* class = http://terminology.hl7.org/CodeSystem/v3-ActCode#AMB "ambulatory"
* type = HIVConcepts#HIV.B.ET.DE18 "HTS visit"
* serviceType = HIVConcepts#HIV.B.ET.DE18 "HTS visit"
* subject = Reference(ExampleHivPatient)
* period.start = "2023-01-01T09:00:00Z"
* period.end = "2023-01-01T10:00:00Z"
* serviceProvider = Reference(ExampleHivHtsDiagnosingFacility)
* appointment = Reference(ExampleHivHtsFollowUpAppointment)
* extension[recommendedFollowUpDate].valueDateTime = "2023-03-28T09:00:00Z"
* reasonCode[+] = HIVConcepts#HIV.B.DE2 "First-time HIV test"
* extension[testingEntryPoint].valueCodeableConcept = HIVConcepts#HIV.B.DE17 "Facility-level testing"
* extension[facilityEntryPoint].valueCodeableConcept = HIVConcepts#HIV.B.DE25 "Voluntary counselling and testing (within a health facility setting)"
* extension[testingModality].valueCodeableConcept = HIVConcepts#HIV.B.ET.DE28 "Voluntary counselling and testing (VCT)"
* extension[referredThroughPartnerServices][+].valueCodeableConcept = HIVConcepts#HIV.B.DE6 "Partner or contact of an index case"
* extension[partnerContactRelationship][+].valueCodeableConcept = HIVConcepts#HIV.B.ET.DE4 "Siblings"
* extension[contactWithSuspectedExposureToHiv].valueBoolean = false
* extension[hivDiagnosingFacility].valueReference = Reference(ExampleHivHtsDiagnosingFacility)

Instance: ExampleHivHtsDiagnosingFacility
InstanceOf: HivHtsDiagnosingFacilityOrganization
Title: "Example HIV HTS Diagnosing Facility"
Description: "Example organization representing the HTS diagnosing facility."

* active = true
* identifier[mfrOrgId].value = "EXAMPLE-MFR-ORG-001"
* type = http://terminology.hl7.org/CodeSystem/organization-type#prov "Healthcare Provider"
* name = "Example HTS Facility"

Instance: ExampleHivHtsFollowUpAppointment
InstanceOf: HivHtsFollowUpAppointment
Title: "Example HIV HTS Follow-up Appointment"
Description: "Example appointment booked for HTS follow-up."

* status = #booked
* reasonCode[+] = HIVConcepts#HIV.B.DE192 "Retesting for HIV"
* start = "2023-04-01T09:00:00Z"
* end = "2023-04-01T09:30:00Z"
* participant[+].actor = Reference(ExampleHivPatient)
* participant[=].status = #accepted
