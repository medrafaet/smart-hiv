Invariant:    HIV-C-1
Description:  "Date <= Current Date"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant:    HIV-C-2
Description:  "True if 'Gender'='Female'"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant:    HIV-C-3
Description:  "True if 'Gender'='Male'"
Expression:   "'NOT IMPLEMENTED'"
Severity:     #error

Invariant: prep-visit-reason
Description: "Record a PrEP visit type or PEP counselling."
Expression: "reasonForPrepVisit.exists() or counsellingOnPep.where($this = true).exists()"
Severity: #error

Invariant: prep-serum-creatinine-result
Description: "Serum creatinine requires a nonnegative concentration in mg/dL or umol/L."
Expression: "system.where($this = 'http://unitsofmeasure.org').exists() and code.where($this in ('mg/dL' | 'umol/L')).exists() and value.where($this >= 0).exists()"
Severity: #error

Logical: HIVCPrEPvisit
Title: "HIV.C PrEP visit"
Description: "This tab describes the data that may be collected during the pre-exposure prophylaxis (PrEP) or post-exposure prophylaxis (PEP) workflow (HIV.C)"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^experimental = true
* ^name = "HIVCPrEPvisit"
* ^status = #active

* ^mapping[+].identity = "moh-hiv-dak"
* ^mapping[=].name = "Ethiopia MoH HIV Data Dictionary"
* ^mapping[+].identity = "fhir"
* ^mapping[=].name = "FHIR R4"
* obeys prep-visit-reason

* reasonForPrepVisit 0..1 Coding "Type of PrEP visit" "Client's type of PrEP visit. A PrEP visit type is required when PEP counselling does not apply."
  * ^code[+] = HIVConcepts#HIV.C.DE1
* reasonForPrepVisit from HIV.C.DE1
* counsellingOnPep 0..1 boolean "Counselling on PEP" "Whether counselling on post-exposure prophylaxis was provided."
  * ^code[+] = HIVConcepts#HIV.C.DE5
* prepFollowUpVisitDate 0..1 date "PrEP follow-up visit date" "Date of the PrEP follow-up visit."
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.C.DE7"
* twoMonthPrepFollowUpVisit 0..1 boolean "2-month PrEP follow-up visit" "Whether the client attended the 2-month follow-up for injectable cabotegravir PrEP."
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.C.ET.DE7.1"
* sixMonthPrepFollowUpVisit 0..1 boolean "6-month PrEP follow-up visit" "Whether the client attended the 6-month follow-up for injectable lenacapavir PrEP."
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.C.ET.DE7.2"
* contactWithAndSuspectedExposureToHiv 0..1 boolean "Contact with and (suspected) exposure to HIV" "The client had suspected or known exposure to HIV"
  * ^code[+] = HIVConcepts#HIV.C.DE8
* exposureSource 0..1 Coding "Source of exposure" "Reported source of known or suspected exposure to HIV."
  * ^code[+] = HIVConcepts#HIV.C.ET.DE1
* exposureSource from HIV.C.ET.DE1 (required)
* otherExposureSource 0..1 string "Other exposure source" "Details of the reported exposure source when Other is selected."
  * ^code[+] = HIVConcepts#HIV.C.ET.DE8
* exposureDuration 0..1 Quantity "Exposure duration" "Elapsed time from exposure to presentation for PEP services, recorded in UCUM hours."
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.C.DE9"
* currentlyOnPrep 0..1 boolean "Currently on PrEP" "The client has initiated PrEP and has not discontinued it at the time of assessment."
  * ^code[+] = HIVConcepts#HIV.C.DE10
* prepDosingType 0..1 Coding "PrEP dosing type" "How the client currently takes PrEP."
  * ^code[+] = HIVConcepts#HIV.C.DE11
* prepDosingType from HIV.C.DE11
* currentPrepRegimen 0..1 Coding "Current PrEP regimen" "HIV pre-exposure prophylaxis (PrEP) regimen"
  * ^code[+] = HIVConcepts#HIV.C.DE17
