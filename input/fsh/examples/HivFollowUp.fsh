Instance: ExampleHivFollowUpAppointment
InstanceOf: HivFollowUpAppointment
Title: "Example HIV Follow-up Appointment"
Description: "Example planned HIV.H follow-up appointment for a missed appointment."

* status = #booked
* reasonCode[+] = HIVConcepts#HIV.H.DE2 "Missed care visit"
* start = "2023-04-01T09:00:00Z"
* end = "2023-04-01T09:30:00Z"
* participant[+].actor = Reference(ExampleHivPatient)
* participant[=].status = #accepted

Instance: ExampleHivFollowUpContact
InstanceOf: HivFollowUpContact
Title: "Example HIV Follow-up Contact"
Description: "Example completed HIV.H follow-up phone contact after a missed appointment."

* status = #completed
* subject = Reference(ExampleHivPatient)
* recipient[+] = Reference(ExampleHivPatient)
* sender = Reference(ExampleHivPractitioner)
* sent = "2023-04-01T09:15:00Z"
* medium[+] = HIVConcepts#HIV.H.DE16 "Phone"
* reasonCode[+] = HIVConcepts#HIV.H.DE2 "Missed care visit"
* about[+] = Reference(ExampleHivFollowUpAppointment)
* extension[clientContactTraced].valueBoolean = true
* extension[contactTracedBy].valueString = "Facility follow-up nurse"
* extension[sourceOfInformation].valueCodeableConcept = HIVConcepts#HIV.H.DE18 "Client"
* extension[outreachOutcome].valueCodeableConcept = HIVConcepts#HIV.H.DE24 "Returning to clinic"
* extension[movedFromCatchmentArea].valueBoolean = false
* extension[partnerOrContactOfIndexCase].valueBoolean = false
* extension[adherenceAssessment].valueBoolean = true
* note.text = "Client reached by phone and agreed to return to clinic."
