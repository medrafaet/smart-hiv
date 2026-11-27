Instance: HIV.D26OfferSexualAndReproductiveHealthServices
InstanceOf: sdc-questionnaire-extr-smap
Title: "Offer sexual and reproductive health services"
Description: "Records documented STI syndromes, tests, results and treatment during Care and Treatment."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[key].valueId = "care-sti-event-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[human].valueString = "Record completed tests and treatments at or before the current time."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][0].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.D.DE788' | 'HIV.D.DE806' | 'HIV.D.DE812' | 'HIV.D.DE868' | 'HIV.D.DE881')).answer.value.ofType(dateTime).where($this > now()).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "care-sti-test-specimen"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Record the infection tested for and the specimen type when an STI test date is entered."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE788').answer.value.exists() implies (%resource.item.where(linkId = 'HIV.D.DE789').answer.value.ofType(Coding).exists() and %resource.item.where(linkId = 'HIV.D.DE813').answer.value.ofType(Coding).exists())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "care-sti-syphilis-result"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Record the syphilis result when a syphilis test date is entered."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE801').answer.value.exists() implies %resource.item.where(linkId = 'HIV.D.DE802').answer.value.ofType(Coding).exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "care-sti-gonorrhoea-result"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "Record the gonorrhoea result when a gonorrhoea test date is entered."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE807').answer.value.exists() implies %resource.item.where(linkId = 'HIV.D.DE808').answer.value.ofType(Coding).exists()"

* item[+]
  * id = "HIV.D.DE778"
  * linkId = "HIV.D.DE778"
  * type = #choice
  * text = "Syndrome/STI diagnosed"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE778)
* item[+]
  * id = "HIV.D.DE786"
  * linkId = "HIV.D.DE786"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE778"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE785
* item[+]
  * id = "HIV.D.DE787"
  * linkId = "HIV.D.DE787"
  * type = #boolean
  * text = "Any of the five STI syndromes documented"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "recordedSyndromes"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE778').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE779' | 'HIV.D.DE780' | 'HIV.D.DE781' | 'HIV.D.DE782' | 'HIV.D.DE783' | 'HIV.D.DE784' | 'HIV.D.DE785'))"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%recordedSyndromes.exists(), %recordedSyndromes.where(code in ('HIV.D.DE779' | 'HIV.D.DE780' | 'HIV.D.DE781' | 'HIV.D.DE782' | 'HIV.D.DE783')).exists(), {})"
* item[+]
  * id = "HIV.D.DE788"
  * linkId = "HIV.D.DE788"
  * type = #dateTime
  * text = "Date of STI test"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE789"
  * linkId = "HIV.D.DE789"
  * type = #choice
  * text = "STI tested for"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE789)
* item[+]
  * id = "HIV.D.DE800"
  * linkId = "HIV.D.DE800"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE789"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE799
* item[+]
  * id = "HIV.D.DE801"
  * linkId = "HIV.D.DE801"
  * type = #dateTime
  * text = "Syphilis test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE802"
  * linkId = "HIV.D.DE802"
  * type = #choice
  * text = "Syphilis test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE802)
* item[+]
  * id = "HIV.D.DE806"
  * linkId = "HIV.D.DE806"
  * type = #dateTime
  * text = "Syphilis treatment start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE807"
  * linkId = "HIV.D.DE807"
  * type = #dateTime
  * text = "Gonorrhoea test date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE808"
  * linkId = "HIV.D.DE808"
  * type = #choice
  * text = "Gonorrhoea test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE808)
* item[+]
  * id = "HIV.D.DE812"
  * linkId = "HIV.D.DE812"
  * type = #dateTime
  * text = "Gonorrhoea treatment start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE813"
  * linkId = "HIV.D.DE813"
  * type = #choice
  * text = "Type of specimen"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE813)
* item[+]
  * id = "HIV.D.DE820"
  * linkId = "HIV.D.DE820"
  * type = #string
  * text = "Other type of specimen (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE813"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE819
* item[+]
  * id = "HIV.D.DE821"
  * linkId = "HIV.D.DE821"
  * type = #choice
  * text = "Syphilis test type"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE821)
  * enableWhen.question = "HIV.D.DE789"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE793
