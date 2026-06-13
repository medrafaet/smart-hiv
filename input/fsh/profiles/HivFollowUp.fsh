Extension: HivFollowUpClientContactTraced
Id: hiv-follow-up-client-contact-traced
Title: "HIV Follow-up Client Contact Traced"
Description: "Indicates whether the client was traced or contacted during follow-up. Supports Ethiopia HIV.H.DE10."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only boolean
* valueBoolean 1..1 MS

Extension: HivFollowUpContactTracedBy
Id: hiv-follow-up-contact-traced-by
Title: "HIV Follow-up Contact Traced By"
Description: "Person or role that traced or attempted to contact the client. Supports Ethiopia HIV.H.DE12."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only string
* valueString 1..1 MS

Extension: HivFollowUpOtherReason
Id: hiv-follow-up-other-reason
Title: "HIV Follow-up Other Reason"
Description: "Free-text description when the reason for follow-up is Other. Supports Ethiopia HIV.H.DE9."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only string
* valueString 1..1 MS

Extension: HivFollowUpSourceOfInformation
Id: hiv-follow-up-source-of-information
Title: "HIV Follow-up Source Of Information"
Description: "Source of information about the client. Supports Ethiopia HIV.H.DE17."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.H.DE17 (required)

Extension: HivFollowUpOtherSourceOfInformation
Id: hiv-follow-up-other-source-of-information
Title: "HIV Follow-up Other Source Of Information"
Description: "Free-text source when the source of information is Other. Supports Ethiopia HIV.H.DE22."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only string
* valueString 1..1 MS

Extension: HivFollowUpOutreachOutcome
Id: hiv-follow-up-outreach-outcome
Title: "HIV Follow-up Outreach Outcome"
Description: "Detailed outcome from the attempt to locate or follow up with the client. Supports Ethiopia HIV.H.DE23."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.H.DE23 (required)

Extension: HivFollowUpMovedFromCatchmentArea
Id: hiv-follow-up-moved-from-catchment-area
Title: "HIV Follow-up Moved From Catchment Area"
Description: "Indicates whether the client changed address or moved from the catchment area. Supports Ethiopia HIV.H.DE30."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only boolean
* valueBoolean 1..1 MS

Extension: HivFollowUpDateMovedFromCatchmentArea
Id: hiv-follow-up-date-moved-from-catchment-area
Title: "HIV Follow-up Date Moved From Catchment Area"
Description: "Date the client changed address or moved from the catchment area. Supports Ethiopia HIV.H.DE31."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only date
* valueDate 1..1 MS

Extension: HivFollowUpNewCatchmentArea
Id: hiv-follow-up-new-catchment-area
Title: "HIV Follow-up New Catchment Area"
Description: "New catchment area where the client resides. Supports Ethiopia HIV.H.DE32."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only string
* valueString 1..1 MS

Extension: HivFollowUpPartnerOrContactOfIndexCase
Id: hiv-follow-up-partner-or-contact-of-index-case
Title: "HIV Follow-up Partner Or Contact Of Index Case"
Description: "Indicates whether the client was identified by an index case as a partner or contact. Supports Ethiopia HIV.H.DE33."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only boolean
* valueBoolean 1..1 MS

Extension: HivFollowUpPartnerOrContactHivStatus
Id: hiv-follow-up-partner-or-contact-hiv-status
Title: "HIV Follow-up Partner Or Contact HIV Status"
Description: "HIV status of the partner or contact given by the index case. Supports Ethiopia HIV.H.DE34."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.H.DE34 (required)

Extension: HivFollowUpDateOfDeath
Id: hiv-follow-up-date-of-death
Title: "HIV Follow-up Date Of Death"
Description: "Reported date of death collected during follow-up. Supports Ethiopia HIV.H.DE38."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only date
* valueDate 1..1 MS

Extension: HivFollowUpCauseOfDeath
Id: hiv-follow-up-cause-of-death
Title: "HIV Follow-up Cause Of Death"
Description: "Reported cause of death collected during follow-up. Supports Ethiopia HIV.H.DE39."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only string
* valueString 1..1 MS

Extension: HivFollowUpPlaceOfDeath
Id: hiv-follow-up-place-of-death
Title: "HIV Follow-up Place Of Death"
Description: "Reported place of death collected during follow-up. Supports Ethiopia HIV.H.DE40."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only string
* valueString 1..1 MS

Extension: HivFollowUpHivTreatmentOutcome
Id: hiv-follow-up-hiv-treatment-outcome
Title: "HIV Follow-up HIV Treatment Outcome"
Description: "HIV treatment outcome used for retention and attrition reporting. Supports Ethiopia HIV.H.DE41."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.H.DE41 (required)

