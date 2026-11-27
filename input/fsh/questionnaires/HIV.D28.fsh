RuleSet: CareSupportServices
* item[+]
  * id = "HIV.D.DE413"
  * linkId = "HIV.D.DE413"
  * type = #date
  * text = "Date of scheduled monitoring examination"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE519"
  * linkId = "HIV.D.DE519"
  * type = #choice
  * text = "Other support services"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE519)

RuleSet: CareCervicalScreeningAndServices
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[key].valueId = "care-cervical-recorded-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[human].valueString = "Record a completed event date and time at or before the current time."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.D.DE656' | 'HIV.D.DE680' | 'HIV.D.DE705' | 'HIV.D.DE718' | 'HIV.D.DE728' | 'HIV.D.DE729' | 'HIV.D.DE744')).answer.value.ofType(dateTime).where($this > now()).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "care-cervical-triage-type"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Record the triage test type when a triage test date is entered."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE680').answer.value.exists() implies %resource.item.where(linkId = 'HIV.D.DE681').answer.value.ofType(Coding).exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "care-cervical-diagnosis-stage"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Record the documented stage for a dated diagnosis of invasive cervical cancer."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.D.DE705').answer.value.exists() and %resource.item.where(linkId = 'HIV.D.DE709').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.D.DE711').exists()) implies %resource.item.where(linkId = 'HIV.D.DE712').answer.value.ofType(Coding).exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "care-cervical-treatment-start"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "Record the episode number and treatment method when the invasive treatment start date is entered."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE729').answer.value.exists() implies (%resource.item.where(linkId = 'HIV.D.DE730').answer.value.ofType(integer).where($this >= 1).exists() and %resource.item.where(linkId = 'HIV.D.DE731').answer.value.ofType(Coding).exists())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[key].valueId = "care-cervical-interval-unit"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[human].valueString = "Record a positive screening interval in years, months, weeks, or days."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.expression = "%resource.repeat(item).where(linkId = 'HIV.D.DE745').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code in ('a' | 'mo' | 'wk' | 'd') and value.exists() and value > 0 and comparator.empty())"

* item[+]
  * id = "HIV.D.DE656"
  * linkId = "HIV.D.DE656"
  * type = #dateTime
  * text = "Date of cervical cancer screening test"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE657"
  * linkId = "HIV.D.DE657"
  * type = #integer
  * text = "Lifetime screening test number"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 1
* item[+]
  * id = "HIV.D.DE658"
  * linkId = "HIV.D.DE658"
  * type = #choice
  * text = "Cervical cancer primary screening test type"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE658)
* item[+]
  * id = "HIV.D.DE663"
  * linkId = "HIV.D.DE663"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE658"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE662
* item[+]
  * id = "HIV.D.DE664"
  * linkId = "HIV.D.DE664"
  * type = #choice
  * text = "HPV-DNA cervical cancer screening test result"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE664)
  * enableWhen.question = "HIV.D.DE658"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE659
* item[+]
  * id = "HIV.D.DE668"
  * linkId = "HIV.D.DE668"
  * type = #choice
  * text = "VIA cervical cancer screening test result"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE668)
  * enableWhen.question = "HIV.D.DE658"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE660
* item[+]
  * id = "HIV.D.DE673"
  * linkId = "HIV.D.DE673"
  * type = #choice
  * text = "Cervical cytology screening test result"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE673)
  * enableWhen.question = "HIV.D.DE658"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE661
* item[+]
  * id = "HIV.D.DE680"
  * linkId = "HIV.D.DE680"
  * type = #dateTime
  * text = "Cervical cancer triage test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE681"
  * linkId = "HIV.D.DE681"
  * type = #choice
  * text = "Cervical cancer triage test type"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE681)
* item[+]
  * id = "HIV.D.DE687"
  * linkId = "HIV.D.DE687"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE681"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE686
* item[+]
  * id = "HIV.D.DE688"
  * linkId = "HIV.D.DE688"
  * type = #choice
  * text = "HPV16/18 test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE688)
  * enableWhen.question = "HIV.D.DE681"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE685
* item[+]
  * id = "HIV.D.DE691"
  * linkId = "HIV.D.DE691"
  * type = #choice
  * text = "Cervical cancer colposcopy result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE691)
  * enableWhen.question = "HIV.D.DE681"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE683
* item[+]
  * id = "HIV.D.DE697"
  * linkId = "HIV.D.DE697"
  * type = #choice
  * text = "Cervical cancer histopathology result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE697)
