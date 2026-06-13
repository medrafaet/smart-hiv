This Ethiopian Ministry of Health HIV Implementation Guide details how to use Health Level 7 (HL7) Fast Healthcare Interoperability Resources (FHIR) for consistent digital representation of HIV services in Ethiopia.

<div>
<p> This implementation guide and set of artifacts are still undergoing development. </p>
<p> Content is undergoing Ministry review and should be validated against current Ethiopian HIV programme policy before production implementation. </p>
</div>{:.stu-note}


### Summary 
This implementation guide includes a machine-readable representation of HIV guidance adapted for Ethiopia by the Ministry of Health. It builds on WHO SMART Guidelines, the WHO HIV Digital Adaptation Kit, and Ethiopia HIV programme requirements, and explicitly encodes computer-interoperable logic, including data models, terminologies, and logic expressions, in a computable language to support implementation of HIV use cases in Ethiopia.

The guide follows the [WHO SMART Guidelines approach](https://www.who.int/teams/digital-health-and-innovation/smart-guidelines) and localizes it for Ethiopian Ministry of Health implementation. It defines a series of FHIR Resources, Profiles, Extensions, and Terminology based on the Ethiopia HIV Digital Adaptation Kit and the WHO HIV Digital Adaptation Kit.

Supporting guidance, recommendations, resources, and standards are included in the <a href="references.html">References</a> and <a href="dependencies.html">Dependencies</a>.

### About this implementation guide

This implementation guide is broken into the following levels of [knowledge representation](https://hl7.org/fhir/uv/cpg/documentation-approach-06-01-levels-of-knowledge-representation.html):
- <a href="index.html">Home</a> - contains references to the guidance, guidelines, policies and recommendations underpinning this implementation guide.
- <a href="business-requirements.html">Business Requirements</a> - contains the requirements for this implementation guide including the definition of key concepts, use cases, and a data dictionary.      
- <a href="data-models-and-exchange.html">Data Models and Exchange</a> - contains the data models and data exchange protocols with actors and transactions defined.
- <a href="deployment.html">Deployment Guidance </a> - contains relevant technical specifications and guidance, testing resources, reference implementation materials, and supporting guidance for adaptation to local contexts.

This guide is prepared to facilitate digital implementation of Ethiopian HIV programme guidance by providing FHIR-based computable representations of, and implementation guidance for, the key components of the Ethiopia HIV Digital Adaptation Kit (DAK):

* Health Interventions & Recommendations
* Generic Personas
* User Scenarios
* Business Processes & Workflows
* Core Data Elements
* Decision Support Logic
* Indicators & Monitoring
* Functional & Non-functional Requirements

This guide is a companion to the Ethiopia Digital Adaptation Kit (DAK) and should be used side-by-side with it. Implementers are strongly encouraged to use Ministry-approved programme guidance together with this Implementation Guide. The focus of this guide is on the explanation and use of the computable artifacts.

This guide assumes use of the following resources: 
* [IPS Patient](http://hl7.org/fhir/uv/ips/StructureDefinition/Patient-uv-ips)
* [CPG ActivityDefinitions](https://hl7.org/fhir/uv/cpg/artifacts.html#activitydefinition-index)

- For a complete listing of the artifacts defined in this implementation guide, refer to the [Artifact Index](artifacts.html).
- A complete offline copy of this implementation guide can be found on the [Downloads](downloads.html) page.

- This Implementation Guide makes use of [Clinical Quality Language](https://cql.hl7.org/) for the decision support artifacts including the PlanDefinitions and Measures. They are used to express how a calculation should occur and can be used with a CQL engine in order to process the decision or indicator directly from the applicable FHIR resources. Links to this specification, the FHIR Clinical Practice Guidelines Speciciation, and other helpful resources can be found in the Support dropdown.

### Disclaimer
The specification documented here is a draft working specification for Ministry review. It is provided without warranty of completeness or consistency, and the official Ethiopian Ministry of Health publication supersedes this draft. No liability can be inferred from the use or misuse of this specification or its consequences.
