Invariant: configuration-quantity-range
Description: "Check rates and percentages in their documented units."
Expression: "(populationPrevalenceOfTb >= 0 and populationPrevalenceOfTb <= 100000) and (populationIncidenceOfHivInTheAbsenceOfPrep >= 0 and populationIncidenceOfHivInTheAbsenceOfPrep <= 100) and (populationPrevalenceOfHiv | prevalenceOfPretreatmentNnrtiDrugResistance | populationPrevalenceOfSyphilis | populationPrevalenceOfHepatitisB | populationPrevalenceOfHepatitisC | prevalenceOfHivInTheCatchmentArea).all($this >= 0 and $this <= 100)"
Severity: #error

Invariant: configuration-reporting-period
Description: "The reporting period end must be on or after its start."
Expression: "(reportingPeriodEndDate >= reportingPeriodStartDate).where($this = false).empty()"
Severity: #error

Invariant: configuration-special-needs
Description: "Select the population with special needs category before recording its groups."
Expression: "populationsWithSpecialNeeds.exists() implies otherPriorityPopulations.where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.Config.ET.DE19').exists()"
Severity: #error

Invariant: configuration-site-identifiers
Description: "Use an MFR Location identifier with a populated value for each documented site."
Expression: "(healthFacilityId | tbTreatingFacilityId).all(system = 'https://fhir-mfr.moh.gov.et/fhir/identifier/mfr-id' and value.where(trim().length() > 0).exists())"
Severity: #error

