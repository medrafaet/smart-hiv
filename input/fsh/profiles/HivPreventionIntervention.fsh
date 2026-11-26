Profile: HivPreventionIntervention
Parent: Observation
Description: "A documented HIV prevention service accessed at the facility. Use one observation per service and record the access date in effective[x]."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "HIV Prevention Intervention"
* code = HIVConcepts#HIV.PRV.DE2
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* valueCodeableConcept from http://smart.who.int/hiv/ValueSet/HIV.PRV.DE2 (required)
* effective[x] 1..1 MS