* item[+]
  * id = "HIV.D.DE702"
  * linkId = "HIV.D.DE702"
  * type = #string
  * text = "Date of additional cervical cancer triage test"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE703"
  * linkId = "HIV.D.DE703"
  * type = #string
  * text = "Additional cervical cancer triage test type (specify)"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE704"
  * linkId = "HIV.D.DE704"
  * type = #string
  * text = "Additional cervical cancer triage test result (specify)"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE705"
  * linkId = "HIV.D.DE705"
  * type = #dateTime
  * text = "Date of diagnosis of cervical precancer lesions or invasive cervical cancer"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE706"
  * linkId = "HIV.D.DE706"
  * type = #choice
  * text = "Cervical cancer screening outcome"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE706)
* item[+]
  * id = "HIV.D.DE709"
  * linkId = "HIV.D.DE709"
  * type = #choice
  * text = "Cervical cancer diagnosis"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE709)
* item[+]
  * id = "HIV.D.DE712"
  * linkId = "HIV.D.DE712"
  * type = #choice
  * text = "Cervical cancer stage at diagnosis"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE712)
* item[+]
  * id = "HIV.D.DE718"
  * linkId = "HIV.D.DE718"
  * type = #dateTime
  * text = "Date of treatment for cervical precancer lesions"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE719"
  * linkId = "HIV.D.DE719"
  * type = #choice
  * text = "Treatment method for cervical precancer lesions"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE719)
* item[+]
  * id = "HIV.D.DE727"
  * linkId = "HIV.D.DE727"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE719"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE726
* item[+]
  * id = "HIV.D.DE728"
  * linkId = "HIV.D.DE728"
  * type = #dateTime
  * text = "Date of follow-up for treatment for cervical precancer lesions"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE729"
  * linkId = "HIV.D.DE729"
  * type = #dateTime
  * text = "Date of start of invasive cancer treatment"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE730"
  * linkId = "HIV.D.DE730"
  * type = #integer
  * text = "Invasive cervical cancer treatment episode"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 1
* item[+]
  * id = "HIV.D.DE731"
  * linkId = "HIV.D.DE731"
  * type = #choice
  * text = "Invasive cervical cancer treatment method"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE731)
* item[+]
  * id = "HIV.D.DE740"
  * linkId = "HIV.D.DE740"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE731"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE739
* item[+]
  * id = "HIV.D.DE741"
  * linkId = "HIV.D.DE741"
  * type = #string
  * text = "Treatment outcome"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE742"
  * linkId = "HIV.D.DE742"
  * type = #string
  * text = "Secondary/other cancers diagnosed"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE743"
  * linkId = "HIV.D.DE743"
  * type = #string
  * text = "Cancers at other sites (HPV- and non-HPV related)"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE744"
  * linkId = "HIV.D.DE744"
  * code = HIVConcepts#HIV.SURV.23
  * type = #dateTime
  * text = "Date of death"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * linkId = "cervicalScreeningPlan"
  * type = #group
  * text = "Cervical screening plan"
  * item[+]
    * linkId = "HIV.D.DE745"
    * type = #quantity
    * text = "Documented screening interval"
    * required = true
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#a "a"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption][1].valueCoding = http://unitsofmeasure.org#mo "mo"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption][2].valueCoding = http://unitsofmeasure.org#wk "wk"
    * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption][3].valueCoding = http://unitsofmeasure.org#d "d"
* item[+]
  * id = "HIV.D.DE753"
  * linkId = "HIV.D.DE753"
  * type = #choice
  * text = "Offer other clinical services"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE753)
* item[+]
  * linkId = "HIV.D.ET.DE749"
  * type = #string
  * text = "Other clinical services offered (specify)"
  * required = true
  * enableWhen.question = "HIV.D.DE753"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.ET.DE748

Instance: HIV.D28OfferOtherServices
InstanceOf: sdc-questionnaire-extr-smap
Title: "Offer other services"
Description: "Questionnaire for offer other services"
Usage: #definition
* insert QuestionnaireVersionAlgorithm
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* status = #draft
* experimental = true

* insert CareSupportServices
* insert CareCervicalScreeningAndServices

Instance: HIV.D28CareSupportServices
InstanceOf: sdc-questionnaire-extr-smap
Title: "Offer support services"
Description: "Records cervical cancer screening, diagnosis, treatment and clinical or support services offered or referred during care."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true

* insert CareSupportServices
* insert CareCervicalScreeningAndServices