Extension: HivFollowUpDatePatientLostToFollowUp
Id: hiv-follow-up-date-patient-lost-to-follow-up
Title: "HIV Follow-up Date Patient Lost To Follow-up"
Description: "Date the patient was lost to follow-up. Supports Ethiopia HIV.H.DE46."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only date
* valueDate 1..1 MS

Extension: HivFollowUpDateTreatmentOutcomeChanged
Id: hiv-follow-up-date-treatment-outcome-changed
Title: "HIV Follow-up Date Treatment Outcome Changed"
Description: "Date the HIV treatment outcome changed. Supports Ethiopia HIV.H.DE48."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only date
* valueDate 1..1 MS

Extension: HivFollowUpTransferConfirmed
Id: hiv-follow-up-transfer-confirmed
Title: "HIV Follow-up Transfer Confirmed"
Description: "Indicates whether transfer to another facility was confirmed. Supports Ethiopia HIV.H.DE49."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only boolean
* valueBoolean 1..1 MS

Extension: HivFollowUpTransferToFacility
Id: hiv-follow-up-transfer-to-facility
Title: "HIV Follow-up Transfer To Facility"
Description: "Facility to which the client transferred. Supports Ethiopia HIV.H.DE50 as an Organization reference pending national facility-registry confirmation."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only Reference
* valueReference 1..1 MS
* valueReference only Reference(Organization)

Extension: HivFollowUpDateOfTransferOut
Id: hiv-follow-up-date-of-transfer-out
Title: "HIV Follow-up Date Of Transfer Out"
Description: "Date the client transferred out. Supports Ethiopia HIV.H.DE51."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only date
* valueDate 1..1 MS

Extension: HivFollowUpAdherenceAssessment
Id: hiv-follow-up-adherence-assessment
Title: "HIV Follow-up Adherence Assessment"
Description: "Indicates whether adherence was assessed during follow-up. Supports Ethiopia HIV.H.DE52."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only boolean
* valueBoolean 1..1 MS

Extension: HivFollowUpAdherenceProblemReason
Id: hiv-follow-up-adherence-problem-reason
Title: "HIV Follow-up Adherence Problem Reason"
Description: "Reason the client is not adherent. Supports Ethiopia HIV.H.DE53; binding is preferred pending review of Ethiopia-specific additions and shifted option labels."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.H.DE53 (preferred)

Extension: HivFollowUpOtherAdherenceProblemReason
Id: hiv-follow-up-other-adherence-problem-reason
Title: "HIV Follow-up Other Adherence Problem Reason"
Description: "Free-text reason when the adherence problem reason is Other. Supports Ethiopia HIV.H.DE73."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only string
* valueString 1..1 MS

Extension: HivFollowUpDateArtStopped
Id: hiv-follow-up-date-art-stopped
Title: "HIV Follow-up Date ART Stopped"
Description: "Date on which the client stopped ART. Supports Ethiopia HIV.H.DE74."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only date
* valueDate 1..1 MS

Extension: HivFollowUpReasonArtStopped
Id: hiv-follow-up-reason-art-stopped
Title: "HIV Follow-up Reason ART Stopped"
Description: "Reason the client intentionally stopped ART. Supports Ethiopia HIV.H.DE75; binding is preferred pending review of Ethiopia-specific additions and shifted option labels."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from HIV.H.DE74 (preferred)

Extension: HivFollowUpOtherReasonArtStopped
Id: hiv-follow-up-other-reason-art-stopped
Title: "HIV Follow-up Other Reason ART Stopped"
Description: "Free-text reason when the reason ART stopped is Other. Supports Ethiopia HIV.H.DE82."
* ^context[+].type = #element
* ^context[=].expression = "Communication"
* value[x] only string
* valueString 1..1 MS

Invariant: hiv-h-follow-up-other-reason
Description: "If reason for follow-up is Other, other follow-up reason should be captured."
Severity: #warning
Expression: "reasonCode.coding.where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.H.DE8').exists() implies extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-other-reason').exists()"

Invariant: hiv-h-follow-up-other-source
Description: "If source of information is Other, other source of information should be captured."
Severity: #warning
Expression: "extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-source-of-information').value.coding.where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.H.DE21').exists() implies extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-other-source-of-information').exists()"

Invariant: hiv-h-follow-up-moved-address
Description: "If client changed address or moved from catchment area, date moved or new catchment area should be captured when known."
Severity: #warning
Expression: "extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-moved-from-catchment-area').value = true implies (extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-date-moved-from-catchment-area').exists() or extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-new-catchment-area').exists())"

