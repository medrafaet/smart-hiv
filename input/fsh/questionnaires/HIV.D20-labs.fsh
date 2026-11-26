RuleSet: DiagnosticsLaboratoryFields
* item[+]
  * id = "HIV.G.DE1"
  * linkId = "HIV.G.DE1"
  * type = #integer
  * text = "CD4 count"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"{cells}/mm3" "cells/mm³"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.G.DE2"
  * linkId = "HIV.G.DE2"
  * type = #decimal
  * text = "CD4 cell percentage"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"%" "%"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
  * extension[http://hl7.org/fhir/StructureDefinition/maxValue].valueDecimal = 100
* item[+]
  * id = "HIV.G.DE3"
  * linkId = "HIV.G.DE3"
  * type = #decimal
  * text = "Baseline CD4 count"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"{cells}/mm3" "cells/mm³"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0
* item[+]
  * id = "HIV.G.DE4"
  * linkId = "HIV.G.DE4"
  * type = #date
  * text = "Date of baseline CD4 count sample collection"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.G.DE5"
  * linkId = "HIV.G.DE5"
  * type = #boolean
  * text = "Baseline CD4 below 200 cells/mm³"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "baselineCd4Result"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.G.DE3').answer.value.ofType(decimal).where($this >= 0)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%baselineCd4Result.count() = 1, %baselineCd4Result < 200, {})"
* item[+]
  * id = "HIV.G.DE6"
  * linkId = "HIV.G.DE6"
  * type = #date
  * text = "Date of CD4 sample collection"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.G.DE7"
  * linkId = "HIV.G.DE7"
  * type = #boolean
  * text = "Viral load test conducted"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.G.DE8"
  * linkId = "HIV.G.DE8"
  * type = #dateTime
  * text = "Date of viral load sample collection"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.G.DE9"
  * linkId = "HIV.G.DE9"
  * type = #dateTime
  * text = "Date of first viral load sample collection"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.G.DE10"
  * linkId = "HIV.G.DE10"
  * type = #date
  * text = "Date viral load sample sent"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.G.DE11"
  * linkId = "HIV.G.DE11"
  * type = #integer
  * text = "First viral load test result"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"{copies}/mL" "copies/mL"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.G.DE12"
  * linkId = "HIV.G.DE12"
  * type = #integer
  * text = "Viral load test result"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"{copies}/mL" "copies/mL"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.G.DE13"
  * linkId = "HIV.G.DE13"
  * type = #choice
  * text = "HIV viral load specimen type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE13-capture)
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.G.DE7"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerBoolean = true
  * enableWhen[+].question = "HIV.G.DE8"
  * enableWhen[=].operator = #exists
  * enableWhen[=].answerBoolean = true
  * enableWhen[+].question = "HIV.G.DE12"
  * enableWhen[=].operator = #exists
  * enableWhen[=].answerBoolean = true
* item[+]
  * linkId = "hbsagTestPerformed"
  * type = #boolean
  * text = "HBsAg test performed"
* item[+]
  * id = "HIV.G.DE17"
  * linkId = "HIV.G.DE17"
  * type = #date
  * text = "HBsAg test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.G.DE18"
  * linkId = "HIV.G.DE18"
  * type = #choice
  * text = "HBsAg test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE18)
* item[+]
  * id = "HIV.G.DE22"
  * linkId = "HIV.G.DE22"
  * type = #choice
  * text = "Reason Hepatitis B test not conducted"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE22)
  * enableWhen.question = "hbsagTestPerformed"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = false
* item[+]
  * id = "HIV.G.DE28"
  * linkId = "HIV.G.DE28"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.G.DE22"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.G.DE27
* item[+]
  * id = "HIV.G.DE29"
  * linkId = "HIV.G.DE29"
  * type = #choice
  * text = "Hepatitis B diagnosis"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE29)
* item[+]
  * linkId = "HIV.G.ET.DE1"
  * type = #boolean
  * text = "HBV viral load test conducted"
* item[+]
  * linkId = "HIV.G.ET.DE2"
  * type = #quantity
  * text = "HBV viral load result"
  * enableWhen.question = "HIV.G.ET.DE1"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption][0].valueCoding = http://unitsofmeasure.org#"[IU]/mL" "IU/mL"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption][+].valueCoding = http://unitsofmeasure.org#"{copies}/mL" "copies/mL"
* item[+]
  * linkId = "recordHcvTesting"
  * type = #boolean
  * text = "Record hepatitis C testing for this visit?"
