Instance: HIVReferral-PlanDefinition
InstanceOf: PlanDefinition
Usage: #definition
* name = "HIVReferral"
* title = "Referral"
* type = http://terminology.hl7.org/CodeSystem/plan-definition-type#workflow-definition
* version = "2026-10"
* status = #draft
* experimental = true
* description = "Record whether a referral is urgent and prepare the handoff to the receiving facility."
* action[+].id = "HIV.I.1"
* action[=].title = "Emergency referral"
* action[=].definitionCanonical = Canonical(HIV.I1EmergencyReferral)
* action[+].id = "HIV.I.6"
* action[=].title = "Provide information to referral facility"
* action[=].definitionCanonical = Canonical(HIV.I6ProvideInformationToReferralFacility)