Logical: HIVConfiguration
Title: "HIV.Configuration"
Description: "Approved population, facility and reporting settings for the October 2026 Ethiopia HIV DAK. The TB treating site is sourced from the client’s documented treatment encounter."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^extension[http://hl7.org/fhir/tools/StructureDefinition/logical-target].valueBoolean = true
* ^experimental = true
* ^name = "HIVConfiguration"
* ^version = "2026-10"
* ^status = #active
* obeys configuration-quantity-range and configuration-reporting-period and configuration-special-needs and configuration-site-identifiers

* populationPrevalenceOfTb 1..1 integer "National TB prevalence (cases per 100,000 people)" "The tuberculosis prevalence in the general population in number of cases per 100 000 persons or greater."
  * ^code[+] = HIVConcepts#HIV.Config.DE1
* populationPrevalenceOfSoilTransmittedHelminthInfection 0..1 integer "Legacy prevalence of soil-transmitted helminth infection" "Historical percentage retained for earlier records"
  * ^code[+] = HIVConcepts#HIV.Config.DE2
* populationIncidenceOfHivInTheAbsenceOfPrep 1..1 integer "National HIV incidence without PrEP (cases per 100 person-years)" "HIV incidence number of cases per 100 person–years in the absence of PrEP"
  * ^code[+] = HIVConcepts#HIV.Config.DE3
* populationPrevalenceOfHiv 1..1 decimal "National prevalence of HIV (%)" "The proportion of the population that are HIV-positive"
  * ^code[+] = HIVConcepts#HIV.Config.DE4
* prevalenceOfPretreatmentNnrtiDrugResistance 1..1 decimal "Prevalence of pretreatment NNRTI drug resistance (%)" "Prevalence of pretreatment HIV drug resistance to NNRTIs among people initiating first-line ART"
  * ^code[+] = HIVConcepts#HIV.Config.DE5
* malariaEndemicSetting 1..1 boolean "Malaria-endemic setting" "Whether the setting is a malaria-endemic setting"
  * ^code[+] = HIVConcepts#HIV.Config.DE6
* populationPrevalenceOfSyphilis 1..1 decimal "National prevalence of syphilis (%)" "The proportion of the population with syphilis"
  * ^code[+] = HIVConcepts#HIV.Config.DE7
* populationPrevalenceOfHepatitisB 1..1 decimal "National prevalence of hepatitis B (%)" "The proportion of hepatitis B surface antigen (HBsAg) seroprevalence in the general population"
  * ^code[+] = HIVConcepts#HIV.Config.DE8
* populationPrevalenceOfHepatitisC 1..1 decimal "National prevalence of hepatitis C (%)" "The proportion of hepatitis C virus (HCV) antibody seroprevalence in the general population"
  * ^code[+] = HIVConcepts#HIV.Config.DE9
* prevalenceOfHivInTheCatchmentArea 1..1 decimal "Prevalence of HIV in woreda (%)" "The proportion of the population from the health facility's catchment area that are HIV-positive (estimated)"
  * ^code[+] = HIVConcepts#HIV.Config.DE10
* ultrasoundAvailableAtTheHealthFacility 1..1 boolean "Ultrasound available at the health facility" "Whether an ultrasound machine is available and functional in the facility and a trained health worker is available to use it"
  * ^code[+] = HIVConcepts#HIV.Config.DE11
* hivBurdenOfTheSetting 1..1 Coding "HIV burden of the setting" "HIV burden of the setting (high or low) based on the national HIV prevalence or where the HIV prevalence and/or incidence in a geographical setting is higher than national prevalence and, therefore, needs priority in the HIV response"
  * ^code[+] = HIVConcepts#HIV.Config.DE12
* hivBurdenOfTheSetting from HIV.Config.DE12 (required)
* hpvDnaTestingOperationalAtTheHealthFacility 1..1 boolean "HPV DNA testing operational at the health facility" "Is HPV DNA testing operational at the health facility for cervical cancer screening?"
  * ^code[+] = HIVConcepts#HIV.Config.DE15
* routineViralLoadTestingIsAvailable 1..1 boolean "Routine viral load testing is available" "Routine viral load testing is available in the facility"
  * ^code[+] = HIVConcepts#HIV.Config.DE16
* healthFacilityId 1..1 Identifier "Reporting health facility ID" "MFR Location identifier of the site that recorded the encounter."
  * ^code[+] = HIVConcepts#HIV.Config.DE17
* healthFacilityId.system 1..1
* healthFacilityId.system = "https://fhir-mfr.moh.gov.et/fhir/identifier/mfr-id" (exactly)
* healthFacilityId.value 1..1
* tbTreatingFacilityId 0..1 Identifier "TB treating facility ID" "MFR Location identifier of the site where the client is currently being treated for tuberculosis."
  * ^code[+] = HIVConcepts#HIV.Config.DE18
* tbTreatingFacilityId.system 1..1
* tbTreatingFacilityId.system = "https://fhir-mfr.moh.gov.et/fhir/identifier/mfr-id" (exactly)
* tbTreatingFacilityId.value 1..1
* otherPriorityPopulations 0..* Coding "Priority populations" "Other populations of priority of HIV prevention and care in local context (provided during adaptation)"
  * ^code[+] = HIVConcepts#HIV.Config.DE19
* otherPriorityPopulations from HIV.Config.DE19 (required)
* populationsWithSpecialNeeds 0..* Coding "Populations with special needs" "Programme-selected groups within the priority population category"
  * ^code[+] = HIVConcepts#HIV.Config.ET.DE19
* populationsWithSpecialNeeds from HIV.Config.ET.DE19 (required)
* reportingPeriodEndDate 0..1 date "Reporting period end date" "End date of the reporting period"
  * ^code[+] = HIVConcepts#HIV.Config.DE20
* reportingPeriodStartDate 0..1 date "Reporting period start date" "Start date of the reporting period"
  * ^code[+] = HIVConcepts#HIV.Config.DE21
* reportingDate 0..1 date "Reporting date" "Reporting date, for surveys performed on a specific date"
  * ^code[+] = HIVConcepts#HIV.Config.DE22

Mapping: HIVConfigurationClinicalSource
Source: HIVConfiguration
Id: clinical-source
Title: "Configuration sources"
Target: "http://smart.who.int/hiv"
Description: "Facility identity and approved programme settings."
* healthFacilityId -> "HIVConfigurationForm/HIV.Config.DE17. Resolve the selected ET Base MFR Location and use Location.identifier:mfrId."
* tbTreatingFacilityId -> "HIV.D8/HIV.Config.DE18 from the documented active TB treatment episode. Resolve the selected ET Base MFR Location and use Location.identifier:mfrId."
* hivBurdenOfTheSetting -> "Use the documented programme classification for the site. Supply the verified code as the HIVConfig HivBurdenSetting parameter."
