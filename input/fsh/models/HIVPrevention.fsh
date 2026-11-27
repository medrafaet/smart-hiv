Invariant: hiv-prevention-access-date
Description: "An intervention access record requires the documented date of access."
Expression: "hivPreventionIntervention.exists() implies dateAccessedHivPreventionIntervention.exists()"
Severity: #error

Invariant: hiv-prevention-event-dates
Description: "Enter today or an earlier date for documented prevention events."
Expression: "(dateAccessedHivPreventionIntervention | dateOamtInitiated | dateOamtDoseReceived | dateOamtTakeAwayDosesDispensed | dateFirstMaintenanceDoseReceived | dateOfLossToFollowUpOrOamtStopped | dateMedicationsDispensed | dateMedicationsPrescribed).where($this > today()).empty()"
Severity: #error

Logical: HIVPrevention
Title: "HIV.Prevention"
Description: "HIV prevention service access, reported contact status, OAMT history and related medication records."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^experimental = true
* ^name = "HIVPrevention"
* ^version = "2026-10"
* ^status = #active
* obeys hiv-prevention-access-date and hiv-prevention-event-dates

* atElevatedRiskForHivAcquisition 0..1 boolean "At substantial risk for HIV acquisition" "Client is at elevated risk for HIV acquisition, defined according to country/programme context"
  * ^code[+] = HIVConcepts#HIV.PRV.DE1
* hivPreventionIntervention 0..1 Coding "HIV prevention intervention" "One prevention service through which the client accessed services at this facility"
  * ^code[+] = HIVConcepts#HIV.PRV.DE2
* hivPreventionIntervention from HIV.PRV.DE2
* otherHivPreventionIntervention 0..1 string "Other (specify)" "Client accessed other HIV prevention services (specify)"
  * ^code[+] = HIVConcepts#HIV.PRV.DE9
* dateAccessedHivPreventionIntervention 0..1 date "Date accessed HIV prevention intervention" "Date the client accessed HIV prevention intervention"
  * ^code[+] = HIVConcepts#HIV.PRV.DE10
* hivStatusOfContact 0..1 Coding "HIV status of contact" "The HIV status of the client's contact"
  * ^code[+] = HIVConcepts#HIV.PRV.DE11
* hivStatusOfContact from HIV.PRV.DE11
* dateInjectingEquipmentProvided 0..1 date "Legacy date injecting equipment provided" "Retained for exchange of earlier records"
  * ^code[+] = HIVConcepts#HIV.PRV.DE15
* numberOfNeedlesSyringesProvided 0..1 integer "Legacy number of needles-syringes provided" "Retained for exchange of earlier records"
  * ^code[+] = HIVConcepts#HIV.PRV.DE16
* dateOamtInitiated 0..1 date "Date OAMT initiated" "Date client initiated opioid agonist maintenance treatment (OAMT)"
  * ^code[+] = HIVConcepts#HIV.PRV.DE17
* dateOamtDoseReceived 0..1 date "Date OAMT dose received" "Date client received opioid agonist maintenance treatment (OAMT) dose"
  * ^code[+] = HIVConcepts#HIV.PRV.DE18
* dateOamtTakeAwayDosesDispensed 0..1 date "Date OAMT take-away dose(s) dispensed" "Date the client was dispensed opioid agonist maintenance treatment (OAMT) take-away dose(s)"
  * ^code[+] = HIVConcepts#HIV.PRV.DE19
* currentlyOnOamt 0..1 boolean "Currently on OAMT" "Client is currently on opioid agonist maintenance treatment (OAMT) at reporting date, defined according to country/program to account for medication dispensed and LTFU criterion"
  * ^code[+] = HIVConcepts#HIV.PRV.DE20
* retainedOnOamt 0..1 boolean "Retained on OAMT" "Client is retained on opioid agonist maintenance treatment (OAMT) at reporting date, defined according to country/program to account for medication dispensed and LTFU criterion"
  * ^code[+] = HIVConcepts#HIV.PRV.DE21
* clientBeingInductedOnOamt 0..1 boolean "Client being inducted on OAMT" "Client is currently being inducted on opioid agonist maintenance treatment (OAMT), defined according to country/program"
  * ^code[+] = HIVConcepts#HIV.PRV.DE22
* clientOnReducingDosesOfOamt 0..1 boolean "Client on reducing doses of OAMT" "Client is current on reducing doses of opioid agonist maintenance treatment (OAMT), defined according to country/program"
  * ^code[+] = HIVConcepts#HIV.PRV.DE23
* dateFirstMaintenanceDoseReceived 0..1 date "Date first maintenance dose received" "First date on which client received maintenance dose"
  * ^code[+] = HIVConcepts#HIV.PRV.DE24
* dateOfLossToFollowUpOrOamtStopped 0..1 date "Date of loss to follow-up or OAMT stopped" "Date of loss to follow-up or opioid agonist maintenance treatment (OAMT) stopped"
  * ^code[+] = HIVConcepts#HIV.PRV.DE25
* dateMedicationsDispensed 0..1 date "Date medications dispensed" "Date the client was dispensed medications"
  * ^code[+] = HIVConcepts#HIV.PRV.DE26
* dateMedicationsPrescribed 0..1 date "Date medications prescribed" "Date the client was prescribed medications"
  * ^code[+] = HIVConcepts#HIV.PRV.DE27
* numberOfDaysPrescribed 0..1 integer "Number of days prescribed" "Days of medication client has been prescribed"
  * ^code[+] = HIVConcepts#HIV.PRV.DE28
