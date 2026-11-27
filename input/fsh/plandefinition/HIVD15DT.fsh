Instance: HIVD15DT
InstanceOf: http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-recommendationdefinition|2.0.0
Title: "HIV.D15.DT Determine WHO clinical staging of HIV disease in adults, adolescents and children"
Description: "Determine WHO clinical staging of HIV disease in adults, adolescents and children"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareableplandefinition"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishableplandefinition"
* library = Canonical(HIVD4DTLogic)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
  * valueCode = #computable
* url = "http://smart.who.int/hiv/PlanDefinition/HIVD15DT"
* name = "HIVD15DT"
* status = #draft
* experimental = true
* publisher = "World Health Organization (WHO)"
* relatedArtifact[+]
  * type = #citation
  * citation = "WHO Consolidated guidelines on the use of antiretroviral drugs for treating and preventing HIV infection, 2nd edition (2016). ANNEX 10 - WHO clinical staging of HIV disease in adults, adolescents and children."
  * url = "https://www.who.int/publications/i/item/9789241549684"
* action[+]
  * textEquivalent = "Outcome of determining WHO clinical staging for HIV"
  * definitionCanonical = Canonical(HIVGuidanceCommunicationRequestActivity)
  * dynamicValue[+]
    * path = "payload[+].contentString"
    * expression
      * language = #text/cql-identifier
      * expression = "Guidance"