* item[+]
  * id = "HIV.D.DE827"
  * linkId = "HIV.D.DE827"
  * type = #string
  * text = "Other syphilis test type (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE821"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE826
* item[+]
  * id = "HIV.D.DE828"
  * linkId = "HIV.D.DE828"
  * type = #choice
  * text = "Neisseria gonorrhoeae test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE828)
  * enableWhen.question = "HIV.D.DE789"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE790
* item[+]
  * id = "HIV.D.DE834"
  * linkId = "HIV.D.DE834"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE828"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE833
* item[+]
  * id = "HIV.D.DE835"
  * linkId = "HIV.D.DE835"
  * type = #string
  * text = "POC Test for Neisseria gonorrhoeae (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE828"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE830
* item[+]
  * id = "HIV.D.DE836"
  * linkId = "HIV.D.DE836"
  * type = #choice
  * text = "Chlamydia trachomatis test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE836)
  * enableWhen.question = "HIV.D.DE789"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE791
* item[+]
  * id = "HIV.D.DE843"
  * linkId = "HIV.D.DE843"
  * type = #string
  * text = "Other test for Chlamydia (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE836"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE842
* item[+]
  * id = "HIV.D.DE844"
  * linkId = "HIV.D.DE844"
  * type = #string
  * text = "POC Test type for Chlamydia test (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE836"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE838
* item[+]
  * id = "HIV.D.DE845"
  * linkId = "HIV.D.DE845"
  * type = #choice
  * text = "Trichomonas vaginalis test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE845)
  * enableWhen.question = "HIV.D.DE789"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE792
* item[+]
  * id = "HIV.D.DE851"
  * linkId = "HIV.D.DE851"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE845"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE850
* item[+]
  * id = "HIV.D.DE852"
  * linkId = "HIV.D.DE852"
  * type = #string
  * text = "POC Test type for Trichomonas vaginalis test (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE845"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE847
* item[+]
  * id = "HIV.D.DE853"
  * linkId = "HIV.D.DE853"
  * type = #choice
  * text = "Herpes simplex virus (HSV) test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE853)
  * enableWhen.question = "HIV.D.DE789"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE794
* item[+]
  * id = "HIV.D.DE857"
  * linkId = "HIV.D.DE857"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE853"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE856
* item[+]
  * id = "HIV.D.DE858"
  * linkId = "HIV.D.DE858"
  * type = #choice
  * text = "Mycoplasma genitalium test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE858)
  * enableWhen.question = "HIV.D.DE789"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE795
* item[+]
  * id = "HIV.D.DE862"
  * linkId = "HIV.D.DE862"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE858"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE861
* item[+]
  * id = "HIV.D.DE863"
  * linkId = "HIV.D.DE863"
  * type = #string
  * text = "Test type for other STI tested for (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE789"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE799
* item[+]
  * id = "HIV.D.DE864"
  * linkId = "HIV.D.DE864"
  * type = #choice
  * text = "STI test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE864)
* item[+]
  * id = "HIV.D.DE868"
  * linkId = "HIV.D.DE868"
  * type = #dateTime
  * text = "Date of STI confirmatory test"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE869"
  * linkId = "HIV.D.DE869"
  * type = #choice
  * text = "Confirmatory syphilis test type"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE869)
* item[+]
  * id = "HIV.D.DE875"
  * linkId = "HIV.D.DE875"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE869"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE874
* item[+]
  * id = "HIV.D.DE876"
  * linkId = "HIV.D.DE876"
  * type = #string
  * text = "Confirmatory test type for other STI (specify)"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE877"
  * linkId = "HIV.D.DE877"
  * type = #choice
  * text = "Confirmatory STI test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE877)
* item[+]
  * id = "HIV.D.DE881"
  * linkId = "HIV.D.DE881"
  * type = #dateTime
  * text = "Date STI treatment prescribed"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE882"
  * linkId = "HIV.D.DE882"
  * type = #dateTime
  * text = "Date STI treatment dispensed"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE883"
  * linkId = "HIV.D.DE883"
  * type = #string
  * text = "STI treatment dispensed (specify)"
  * required = false
  * repeats = false
  * readOnly = false
