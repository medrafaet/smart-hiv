Alias: $plan-definition-type = http://terminology.hl7.org/CodeSystem/plan-definition-type

Instance: CareAndTreatmentClinicalVisit-PlanDefinition
InstanceOf: PlanDefinition
Usage: #definition
* url = "https://hiv.fhir.et/PlanDefinition/CareAndTreatmentClinicalVisit-PlanDefinition"
* name = "PlanDefinition_Care and treatment clinical visit"
* title = "PlanDefinition - Care and treatment clinical visit"
* type = $plan-definition-type#workflow-definition "Workflow Definition"
* status = #active
* experimental = true
* publisher = "World Health Organization (WHO)"
* description = "To initiate ART and to provide HIV care, treatment and integrated health services"
* action.title = "Care and treatment clinical visit business process"
* action.description = " To initiate ART and to provide HIV care, treatment and integrated health services"
* action.participant[0].type = #patient
* action.participant[=].role.coding.code = #client
* action.participant[+].type = #practitioner
* action.participant[=].role.text = "Trained Lay Provider"
* action.action[0].id = "HIV.D.1"
* action.action[=].title = "Determine reason for visit"
* action.action[=].definitionCanonical = Canonical(HIV.D1DetermineReasonForVisit)
* action.action[=].description = "Search for client details in the system and determine reason for visit"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.2"
* action.action[=].title = "Take vital signs"
* action.action[=].definitionCanonical = Canonical(HIV.D2TakeVitalSigns)
* action.action[=].description = "Also record weight, height, etc. For children, weight will be needed to determine dosage and to check for malnutrition."
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.3"
* action.action[=].title = "Check for signs of serious illness"
* action.action[=].definitionCanonical = Canonical(HIV.D3CheckForSignsOfSeriousIllness)
* action.action[=].description = "Any person who has signs of seriously illness should be referred to the appropriate higher-lever facility for management"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.4"
* action.action[=].title = "Screen for TB"
* action.action[=].definitionCanonical = Canonical(HIV.D4ScreenForTb)
* action.action[=].description = "Adults and adolescents living with HIV should be screened for TB according to a clinical algorithm"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.5"
* action.action[=].title = "Seriously ill?"
* action.action[=].description = "Any person who has signs of serious illness should be referred to the appropriate higher-lever facility for management or receive emergency care, depending on availability and policies."
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.8"
* action.action[=].title = "Capture or update client history"
* action.action[=].definitionCanonical = Canonical(HIV.D8CaptureOrUpdateClientHistory)
* action.action[=].description = "Discuss history with client and review available records. History-taking should include partner’s HIV status and whether the partner is virally suppressed on ART"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.9"
* action.action[=].title = "First time initiating treatment?"
* action.action[=].description = "This step checks whether the client is naïve to ART"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.10"
* action.action[=].title = "Counsel returning clients"
* action.action[=].definitionCanonical = Canonical(HIV.D10CounselReturningClient)
* action.action[=].description = "Adherence, such as whether client is picking up meds and/or has any barriers to adherence to their treatment(s), if so, set plan for adherence support"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.11"
* action.action[=].title = "Retest for HIV using testing algorithm"
* action.action[=].description = "WHO recommends that all programmes retest people diagnosed with HIV prior to initiating lifelong ART"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.12"
* action.action[=].title = "Determine recommended screenings and tests"
* action.action[=].definitionCanonical = Canonical(HIV.D12DetermineRecommendedScreeningsAndTests)
* action.action[=].description = "HIV.D12.DT Determine recommended screenings and tests"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.13"
* action.action[=].title = "Examine client"
* action.action[=].description = "Examine the client clinically, with a physical exam"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.14"
* action.action[=].title = "Prevent, screen and manage comorbidities and coinfections"
* action.action[=].definitionCanonical = Canonical(HIV.D14PreventScreenAndManageComorbiditiesAndCoinfections)
* action.action[=].description = "With ART, HIV is a chronic disease requiring lifetime care. WHO guidelines cover information on common and important concomitant conditions among people living with HIV, including: co-trimoxazole prophylaxis; the diagnosis, prevention and treatment of TB, viral hepatitis, malaria, sexually transmitted infections, cervical cancer prevention, nutrition, vaccinations, mental health and substance use"
* action.action[=].participant.type = #patient
* action.action[=].participant.role.coding.code = #client
* action.action[+].id = "HIV.D.15"
* action.action[=].title = "Determine clinical stage of HIV"
* action.action[=].definitionCanonical = Canonical(HIV.D15DetermineClinicalStageOfHiv)
* action.action[=].description = "HIV.D15.DT Determine WHO clinical stage of HIV"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.16"
* action.action[=].title = "Perform other screenings"
* action.action[=].definitionCanonical = Canonical(HIV.D16PerformOtherScreenings)
* action.action[=].description = "Conduct screenings based on recommendations and priorities and depending on the diagnostics that are available."
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.17"
* action.action[=].title = "Check for signs of treatment failure"
* action.action[=].definitionCanonical = Canonical(HIV.D17CheckForSignsOfTreatmentFailure)
* action.action[=].description = "Review new diagnostic results"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.19"
* action.action[=].title = "Assess for vaccine-preventable diseases"
* action.action[=].definitionCanonical = Canonical(HIV.D19AssessForVaccinePreventableDiseases)
* action.action[=].cardinalityBehavior = #multiple
* action.action[=].participant.type = #practitioner
* action.action[+].id = "HIV.D.20"
* action.action[=].title = "Diagnostics"
* action.action[=].definitionCanonical = Canonical(HIV.D20CareDiagnostics)
* action.action[=].description = "Viral load should be tested routinely for early warning of virological failure and monitored if clinical or virological failure are suspected"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.20.LabResults"
* action.action[=].title = "Record laboratory tests and results"
* action.action[=].definitionCanonical = Canonical(HIV.D20RecordLaboratoryResults)
* action.action[=].description = "Record specimen details, reported results and documented diagnoses for tests in the Diagnostics worksheet."
* action.action[=].participant.type = #practitioner
* action.action[+].id = "HIV.D.21"
* action.action[=].title = "Determine regimen and treatment options"
* action.action[=].definitionCanonical = Canonical(HIV.D21CareRegimenReview)
* action.action[=].description = "For continuing care, check the dosage and need for readjustment or whether treatment failure is suspected."
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.22"
* action.action[=].title = "Make informed decision on treatment"
* action.action[=].description = "Even if client is eligible to start ART, the choice to accept or decline ART ultimately lies with the person or his or her caregiver, and if the decision is to defer initiation, ART can be offered again at subsequent visits"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.23"
* action.action[=].title = "Prescribe"
* action.action[=].definitionCanonical = Canonical(HIV.D23Prescribe)
* action.action[=].description = "The scripting period should cover the period until the next clinical consultation (not until the following ART refill visit)."
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.24"
* action.action[=].title = "Counsel"
* action.action[=].definitionCanonical = Canonical(HIV.D24Counsel)
* action.action[=].description = "Counsel clients on adherence."
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
* action.action[+].id = "HIV.D.25"
* action.action[=].title = "Offer voluntary partner and family services"
* action.action[=].definitionCanonical = Canonical(HIV.D25OfferVoluntaryPartnerAndFamilyServices)
* action.action[=].participant.type = #practitioner
* action.action[+].id = "HIV.D.26"
* action.action[=].title = "Offer sexual and reproductive health services"
* action.action[=].definitionCanonical = Canonical(HIV.D26OfferSexualAndReproductiveHealthServices)
* action.action[=].participant.type = #practitioner
* action.action[+].id = "HIV.D.28"
* action.action[=].title = "Offer support services"
* action.action[=].definitionCanonical = Canonical(HIV.D28CareSupportServices)
* action.action[=].participant.type = #practitioner
* action.action[+].id = "HIV.D.29"
* action.action[=].title = "Schedule follow-up"
* action.action[=].definitionCanonical = Canonical(HIV.D29CareFollowUp)
* action.action[=].participant.type = #practitioner
* action.action[+].id = "HIV.D.30"
* action.action[=].title = "Laboratory diagnostics needed"
* action.action[=].description = "Additional testing or specimen collection may be needed and may happen after the visit"
* action.action[=].participant.type = #practitioner
* action.action[=].participant.role.text = "Trained Lay Provider"
