Profile: HivKeyPopulation
Parent: Observation
Description: "An observation for a patient's key or priority population type. Each selected type is represented as a separate observation."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^title = "Patient Key Population Status"
* value[x] only CodeableConcept
* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* valueCodeableConcept from HIV.B.DE50-exchange (required)
* code = HIVConcepts#HIV.B.DE50
