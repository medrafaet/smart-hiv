This section contains the data models and data exchange protocols with actors and transactions defined. It is part of the L3 machine-readable knowledge representation.

The pages included in this section are described below. 

- [**Actors**](personas.html) - A list and description of software or human entities that interact with the system, derived from business requirements defined in the L2. 
- [**Sequence Diagrams**](sequence-diagrams.html) - Sequence diagrams depicting the interactions between system actors, in order, derived from business processes in the L2.
- [**Transactions**](transactions.html) - A defined list of system transactions at an atomic level for each actor along with narrative, capability statements, structure definition, questionnaires, document bundles and composition. It may also refer to transactions in other implementation guides.
- [**Logical Models**](#) - A StructureDefinition resource that describes data element definitions and their associated rules of usage, derived from the data dictionary in the L2.
- [**Indicators and Measures**](indicators-measures.html) - A thematic list of indicators defined in the implementation guide that link to L1 and L2 guidance documents. 

### Design Documentation -DRAFT-
The documentation below details how to use this IG to execute the decision logic and the resources required to do so including PlanDefinitions, ActivityDefinitions, ValueSets, and Libraries.

#### PlanDefinitions
HIV decision-support content has been represented as FHIR PlanDefinitions conformant to the FHIR Clinical Practice Guidelines Implementation Guide [CPG-ComputablePlanDefinition](http://hl7.org/fhir/uv/cpg/StructureDefinition/cpg-computableplandefinition). The intention behind this design is for Ethiopian implementations to use the PlanDefinitions required for their approved HIV service workflows while retaining standards-based traceability to source guidance.

These PlanDefinitions can be found in the [Artifact Index](artifacts.html)

#### ActivityDefinitions
To represent the activities that need to be carried out, this implementation guide follows the workflow patterns established by the base FHIR specification. Each HIV workflow represented as a PlanDefinition can be processed to produce ActivityDefinitions conforming to the FHIR Clinical Practice Guidelines Implementation Guide [CPG-ActivityProfiles](http://hl7.org/fhir/uv/cpg/profiles.html#activity-profiles).


#### FHIR Library
The FHIR Library contains a base64 encoded CQL library which represents the decision logic as a series of boolean clauses. Each PlanDefinition and Measure will reference a Library from which each decision point can be made and specify which expression from the CQL is used to trigger a decision in PlanDefinition or where to retrieve data to create the MeasureReport in the Measure, repsectively.

#### ValueSets
Many of the ValueSets used in this IG are  from [CPG on FHIR](https://hl7.org/fhir/uv/cpg/) and the [IPS](https://hl7.org/fhir/uv/ips/). There are a number of generated ValueSets based on the user scenarios detailed in this IG.

Terminology bindings in this guide may include international code systems and Ethiopia-specific concepts so that implementers can support both interoperability and Ministry-approved local reporting requirements.
