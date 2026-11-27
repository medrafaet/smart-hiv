Instance: HIV.D12DetermineRecommendedScreeningsAndTests
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine recommended screenings and tests"
Description: "Records services offered or referred and documented hepatitis B and C testing and treatment during Care and Treatment."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #careScreening
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply approved HBV and HCV treatment choices as repeated hbvTreatmentRegimen and hcvTreatmentRegimen Coding parameters. Supply the complete current ART composition from HIV.D.DE128 as repeated artRegimenComposition codings when documented. Supply empty Parameters when context is unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "HIV-D-2"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "The HCV treatment completion date must follow the start date."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.D.DE176').answer.value.ofType(date) > %resource.item.where(linkId = 'HIV.D.DE175').answer.value.ofType(date)).where($this = false).empty()"

* item[+]
  * id = "HIV.D.DE152"
  * linkId = "HIV.D.DE152"
  * type = #choice
  * text = "Prevention services offered and referrals"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE152)
* item[+]
  * id = "HIV.D.DE156"
  * linkId = "HIV.D.DE156"
  * type = #choice
  * text = "Sexual and reproductive health integrated services"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE156)
* item[+]
  * id = "HIV.D.DE161"
  * linkId = "HIV.D.DE161"
  * type = #date
  * text = "HBsAg test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE162"
  * linkId = "HIV.D.DE162"
  * type = #choice
  * text = "HBsAg test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE162)
* item[+]
  * id = "HIV.D.DE166"
  * linkId = "HIV.D.DE166"
  * type = #date
  * text = "Date HBV test result returned to client"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE167"
  * linkId = "HIV.D.DE167"
  * type = #date
  * text = "HBV treatment (TDF) start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE168"
  * linkId = "HIV.D.DE168"
  * type = #choice
  * text = "HBV treatment regimen prescribed"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careScreening.parameter.where(name = 'hbvTreatmentRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * id = "HIV.D.DE169"
  * linkId = "HIV.D.DE169"
  * type = #date
  * text = "HCV test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE170"
  * linkId = "HIV.D.DE170"
  * type = #choice
  * text = "HCV test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE170)
* item[+]
  * id = "HIV.D.DE174"
  * linkId = "HIV.D.DE174"
  * type = #date
  * text = "Date HCV test result returned to client"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE175"
  * linkId = "HIV.D.DE175"
  * type = #date
  * text = "HCV treatment start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE176"
  * linkId = "HIV.D.DE176"
  * type = #date
  * text = "HCV treatment completion date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE177"
  * linkId = "HIV.D.DE177"
  * type = #choice
  * text = "HCV treatment regimen prescribed"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careScreening.parameter.where(name = 'hcvTreatmentRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * id = "HIV.D.DE178"
  * linkId = "HIV.D.DE178"
  * type = #date
  * text = "HCV viral load test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE179"
  * linkId = "HIV.D.DE179"
  * type = #choice
  * text = "HCV viral load test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE179)
* item[+]
  * id = "HIV.D.DE182"
  * linkId = "HIV.D.DE182"
  * type = #choice
  * text = "HCV medicine type"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE182)
* item[+]
  * id = "HIV.D.DE185"
  * linkId = "HIV.D.DE185"
  * type = #boolean
  * text = "Currently on TDF-based ART"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "artComposition"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careScreening.parameter.where(name = 'artRegimenComposition')"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%artComposition.exists() and %artComposition.all(value.ofType(Coding).where(system = 'https://hiv.fhir.et/CodeSystem/HIVConcepts' and code.exists()).exists()), %artComposition.value.ofType(Coding).where(code = 'HIV.D.DE135').exists(), {})"
* item[+]
  * id = "HIV.D.DE229"
  * linkId = "HIV.D.DE229"
  * type = #choice
  * text = "General care activities recommended"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE229)
* item[+]
  * id = "HIV.D.DE247"
  * linkId = "HIV.D.DE247"
  * type = #choice
  * text = "Preventing and treating coinfections"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE247-capture)
