Invariant: hiv-surveillance-event-dates
Description: "Record documented surveillance dates and times at or before the current time."
Expression: "(hivTestDate | artStartDate | dateOfCd4SampleCollection | dateOfFirstAidsDiagnosis | ancContactDate).all($this.toDate() <= today().toString().substring(0, $this.toString().length()).toDate()) and (dateOfBaselineCd4CountTest | dateOfFirstViralLoadSampleCollection | followUpDate | dateOfDeath).where($this.toDateTime() > now()).empty()"
Severity: #error

Invariant: hiv-surveillance-test-date
Description: "An overall HIV test result requires its test date."
Expression: "hivTestResult.exists() implies hivTestDate.exists()"
Severity: #error

Invariant: hiv-surveillance-cd4-sample
Description: "A current CD4 count requires its sample collection date."
Expression: "cd4Count.exists() implies dateOfCd4SampleCollection.exists()"
Severity: #error

Invariant: hiv-surveillance-lab-counts
Description: "Record nonnegative CD4 and viral load counts."
Expression: "(baselineCd4Count | cd4Count | firstViralLoadTestResult).all($this >= 0)"
Severity: #error

Logical: HIVSurveillance
Title: "HIV.Surveillance"
Description: "Case surveillance projection from documented clinical records for the October 2026 Ethiopia HIV DAK."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^experimental = true
* ^name = "HIVSurveillance"
* ^version = "2026-10"
* ^status = #active
* obeys hiv-surveillance-event-dates and hiv-surveillance-test-date and hiv-surveillance-cd4-sample and hiv-surveillance-lab-counts

* hivTestDate 0..1 date "HIV test date" "Date of the HIV test"
  * ^code = HIVConcepts#HIV.SURV.1

* hivTestResult 0..1 Coding "HIV test result" "The result from HIV testing after applying the testing algorithm"
  * ^code = HIVConcepts#HIV.SURV.2
* hivTestResult from HIV.SURV.2 (required)

* baselineCd4Count 0..1 integer "Baseline CD4 count" "CD4 count from the documented baseline test, in cells/mm³."
  * ^code = HIVConcepts#HIV.SURV.3

* dateOfBaselineCd4CountTest 0..1 dateTime "Date of baseline CD4 count test" "Date and time when baseline CD4 count test was conducted"
  * ^code = HIVConcepts#HIV.SURV.4

* hivClinicalStage 0..1 Coding "HIV clinical staging" "WHO clinical stage of client based on signs and symptoms. WHO clinical staging is a way to categorize HIV disease severity based on new or recurrent clinical events. There are 4 WHO clinical stages that range from mild symptoms (WHO clinical stage 1) to severe symptoms (WHO clinical stage 4)."
  * ^code = HIVConcepts#HIV.SURV.5
* hivClinicalStage from HIV.SURV.5 (required)

* artStartDate 0..1 date "ART start date" "The date on which the client started or restarted ART"
  * ^code = HIVConcepts#HIV.SURV.6

* currentlyPregnant 0..1 boolean "Currently pregnant" "Client is currently pregnant"
  * ^code = HIVConcepts#HIV.SURV.7

* cd4Count 0..1 integer "CD4 count" "CD4 cell count in cells/mm^3"
  * ^code = HIVConcepts#HIV.SURV.8

* dateOfCd4SampleCollection 0..1 date "Date of CD4 sample collection" "Date sample to be used for CD4 count was collected"
  * ^code = HIVConcepts#HIV.SURV.9

* firstViralLoadTestResult 0..1 integer "First viral load test result" "Result from the initial viral load test in number of copies/mL"
  * ^code = HIVConcepts#HIV.SURV.10

* dateOfFirstViralLoadSampleCollection 0..1 dateTime "Date of first viral load sample collection" "Date and time when the sample was collected to test the client's HIV viral load for the first time"
  * ^code = HIVConcepts#HIV.SURV.11

* virallySuppressed 0..1 boolean "Virally suppressed" "Whether the most recent verified quantitative viral load is less than 1000 copies/mL."
  * ^code = HIVConcepts#HIV.SURV.14

* followUpDate 1..1 dateTime "Follow-up date" "The recorded date and time of the client’s visit."
  * ^code = HIVConcepts#HIV.SURV.15

* moreThan28DaysSinceLastAppointment 0..1 boolean "More than 28 days since last scheduled appointment" "Whether more than 28 days have passed since the last scheduled appointment, evaluated on the visit date."
  * ^code = HIVConcepts#HIV.SURV.16

* dateOfFirstAidsDiagnosis 0..1 date "Date of first AIDS diagnosis" "Date of client's first AIDS diagnosis"
  * ^code = HIVConcepts#HIV.SURV.17

* ancContactDate 0..1 date "ANC contact date" "The recorded local calendar date of the antenatal care contact."
  * ^code = HIVConcepts#HIV.SURV.18

