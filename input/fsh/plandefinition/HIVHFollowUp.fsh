Instance: HIVFollowUp-PlanDefinition
InstanceOf: PlanDefinition
Usage: #definition
* name = "HIVFollowUp"
* title = "Follow-up and contacting clients"
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#workflow-definition
* version = "2026-10"
* status = #draft
* experimental = true
* description = "Identify clients for HIV follow-up, record attempts to contact them and document outreach outcomes."
* action[+].id = "HIV.H.1"
* action[=].title = "Identify client for follow-up"
* action[=].definitionCanonical = Canonical(HIV.H1IdentifyClientForFollowUp)
* action[+].id = "HIV.H.2"
* action[=].title = "Attempt to locate client"
* action[=].definitionCanonical = Canonical(HIV.H2AttemptToLocateClient)
* action[+].id = "HIV.H.3"
* action[=].title = "Record outreach and result"
* action[=].definitionCanonical = Canonical(HIV.H3RecordOutreachAndResult)
