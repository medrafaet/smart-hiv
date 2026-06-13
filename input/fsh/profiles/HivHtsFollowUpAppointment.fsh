Profile: HivHtsFollowUpAppointment
Parent: Appointment
Title: "HTS Follow-up Appointment"
Description: "Appointment representing the recommended or scheduled follow-up from an HIV testing services visit."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^status = #active
* ^title = "HTS Follow-up Appointment"

* status 1..1 MS
* reasonCode 0..* MS
* reasonCode from HIV.B.DE191 (extensible)
* start 1..1 MS
* start ^short = "Recommended or scheduled follow-up date/time"
* start ^definition = "Date and time when HTS follow-up is recommended or scheduled."
* end 0..1 MS
* participant 1..* MS
* participant.actor 1..1 MS
* participant.actor only Reference(HivPatient)
* participant.status 1..1 MS