* currentPrepRegimen from HIV.C.DE17
* experienceWithPrep 0..1 Coding "Experience with PrEP" "The client's experience in taking PrEP"
  * ^code[+] = HIVConcepts#HIV.C.DE24
* experienceWithPrep from HIV.C.DE24
* prepStartDate 0..1 date "PrEP start date" "The date on which the client started or restarted pre-exposure prophylaxis (PrEP)"
  * ^code[+] = HIVConcepts#HIV.C.DE28
* stoppedPrep 0..1 boolean "Stopped PrEP" "Client stopped taking pre-exposure prophylaxis (PrEP)"
  * ^code[+] = HIVConcepts#HIV.C.DE29
* datePrepStopped 0..1 date "Date PrEP stopped" "Date client stopped taking pre-exposure prophylaxis (PrEP)"
  * ^code[+] = HIVConcepts#HIV.C.DE30
* pepHistory 0..1 Coding "PEP history" "The client's history in taking post-exposure prophylaxis (PEP) for HIV prevention"
  * ^code[+] = HIVConcepts#HIV.C.DE31
* pepHistory from HIV.C.DE31
* datesOfPastPepUse 0..* date "Date(s) of past PEP use" "Dates when the client previously used post-exposure prophylaxis (PEP)"
  * ^code[+] = HIVConcepts#HIV.C.DE34
* dateClientCompletesPepCourse 0..1 date "Date client completes PEP course" "Date client completes PEP course"
  * ^code[+] = HIVConcepts#HIV.C.DE35
* signsOfSubstantialRiskOfHivInfection 0..* Coding "Evidence of substantial risk of HIV infection" "Recorded evidence of substantial risk when any listed factor applies."
  * ^code[+] = HIVConcepts#HIV.C.DE36
* signsOfSubstantialRiskOfHivInfection from HIV.C.DE36
* acuteHivInfectionSymptoms 0..* Coding "Acute HIV infection symptoms" "Symptoms that could suggest an acute HIV infection"
  * ^code[+] = HIVConcepts#HIV.C.DE46
* acuteHivInfectionSymptoms from HIV.C.DE46
* sexPartnerHivTreatmentStatus 0..* Coding "Sex partner's HIV treatment status" "Treatment adherence of client's sex partner for partners that are HIV-positive"
  * ^code[+] = HIVConcepts#HIV.C.DE55
* sexPartnerHivTreatmentStatus from HIV.C.DE55
* suitableForPrep 0..1 boolean "Suitable for PrEP" "The client is suitable for PrEP"
  * ^code[+] = HIVConcepts#HIV.C.DE61
* offeredPrep 0..1 boolean "Offered PrEP" "After being evaluated as suitable for PrEP, the client was offered PrEP"
  * ^code[+] = HIVConcepts#HIV.C.DE62
* screeningsAndDiagnosticsForPrepUsers 0..* Coding "Screenings and diagnostics for PrEP users" "Listing of tests for clients on or starting pre-exposure prophylaxis (PrEP) that may be recommended or should be considered"
  * ^code[+] = HIVConcepts#HIV.C.DE63
* screeningsAndDiagnosticsForPrepUsers from HIV.C.DE63
* serumCreatinineTestDate 0..1 date "Serum creatinine test date" "Date the serum creatinine test was performed."
  * ^code[+] = HIVConcepts#HIV.C.DE71
  * ^mapping[+].identity = "fhir"
  * ^mapping[=].map = "Observation.effectiveDateTime"
* serumCreatinineTestResult 0..1 Quantity "Serum creatinine test result" "Reported serum creatinine concentration in mg/dL or umol/L."
  * ^code[+] = HIVConcepts#HIV.C.DE72
  * ^mapping[+].identity = "fhir"
  * ^mapping[=].map = "Observation.valueQuantity"
* serumCreatinineTestResult obeys prep-serum-creatinine-result
* datePrepDispensedAndStarted 0..1 date "Date PrEP was dispensed and started" "Date when the client both received and started PrEP."
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.C.DE73"
* medicationsPrescribed 0..1 Coding "Medications prescribed" "Medications the client was prescribed"
  * ^code[+] = HIVConcepts#HIV.C.DE75
