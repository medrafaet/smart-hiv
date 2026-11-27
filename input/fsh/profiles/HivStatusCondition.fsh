Profile: HivStatusCondition
Parent: Condition
Description: "A condition representing a patient's HIV status."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HIV Status Condition"
* clinicalStatus from http://hl7.org/fhir/ValueSet/condition-clinical (required) 
* category = http://terminology.hl7.org/CodeSystem/condition-category#encounter-diagnosis
* code from https://hiv.fhir.et/ValueSet/HIV.B.DE115 (required)
