Instance: HIV.B23OfferSexualAndReproductiveHealthServices
InstanceOf: sdc-questionnaire-extr-smap
Title: "Offer sexual and reproductive health services"
Description: "Questionnaire for offer sexual and reproductive health services"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "hts-sti-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Enter today or an earlier date for tests and treatment already performed."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.B.DE236' | 'HIV.B.DE254' | 'HIV.B.DE260' | 'HIV.B.DE316' | 'HIV.B.DE329')).answer.value.all($this <= now())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "hts-sti-tests-and-specimens"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Select the STI and specimen type when a test date is recorded."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.B.DE236').answer.value.exists() implies (%resource.item.where(linkId = 'HIV.B.DE237').answer.value.exists() and %resource.item.where(linkId = 'HIV.B.DE261').answer.value.exists())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "hts-sti-syphilis-result"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Enter the syphilis result when completing a dated syphilis test. For a single inconclusive syphilis test, record the result in STI test result."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = "(%resource.status in ('completed' | 'amended') and %resource.item.where(linkId = 'HIV.B.DE249').answer.value.exists()) implies (%resource.item.where(linkId = 'HIV.B.DE250').answer.value.exists() or (%resource.item.where(linkId = 'HIV.B.DE237').answer.value.ofType(Coding).count() = 1 and %resource.item.where(linkId = 'HIV.B.DE312').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.B.DE315')).exists()))"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "hts-sti-gonorrhoea-result"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "Enter the gonorrhoea result when completing a dated gonorrhoea test."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = "(%resource.status in ('completed' | 'amended') and %resource.item.where(linkId = 'HIV.B.DE255').answer.value.exists()) implies %resource.item.where(linkId = 'HIV.B.DE256').answer.value.exists()"

* item[+]
  * id = "HIV.B.DE226"
  * linkId = "HIV.B.DE226"
  * type = #choice
  * text = "Syndrome/STI diagnosed"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE226)
* item[+]
  * id = "HIV.B.DE234"
  * linkId = "HIV.B.DE234"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE226"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE233
* item[+]
  * id = "HIV.B.DE235"
  * linkId = "HIV.B.DE235"
  * type = #boolean
  * text = "Any STI syndrome diagnosed"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.B.DE226').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.B.DE227' | 'HIV.B.DE228' | 'HIV.B.DE229' | 'HIV.B.DE230' | 'HIV.B.DE231')).exists()"
* item[+]
  * id = "HIV.B.DE236"
  * linkId = "HIV.B.DE236"
  * type = #dateTime
  * text = "Date of STI test"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE237"
  * linkId = "HIV.B.DE237"
  * type = #choice
  * text = "STI tested for"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE237)
* item[+]
  * id = "HIV.B.DE248"
  * linkId = "HIV.B.DE248"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE247
* item[+]
  * id = "HIV.B.DE249"
  * linkId = "HIV.B.DE249"
  * type = #dateTime
  * text = "Syphilis test date"
  * required = false
  * repeats = false
  * readOnly = true
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE241
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.B.DE237').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.B.DE241')).exists(), %resource.item.where(linkId = 'HIV.B.DE236').answer.value.ofType(dateTime), {})"
* item[+]
  * id = "HIV.B.DE250"
  * linkId = "HIV.B.DE250"
  * type = #choice
  * text = "Syphilis test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE250)
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE241
* item[+]
  * id = "HIV.B.DE254"
  * linkId = "HIV.B.DE254"
  * type = #dateTime
  * text = "Syphilis treatment start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE255"
  * linkId = "HIV.B.DE255"
  * type = #dateTime
  * text = "Gonorrhoea test date"
  * required = false
  * repeats = false
  * readOnly = true
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE238
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.B.DE237').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.B.DE238')).exists(), %resource.item.where(linkId = 'HIV.B.DE236').answer.value.ofType(dateTime), {})"
* item[+]
  * id = "HIV.B.DE256"
  * linkId = "HIV.B.DE256"
  * type = #choice
  * text = "Gonorrhoea test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE256)
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE238
* item[+]
  * id = "HIV.B.DE260"
  * linkId = "HIV.B.DE260"
  * type = #dateTime
  * text = "Gonorrhoea treatment start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE261"
  * linkId = "HIV.B.DE261"
  * type = #choice
  * text = "Type of specimen"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE261)