* item[+]
  * id = "HIV.G.DE32"
  * linkId = "HIV.G.DE32"
  * type = #dateTime
  * text = "Hepatitis C screening date"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordHcvTesting"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.G.DE33"
  * linkId = "HIV.G.DE33"
  * type = #boolean
  * text = "Hepatitis C test ordered"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordHcvTesting"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.G.DE34"
  * linkId = "HIV.G.DE34"
  * type = #boolean
  * text = "Hepatitis C test conducted"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordHcvTesting"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.G.DE35"
  * linkId = "HIV.G.DE35"
  * type = #choice
  * text = "Reason Hepatitis C test not done"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE35)
  * enableWhen.question = "HIV.G.DE34"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = false
* item[+]
  * id = "HIV.G.DE41"
  * linkId = "HIV.G.DE41"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.G.DE35"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.G.DE40
* item[+]
  * id = "HIV.G.DE42"
  * linkId = "HIV.G.DE42"
  * type = #date
  * text = "HCV test date"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.G.DE34"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.G.DE43"
  * linkId = "HIV.G.DE43"
  * type = #choice
  * text = "HCV test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE43)
  * enableWhen.question = "HIV.G.DE34"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.G.DE47"
  * linkId = "HIV.G.DE47"
  * type = #date
  * text = "HCV viral load test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.G.DE48"
  * linkId = "HIV.G.DE48"
  * type = #choice
  * text = "HCV viral load result (qualitative)"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE48)
* item[+]
  * linkId = "HIV.G.ET.DE3"
  * type = #quantity
  * text = "HCV viral load result (quantitative)"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#"[IU]/mL" "IU/mL"
* item[+]
  * id = "HIV.G.DE51"
  * linkId = "HIV.G.DE51"
  * type = #choice
  * text = "Hepatitis C diagnosis"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE51)
* item[+]
  * linkId = "recordSyphilisTesting"
  * type = #boolean
  * text = "Record syphilis testing for this visit?"
* item[+]
  * id = "HIV.G.DE54"
  * linkId = "HIV.G.DE54"
  * type = #boolean
  * text = "Syphilis test required"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordSyphilisTesting"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "syphilisTestPerformed"
  * type = #boolean
  * text = "Syphilis test performed"
  * enableWhen.question = "recordSyphilisTesting"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.G.DE55"
  * linkId = "HIV.G.DE55"
  * type = #choice
  * text = "Syphilis test type"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE55)
  * enableWhen.question = "syphilisTestPerformed"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.G.DE61"
  * linkId = "HIV.G.DE61"
  * type = #string
  * text = "Other syphilis test type (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.G.DE55"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.G.DE60
* item[+]
  * id = "HIV.G.DE62"
  * linkId = "HIV.G.DE62"
  * type = #choice
  * text = "Reason syphilis test not done"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE62)
  * enableWhen.question = "syphilisTestPerformed"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = false
* item[+]
  * id = "HIV.G.DE68"
  * linkId = "HIV.G.DE68"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.G.DE62"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.G.DE67
* item[+]
  * id = "HIV.G.DE69"
  * linkId = "HIV.G.DE69"
  * type = #date
  * text = "Syphilis test date"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "syphilisTestPerformed"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.G.DE70"
  * linkId = "HIV.G.DE70"
  * type = #choice
  * text = "Syphilis test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE70)
  * enableWhen.question = "syphilisTestPerformed"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.G.DE74"
  * linkId = "HIV.G.DE74"
  * type = #choice
  * text = "Syphilis diagnosis"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.G.DE74)
* item[+]
  * id = "HIV.G.DE77"
  * linkId = "HIV.G.DE77"
  * type = #boolean
  * text = "Other tests conducted"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * linkId = "otherLaboratoryTest"
  * type = #group
  * text = "Other test"
  * required = true
  * repeats = true
  * enableWhen.question = "HIV.G.DE77"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * item[+]
    * id = "HIV.G.DE78"
    * linkId = "HIV.G.DE78"
    * type = #string
    * text = "Other test(s) name"
    * required = true
    * repeats = false
    * readOnly = false
  * item[+]
    * id = "HIV.G.DE79"
    * linkId = "HIV.G.DE79"
    * type = #date
    * text = "Other test(s) date"
    * required = false
    * repeats = false
    * readOnly = false
  * item[+]
    * id = "HIV.G.DE80"
    * linkId = "HIV.G.DE80"
    * type = #string
    * text = "Other test(s) result(s)"
    * required = false
    * repeats = false
    * readOnly = false

