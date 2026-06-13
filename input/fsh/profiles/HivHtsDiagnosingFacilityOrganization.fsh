Profile: HivHtsDiagnosingFacilityOrganization
Parent: Organization
Title: "HTS Diagnosing Facility Organization"
Description: "Organization representing the facility where the client received HIV testing services or an HIV-positive diagnosis."
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablestructuredefinition"
* ^meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablestructuredefinition"
* ^experimental = true
* ^status = #active
* ^title = "HTS Diagnosing Facility Organization"

* active 0..1 MS
* identifier 0..* MS
* name 1..1 MS
* name ^short = "HTS diagnosing facility name"