* hivExposedInfantOrChild 0..1 boolean "HIV-exposed infant or child" "Whether the infant or child was determined to have had HIV exposure"
  * ^code = HIVConcepts#HIV.SURV.20

* testResultOfHivAssay1 0..1 Coding "Test result of HIV assay 1" "The result of the first HIV assay in the testing strategy"
  * ^code = HIVConcepts#HIV.SURV.21
* testResultOfHivAssay1 from HIV.SURV.21 (required)

* finalDiagnosisOfHivExposedInfant 0..1 Coding "Final diagnosis of HIV-exposed infant" "HIV-exposed infant final status at 18 months or 3 months after cessation of breastfeeding (whichever is later)."
  * ^code = HIVConcepts#HIV.SURV.22
* finalDiagnosisOfHivExposedInfant from HIV.SURV.22 (required)

* dateOfDeath 0..1 dateTime "Date of death" "If died, the date that the client died"
  * ^code = HIVConcepts#HIV.SURV.23

* causeOfDeath 0..1 string "Cause of death" "Cause of death, if known"
  * ^code = HIVConcepts#HIV.SURV.24

* aidsRelatedDeath 0..1 boolean "AIDS-related death" "Death of client was AIDS-related"
  * ^code = HIVConcepts#HIV.SURV.25

Mapping: HIVSurveillanceClinicalSource
Source: HIVSurveillance
Id: clinical-source
Title: "Surveillance clinical source"
Target: "http://smart.who.int/hiv"
Description: "Clinical records from which the Ethiopia surveillance values are obtained."
* hivTestDate -> "HIV.F8/HIV.E.DE224 or HIV.B7/HIV.B.DE110 for the documented test event."
* hivTestResult -> "HIV.B7/HIV.B.DE111 after the HIV testing algorithm. Translate the recorded choice using the surveillance ConceptMap."
* baselineCd4Count -> "HIV.D20/HIV.G.DE3 or HIV.D.DE367 for the documented baseline test. Project whole-number cells/mm³ without rounding fractional source results."
* dateOfBaselineCd4CountTest -> "HIV.D20/HIV.D.DE368 from the same baseline CD4 test. The specimen collection date HIV.G.DE4 describes a separate event."
* hivClinicalStage -> "HIV.D8/HIV.D.DE186. Translate the documented current WHO stage using the surveillance ConceptMap."
* artStartDate -> "HIV.D8/HIV.D.DE39 for documented ART initiation or restart. Preserve the actual date."
* currentlyPregnant -> "HIV.D8/HIV.D.DE31 for the pregnancy status recorded at this encounter."
* cd4Count -> "HIV.D20 laboratory results/HIV.G.DE1 with the sample date from the same result."
* dateOfCd4SampleCollection -> "HIV.D20 laboratory results/HIV.G.DE6 from the same CD4 result."
* firstViralLoadTestResult -> "HIV.D20 laboratory results/HIV.G.DE11. Use the documented initial result in copies/mL."
* dateOfFirstViralLoadSampleCollection -> "HIV.D20 laboratory results/HIV.G.DE9. Use the sample timestamp for the initial test."
* virallySuppressed -> "Care and Treatment diagnostics/HIV.D.DE388. Calculate from the verified most recent numeric viral load in copies/mL."
* followUpDate -> "HIV.A2/HIV.A.DE3 and Encounter.period.start. Preserve the documented encounter time, including data entered later."
* moreThan28DaysSinceLastAppointment -> "HIV.D21/moreThan28DaysSinceLastScheduledAppointment. Compare the visit date to the verified scheduled appointment."
* dateOfFirstAidsDiagnosis -> "HIV.D8/HIV.D.DE654 for the first documented AIDS diagnosis."
* ancContactDate -> "HIV.E1/HIV.E.DE85. Project the recorded local calendar date for ANC encounters and retain the full source timestamp."
* hivExposedInfantOrChild -> "HIV.F6/HIV.SURV.20 calculated from HIV.E.DE108. Keep the value absent if exposure is unknown or unavailable."
* testResultOfHivAssay1 -> "HIV.B7/HIV.B.DE94 or HIV.E4/HIV.E.DE200 for the first HIV assay. Invalid results remain in the source record."
* finalDiagnosisOfHivExposedInfant -> "HIV.F20/HIV.E.DE230 after final diagnosis verification. Unknown status remains in the source record."
* dateOfDeath -> "HIV.D28/HIV.D.DE744 for the documented death of this client."
* causeOfDeath -> "HIV.H3/HIV.H.DE39 when the death is confirmed. Confirm the reported information before using it for surveillance."
* aidsRelatedDeath -> "HIV.D8/HIV.D.DE653 as explicitly documented for a confirmed death."