* medicationsPrescribed from HIV.C.DE75
* prepProductPrescribed 0..1 Coding "PrEP product prescribed" "PrEP product that the client was prescribed"
  * ^code[+] = HIVConcepts#HIV.C.DE80
* prepProductPrescribed from HIV.C.DE80
* otherPrepProductPrescribed 0..1 string "Other (specify)" "Client was prescribed other PrEP product (specify)"
  * ^code[+] = HIVConcepts#HIV.C.DE85
* datePrepStarted 0..1 date "PrEP started date" "Date when the client started taking PrEP."
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.C.DE86"
* volumeOfPrepProductPrescribedDispensed 0..1 integer "Volume of PrEP product prescribed/dispensed" "Volume of PrEP product the client was prescribed or dispensed (for example, number of pills, number of devices)"
  * ^code[+] = HIVConcepts#HIV.C.DE88
* pepEnrolmentDate 0..1 date "PEP enrolment date" "Date the client was enrolled and prescribed PEP."
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.C.DE89"
* datePepCourseCompletion 0..1 date "Date PEP course completion" "Date client completes PEP course"
  * ^code[+] = HIVConcepts#HIV.C.DE90
* pepRegimenType 0..1 Coding "Recorded PEP regimen type" "Whether the documented PEP regimen contains two or three drugs."
  * ^mapping[+].identity = "moh-hiv-dak"
  * ^mapping[=].map = "HIV.C.DE91"
* pepRegimenType from HIV.C.DE91-regimen-type (required)
* twoDrugPepRegimen 0..1 Coding "Recorded two-drug PEP combination" "Documented two-drug PEP combination when applicable."
  * ^code[+] = HIVConcepts#HIV.C.ET.DE92
* twoDrugPepRegimen from HIV.C.ET.DE92 (required)
* threeDrugPepRegimen 0..1 Coding "Recorded three-drug PEP combination" "Documented three-drug PEP combination when applicable."
  * ^code[+] = HIVConcepts#HIV.C.ET.DE93
* threeDrugPepRegimen from HIV.C.ET.DE93 (required)
* preferredThirdPepDrug 0..* Coding "Preferred third PEP drug" "Preferred third drug for PEP"
  * ^code[+] = HIVConcepts#HIV.C.DE99
* preferredThirdPepDrug from HIV.C.DE99
* alternativeThirdPepDrug 0..* Coding "Alternative third PEP drug" "Alternative third drug for PEP"
  * ^code[+] = HIVConcepts#HIV.C.DE101
* alternativeThirdPepDrug from HIV.C.DE101
* dateOfSampleCollection 0..1 dateTime "Date of sample collection" "Date when the specimen was collected"
  * ^code[+] = HIVConcepts#HIV.C.DE111
* contraindicationsToPrepUsage 0..* Coding "Contraindications to PrEP usage" "Listing of contraindications to pre-exposure prophylaxis (PrEP)"
  * ^code[+] = HIVConcepts#HIV.C.DE112
* contraindicationsToPrepUsage from HIV.C.DE112
* otherAllergyOrContraindicationToAMedicineInThePrepRegimenSpecify 0..1 string "Other allergy or contraindication to a medicine in the PrEP regimen (specify)" "Client has another allergy or contraindication to a medicine in the pre-exposure prophylaxis (PrEP) regimen (specify)"
  * ^code[+] = HIVConcepts#HIV.C.DE119
* prescribedPrepAtInitialVisit 0..1 boolean "Prescribed PrEP at initial visit" "Client was prescribed pre-exposure prophylaxis (PrEP) on a first visit"
  * ^code[+] = HIVConcepts#HIV.C.DE120
* numberOfDaysPrescribed 0..1 integer "Number of days prescribed" "Days of medication client has been prescribed"
  * ^code[+] = HIVConcepts#HIV.C.DE121