RuleSet: DiagnosticsLaboratoryConstraints
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "diagnostic-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Record laboratory dates as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = """
  %resource.repeat(item).where(linkId in ('HIV.G.DE4' | 'HIV.G.DE6' | 'HIV.G.DE10' | 'HIV.G.DE17' | 'HIV.G.DE42' | 'HIV.G.DE47' | 'HIV.G.DE69' | 'HIV.G.DE79')).answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "diagnostic-timestamps"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Record laboratory timestamps as the current time or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId in ('HIV.G.DE8' | 'HIV.G.DE9' | 'HIV.G.DE32')).answer.value.ofType(dateTime).where($this > now()).empty()
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "diagnostic-cd4-sample"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Record the sample collection date when a current CD4 count or percentage is recorded."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = """
  (%resource.item.where(linkId = 'HIV.G.DE1').answer.value.ofType(integer).exists() or %resource.item.where(linkId = 'HIV.G.DE2').answer.value.ofType(decimal).exists()) implies %resource.item.where(linkId = 'HIV.G.DE6').answer.value.ofType(date).exists()
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "diagnostic-viral-load-chronology"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "The dispatch date must be on or after collection. The first collection must be on or before the current collection."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = """
  (%resource.item.where(linkId = 'HIV.G.DE10').answer.value.ofType(date) >= %resource.item.where(linkId = 'HIV.G.DE8').answer.value.ofType(dateTime).select(toString().substring(0,10).toDate())).where($this = false).empty() and
  (%resource.item.where(linkId = 'HIV.G.DE9').answer.value.ofType(dateTime) <= %resource.item.where(linkId = 'HIV.G.DE8').answer.value.ofType(dateTime)).where($this = false).empty()
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[key].valueId = "diagnostic-viral-load-performed"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[human].valueString = "A test recorded as not conducted cannot have a numeric result for this test."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.G.DE7').answer.value.ofType(boolean).where($this = false).exists() implies %resource.item.where(linkId = 'HIV.G.DE12').answer.value.ofType(integer).empty()
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[key].valueId = "diagnostic-not-performed"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[human].valueString = "Record a reason for an ordered hepatitis C test or required syphilis test that was not performed. Keep test results separate from tests recorded as not performed."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[expression].valueExpression.expression = """
  ((%resource.item.where(linkId = 'HIV.G.DE33').answer.value.ofType(boolean).where($this = true).exists() and %resource.item.where(linkId = 'HIV.G.DE34').answer.value.ofType(boolean).where($this = false).exists()) implies %resource.item.where(linkId = 'HIV.G.DE35').answer.value.ofType(Coding).exists()) and
  ((%resource.item.where(linkId = 'HIV.G.DE54').answer.value.ofType(boolean).where($this = true).exists() and %resource.item.where(linkId = 'syphilisTestPerformed').answer.value.ofType(boolean).where($this = false).exists()) implies %resource.item.where(linkId = 'HIV.G.DE62').answer.value.ofType(Coding).exists()) and
  (%resource.item.where(linkId = 'hbsagTestPerformed').answer.value.ofType(boolean).where($this = false).exists() implies (%resource.item.where(linkId = 'HIV.G.DE17').answer.value.ofType(date).empty() and %resource.item.where(linkId = 'HIV.G.DE18').answer.value.ofType(Coding).empty())) and
  (%resource.item.where(linkId = 'HIV.G.DE34').answer.value.ofType(boolean).where($this = false).exists() implies (%resource.item.where(linkId = 'HIV.G.DE42').answer.value.ofType(date).empty() and %resource.item.where(linkId = 'HIV.G.DE43').answer.value.ofType(Coding).empty())) and
  (%resource.item.where(linkId = 'syphilisTestPerformed').answer.value.ofType(boolean).where($this = false).exists() implies (%resource.item.where(linkId = 'HIV.G.DE69').answer.value.ofType(date).empty() and %resource.item.where(linkId = 'HIV.G.DE70').answer.value.ofType(Coding).empty()))
"""
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[key].valueId = "diagnostic-hepatitis-viral-load-units"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[human].valueString = "Use the documented units for quantitative hepatitis viral load and a nonnegative number. HBV values use whole numbers."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[expression].valueExpression.expression = """
  %resource.item.where(linkId = 'HIV.G.ET.DE2').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code in ('[IU]/mL' | '{copies}/mL') and value >= 0 and value mod 1 = 0) and %resource.item.where(linkId = 'HIV.G.ET.DE3').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = '[IU]/mL' and value >= 0)
"""

Instance: HIV.D20RecordLaboratoryResults
InstanceOf: sdc-questionnaire-extr-smap
Title: "Record laboratory tests and results"
Description: "Records laboratory tests, specimen collection, reported results and documented diagnoses for the Ethiopia Diagnostics worksheet."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* insert DiagnosticsLaboratoryConstraints
* insert DiagnosticsLaboratoryFields