Invariant: hiv-h-follow-up-died-reported
Description: "If outreach outcome is Died reported, date, cause, or place of death should be captured when known."
Severity: #warning
Expression: "extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-outreach-outcome').value.coding.where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.H.DE29').exists() implies (extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-date-of-death').exists() or extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-cause-of-death').exists() or extension('http://smart.who.int/hiv/StructureDefinition/hiv-follow-up-place-of-death').exists())"

Profile: HivFollowUpAppointment
Parent: Appointment
Title: "HIV Follow-up Appointment"
Description: "Appointment representing a planned HIV.H follow-up or tracing contact for a client."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^status = #active
* ^title = "HIV Follow-up Appointment"

* status 1..1 MS
* reasonCode 1..* MS
* reasonCode from HIV.H.DE1 (extensible)
* start 1..1 MS
* start ^short = "Scheduled follow-up date/time"
* end 0..1 MS
* participant 1..* MS
* participant.actor 1..1 MS
* participant.actor only Reference(HivPatient)
* participant.status 1..1 MS
* supportingInformation 0..* MS
* supportingInformation only Reference(HivFollowUpContact)

Profile: HivFollowUpContact
Parent: Communication
Title: "HIV Follow-up Contact"
Description: "Communication profile representing a completed or attempted HIV.H follow-up/tracing contact with a client."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^status = #active
* ^title = "HIV Follow-up Contact"
* obeys hiv-h-follow-up-other-reason and hiv-h-follow-up-other-source and hiv-h-follow-up-moved-address and hiv-h-follow-up-died-reported

* extension contains
    HivFollowUpClientContactTraced named clientContactTraced 0..1 MS and
    HivFollowUpContactTracedBy named contactTracedBy 1..1 MS and
    HivFollowUpOtherReason named otherFollowUpReason 0..1 MS and
    HivFollowUpSourceOfInformation named sourceOfInformation 1..1 MS and
    HivFollowUpOtherSourceOfInformation named otherSourceOfInformation 0..1 MS and
    HivFollowUpOutreachOutcome named outreachOutcome 0..1 MS and
    HivFollowUpMovedFromCatchmentArea named movedFromCatchmentArea 0..1 MS and
    HivFollowUpDateMovedFromCatchmentArea named dateMovedFromCatchmentArea 0..1 MS and
    HivFollowUpNewCatchmentArea named newCatchmentArea 0..1 MS and
    HivFollowUpPartnerOrContactOfIndexCase named partnerOrContactOfIndexCase 0..1 MS and
    HivFollowUpPartnerOrContactHivStatus named partnerOrContactHivStatus 0..1 MS and
    HivFollowUpDateOfDeath named dateOfDeath 0..1 MS and
    HivFollowUpCauseOfDeath named causeOfDeath 0..1 MS and
    HivFollowUpPlaceOfDeath named placeOfDeath 0..1 MS and
    HivFollowUpHivTreatmentOutcome named hivTreatmentOutcome 0..1 MS and
    HivFollowUpDatePatientLostToFollowUp named datePatientLostToFollowUp 0..1 MS and
    HivFollowUpDateTreatmentOutcomeChanged named dateTreatmentOutcomeChanged 0..1 MS and
    HivFollowUpTransferConfirmed named transferConfirmed 0..1 MS and
    HivFollowUpTransferToFacility named transferToFacility 0..1 MS and
    HivFollowUpDateOfTransferOut named dateOfTransferOut 0..1 MS and
    HivFollowUpAdherenceAssessment named adherenceAssessment 0..1 MS and
    HivFollowUpAdherenceProblemReason named adherenceProblemReason 0..* MS and
    HivFollowUpOtherAdherenceProblemReason named otherAdherenceProblemReason 0..1 MS and
    HivFollowUpDateArtStopped named dateArtStopped 0..1 MS and
    HivFollowUpReasonArtStopped named reasonArtStopped 0..* MS and
    HivFollowUpOtherReasonArtStopped named otherReasonArtStopped 0..1 MS

* status 1..1 MS
* subject 1..1 MS
* subject only Reference(HivPatient)
* recipient 1..* MS
* recipient only Reference(HivPatient)
* sender 0..1 MS
* sent 1..1 MS
* sent ^short = "Date of contact traced"
* sent ^definition = "Date and time of the follow-up contact or tracing attempt. Supports Ethiopia HIV.H.DE11."
* medium 1..* MS
* medium ^short = "Contact method"
* medium from HIV.H.DE13 (extensible)
* reasonCode 1..* MS
* reasonCode ^short = "Reason for follow-up"
* reasonCode from HIV.H.DE1 (extensible)
* about 0..* MS
* about only Reference(HivFollowUpAppointment)
* note 0..* MS
