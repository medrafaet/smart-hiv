Profile: HivHtsFollowUpAppointment
Parent: Appointment
Title: "HTS Follow-up Appointment"
Description: "Appointment representing a scheduled follow-up from an HIV testing services visit."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^status = #active
* ^title = "HTS Follow-up Appointment"

* status 1..1 MS
* reasonCode 0..* MS
* reasonCode from HIV.B.DE191 (extensible)
* start 1..1 MS
* start ^short = "Scheduled follow-up date/time"
* start ^definition = "Date and time booked for the HTS follow-up appointment. Supports HIV.B.DE195."
* end 0..1 MS
* participant 1..* MS
* participant.actor 1..1 MS
* participant.actor only Reference(HivPatient)
* participant.status 1..1 MS