* prepRegimenPrescribed 0..* CodeableConcept "PrEP regimen prescribed" "HIV pre-exposure prophylaxis (PrEP) regimen prescribed"
  * ^code[+] = HIVConcepts#HIV.C.DE122
* prepRegimenPrescribed from HIV.C.DE122 (extensible)
* adherenceCounsellingProvided 0..1 boolean "Adherence counselling provided" "Whether adherence counselling was provided"
  * ^code[+] = HIVConcepts#HIV.C.DE123
* dateTimeOfFollowUpAppointment 0..1 dateTime "Date/time of follow-up appointment" "Date the client is to return for monitoring, re-supply, or any other reason"
  * ^code[+] = HIVConcepts#HIV.C.DE124
  * ^mapping[+].identity = "fhir"
  * ^mapping[=].map = "Appointment.start"
* typeOfFollowUpAppointment 0..1 Coding "Type of follow-up appointment" "Type of follow-up appointment for testing services"
  * ^code[+] = HIVConcepts#HIV.C.DE125
  * ^mapping[+].identity = "fhir"
  * ^mapping[=].map = "Appointment.reasonCode"
* typeOfFollowUpAppointment from HIV.C.DE125
* otherTypeOfFollowUpAppointment 0..1 string "Other (specify)" "Other reason for the follow-up appointment (specify)"
  * ^code[+] = HIVConcepts#HIV.C.DE129
  * ^mapping[+].identity = "fhir"
  * ^mapping[=].map = "Appointment.reasonCode.text"
* linkedToEnrolmentInCareAndArtInitiation 0..1 boolean "Linked to enrolment in care and ART initiation" "Linkage made from HIV testing to enrolment in care following an HIV diagnosis"
  * ^code[+] = HIVConcepts#HIV.C.DE130
* preventionServicesOfferedAndReferrals 0..* Coding "Prevention services offered and referrals" "Offer or refer to prevention services"
  * ^code[+] = HIVConcepts#HIV.C.DE131
* preventionServicesOfferedAndReferrals from HIV.C.DE131
* dateProvidedCondoms 0..1 date "Date provided condoms" "Date client was provided with condoms"
  * ^code[+] = HIVConcepts#HIV.C.DE136
* condomsDistributed 0..1 integer "Condoms distributed" "Number of condoms given to the client, if any were distributed"
  * ^code[+] = HIVConcepts#HIV.C.DE137
* condomType 0..1 Coding "Condom type" "Type of condom provided to client"
  * ^code[+] = HIVConcepts#HIV.C.DE138
* condomType from HIV.C.DE138
* hivSelfTestKitsAccepted 0..1 boolean "HIV self-test kits accepted" "Whether any HIV self-test kits were given to the client"
  * ^code[+] = HIVConcepts#HIV.C.DE141
* numberOfHivSelfTestKitsDistributed 0..1 integer "Number of HIV self-test kits distributed" "Number of HIV self-test kits distributed to the client"
  * ^code[+] = HIVConcepts#HIV.C.DE142
* hivSelfTestDistributedForUseBy 0..1 Coding "HIV self-test distributed for use by" "Whom the client plans to give the HIV self-test kit (self, sexual partner, social contact, etc.)"
  * ^code[+] = HIVConcepts#HIV.C.DE143
* hivSelfTestDistributedForUseBy from HIV.C.DE143
* sexualAndReproductiveHealthIntegratedServices 0..* Coding "Sexual and reproductive health integrated services" "Offer or refer to sexual and reproductive health services"
  * ^code[+] = HIVConcepts#HIV.C.DE149
* sexualAndReproductiveHealthIntegratedServices from HIV.C.DE149
* offerOtherClinicalServices 0..* Coding "Offer other clinical services" "Other clinical services offered or referrals given to the client"
  * ^code[+] = HIVConcepts#HIV.C.DE157
* offerOtherClinicalServices from HIV.C.DE157
* otherSupportServices 0..* Coding "Other support services" "Offer or refer for other support services"
  * ^code[+] = HIVConcepts#HIV.C.DE164
* otherSupportServices from HIV.C.DE164
