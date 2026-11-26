Instance: HIVSurveillanceSourceCodes
InstanceOf: ConceptMap
Usage: #definition
* name = "HIVSurveillanceSourceCodes"
* title = "Clinical answers to Ethiopia HIV Surveillance codes"
* status = #draft
* experimental = true
* version = "2026-10"
* description = "Translates documented clinical answers to the Ethiopia surveillance options. Preserve invalid or unknown results in the source record when no surveillance code applies."
* group.source = "http://smart.who.int/hiv/CodeSystem/HIVConcepts"
* group.target = "http://smart.who.int/hiv/CodeSystem/HIVConcepts"
* group.element[+].code = #HIV.B.DE113
* group.element[=].target.code = #HIV.SURV.ET.1
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.B.DE112
* group.element[=].target.code = #HIV.SURV.ET.2
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.B.DE114
* group.element[=].target.code = #HIV.SURV.ET.3
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.D.DE187
* group.element[=].target.code = #HIV.SURV.ET.4
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.D.DE188
* group.element[=].target.code = #HIV.SURV.ET.5
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.D.DE189
* group.element[=].target.code = #HIV.SURV.ET.6
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.D.DE190
* group.element[=].target.code = #HIV.SURV.ET.7
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.B.DE96
* group.element[=].target.code = #HIV.SURV.ET.8
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.B.DE95
* group.element[=].target.code = #HIV.SURV.ET.9
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.B.DE97
* group.element[=].target.equivalence = #unmatched
* group.element[=].target.comment = "Retain the source answer. The surveillance worksheet has no equivalent choice."
* group.element[+].code = #HIV.E.DE202
* group.element[=].target.code = #HIV.SURV.ET.8
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.E.DE201
* group.element[=].target.code = #HIV.SURV.ET.9
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.E.DE203
* group.element[=].target.equivalence = #unmatched
* group.element[=].target.comment = "Retain the source answer. The surveillance worksheet has no equivalent choice."
* group.element[+].code = #HIV.E.DE232
* group.element[=].target.code = #HIV.SURV.ET.10
* group.element[=].target.equivalence = #wider
* group.element[=].target.comment = "The source also documents breastfeeding cessation. The surveillance option represents only the confirmed negative result."
* group.element[+].code = #HIV.E.DE231
* group.element[=].target.code = #HIV.SURV.ET.12
* group.element[=].target.equivalence = #equivalent
* group.element[+].code = #HIV.E.DE233
* group.element[=].target.equivalence = #unmatched
* group.element[=].target.comment = "Retain the source answer. The surveillance worksheet has no equivalent choice."
