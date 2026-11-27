Instance: HIVB2DT
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-recommendationdefinition|2.0.0
Title: "HIV.B2.DT Check for signs of serious illness"
Description: "Check for signs of serious illness"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareableplandefinition"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishableplandefinition"
* library = Canonical(HIVB2DTLogic)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
  * valueCode = #computable
* url = "https://hiv.fhir.et/PlanDefinition/HIVB2DT"
* name = "HIVB2DT"
* status = #draft
* experimental = true
* publisher = "World Health Organization (WHO)"
* relatedArtifact[+]
  * type = #citation
  * citation = "Consolidated Guidelines on HIV Testing Services (2019)"
  * url = "https://www.who.int/publications/i/978-92-4-155058-1"
* action[+]
  * textEquivalent = "Check for signs of serious illness"
  * action[+]
    * textEquivalent = "Take appropriate action for client showing signs of serious illness"
    * condition[+]
      * kind = #applicability
      * expression
        * language = #text/cql-identifier
        * expression = "Guidance"
    * definitionCanonical = Canonical(HIVGuidanceCommunicationRequestActivity)
    * dynamicValue[+]
      * path = "description"
      * expression
        * language = #text/cql-identifier
        * expression = "Guidance"