* item[+]
  * id = "HIV.B.DE268"
  * linkId = "HIV.B.DE268"
  * type = #string
  * text = "Other type of specimen (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE261"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE267
* item[+]
  * id = "HIV.B.DE269"
  * linkId = "HIV.B.DE269"
  * type = #choice
  * text = "Syphilis test type"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE269)
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE241
* item[+]
  * id = "HIV.B.DE275"
  * linkId = "HIV.B.DE275"
  * type = #string
  * text = "Other syphilis test type (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE269"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE274
* item[+]
  * id = "HIV.B.DE276"
  * linkId = "HIV.B.DE276"
  * type = #choice
  * text = "Neisseria gonorrhoeae test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE276)
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE238
* item[+]
  * id = "HIV.B.DE282"
  * linkId = "HIV.B.DE282"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE276"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE281
* item[+]
  * id = "HIV.B.DE283"
  * linkId = "HIV.B.DE283"
  * type = #string
  * text = "POC Test for Neisseria gonorrhoeae (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE276"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE278
* item[+]
  * id = "HIV.B.DE284"
  * linkId = "HIV.B.DE284"
  * type = #choice
  * text = "Chlamydia trachomatis test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE284)
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE239
* item[+]
  * id = "HIV.B.DE291"
  * linkId = "HIV.B.DE291"
  * type = #string
  * text = "Other test for Chlamydia (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE284"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE290
* item[+]
  * id = "HIV.B.DE292"
  * linkId = "HIV.B.DE292"
  * type = #string
  * text = "POC Test type for Chlamydia test (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE284"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE286
* item[+]
  * id = "HIV.B.DE293"
  * linkId = "HIV.B.DE293"
  * type = #choice
  * text = "Trichomonas vaginalis test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE293)
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE240
* item[+]
  * id = "HIV.B.DE299"
  * linkId = "HIV.B.DE299"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE293"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE298
* item[+]
  * id = "HIV.B.DE300"
  * linkId = "HIV.B.DE300"
  * type = #string
  * text = "POC Test type for Trichomonas vaginalis test (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE293"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE295
* item[+]
  * id = "HIV.B.DE301"
  * linkId = "HIV.B.DE301"
  * type = #choice
  * text = "Herpes simplex virus (HSV) test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE301)
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE242
* item[+]
  * id = "HIV.B.DE305"
  * linkId = "HIV.B.DE305"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE301"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE304
* item[+]
  * id = "HIV.B.DE306"
  * linkId = "HIV.B.DE306"
  * type = #choice
  * text = "Mycoplasma genitalium test type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE306)
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE243
* item[+]
  * id = "HIV.B.DE310"
  * linkId = "HIV.B.DE310"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE306"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE309
* item[+]
  * id = "HIV.B.DE311"
  * linkId = "HIV.B.DE311"
  * type = #string
  * text = "Test type for other STI tested for (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE237"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE247
* item[+]
  * id = "HIV.B.DE312"
  * linkId = "HIV.B.DE312"
  * type = #choice
  * text = "STI test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE312)
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.B.DE237').answer.value.ofType(Coding).count() = 1"
* item[+]
  * id = "HIV.B.DE316"
  * linkId = "HIV.B.DE316"
  * type = #dateTime
  * text = "Date of STI confirmatory test"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE317"
  * linkId = "HIV.B.DE317"
  * type = #choice
  * text = "Confirmatory syphilis test type"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE317)
* item[+]
  * id = "HIV.B.DE323"
  * linkId = "HIV.B.DE323"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE317"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE322
* item[+]
  * id = "HIV.B.DE324"
  * linkId = "HIV.B.DE324"
  * type = #string
  * text = "Confirmatory test type for other STI (specify)"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE325"
  * linkId = "HIV.B.DE325"
  * type = #choice
  * text = "Confirmatory STI test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE325)
* item[+]
  * id = "HIV.B.DE329"
  * linkId = "HIV.B.DE329"
  * type = #dateTime
  * text = "Date STI treatment prescribed"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE330"
  * linkId = "HIV.B.DE330"
  * type = #dateTime
  * text = "Date STI treatment dispensed"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE331"
  * linkId = "HIV.B.DE331"
  * type = #string
  * text = "STI treatment dispensed (specify)"
  * required = false
  * repeats = false
  * readOnly = false
