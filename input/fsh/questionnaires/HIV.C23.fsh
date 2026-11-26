Instance: HIV.C23PrescribeOrAdministerPrepOrPep
InstanceOf: sdc-questionnaire-extr-smap
Title: "Prescribe or administer PrEP or PEP"
Description: "Records the clinician’s prescribed PrEP or PEP regimen, assessment and related dates."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #prepPrescribing
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply currentlyOnPrep as a boolean parameter from the client history. Supply empty Parameters when it is unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "prep-event-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Enter today or an earlier date for a recorded PrEP or PEP event."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.C.DE73' | 'HIV.C.DE86' | 'HIV.C.DE89' | 'HIV.C.DE90')).answer.value.all($this <= today())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "prep-current-regimen"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Record the prescribed regimen when prescribing PrEP for a client currently using PrEP."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.C.DE75').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.C.DE76').exists() and %resource.item.where(linkId = 'HIV.C.DE10').answer.value.where($this = true).exists()) implies %resource.item.where(linkId = 'HIV.C.DE122').answer.value.exists()"

* item[+]
  * id = "HIV.C.DE10"
  * linkId = "HIV.C.DE10"
  * type = #boolean
  * text = "Currently on PrEP"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%prepPrescribing.parameter.where(name = 'currentlyOnPrep').value.ofType(boolean)"
* item[+]
  * id = "HIV.C.DE75"
  * linkId = "HIV.C.DE75"
  * type = #choice
  * text = "Medications prescribed"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE75)
* item[+]
  * id = "HIV.C.DE80"
  * linkId = "HIV.C.DE80"
  * type = #choice
  * text = "PrEP product prescribed"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE80)
  * enableWhen.question = "HIV.C.DE75"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE76
* item[+]
  * id = "HIV.C.DE85"
  * linkId = "HIV.C.DE85"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE80"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE84
* item[+]
  * id = "HIV.C.DE73"
  * linkId = "HIV.C.DE73"
  * type = #date
  * text = "Date PrEP was dispensed and started"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE75"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE76
* item[+]
  * id = "HIV.C.DE86"
  * linkId = "HIV.C.DE86"
  * type = #date
  * text = "PrEP started date"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE75"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE76
* item[+]
  * id = "HIV.C.DE88"
  * linkId = "HIV.C.DE88"
  * type = #integer
  * text = "Number of PrEP tablets or products"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE75"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE76
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.C.DE89"
  * linkId = "HIV.C.DE89"
  * type = #date
  * text = "PEP enrolment date"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE75"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE77
* item[+]
  * id = "HIV.C.DE90"
  * linkId = "HIV.C.DE90"
  * type = #date
  * text = "PEP course completion date"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE75"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE77
* item[+]
  * id = "HIV.C.DE91"
  * linkId = "HIV.C.DE91"
  * type = #choice
  * text = "Recorded PEP regimen type"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE91-regimen-type)
  * enableWhen.question = "HIV.C.DE75"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE77
* item[+]
  * id = "HIV.C.ET.DE92"
  * linkId = "HIV.C.ET.DE92"
  * type = #choice
  * text = "Recorded two-drug PEP combination"
  * required = false
  * repeats = false
  * answerValueSet = Canonical(HIV.C.ET.DE92)
  * enableWhen.question = "HIV.C.DE91"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.ET.DE91
* item[+]
  * id = "HIV.C.ET.DE93"
  * linkId = "HIV.C.ET.DE93"
  * type = #choice
  * text = "Recorded three-drug PEP combination"
  * required = false
  * repeats = false
  * answerValueSet = Canonical(HIV.C.ET.DE93)
  * enableWhen.question = "HIV.C.DE91"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.ET.DE11
* item[+]
  * id = "HIV.C.DE99"
  * linkId = "HIV.C.DE99"
  * type = #choice
  * text = "Preferred third PEP drug"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE99)
  * enableWhen.question = "HIV.C.DE91"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.ET.DE11
* item[+]
  * id = "HIV.C.DE111"
  * linkId = "HIV.C.DE111"
  * type = #dateTime
  * text = "Date of sample collection"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.DE112"
  * linkId = "HIV.C.DE112"
  * type = #choice
  * text = "Contraindications to PrEP usage"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE112)
* item[+]
  * id = "HIV.C.DE119"
  * linkId = "HIV.C.DE119"
  * type = #string
  * text = "Other allergy or contraindication to a medicine in the PrEP regimen (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE112"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE118
* item[+]
  * id = "HIV.C.DE120"
  * linkId = "HIV.C.DE120"
  * type = #boolean
  * text = "Prescribed PrEP at initial visit"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.C.DE75"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE76
* item[+]
  * id = "HIV.C.DE121"
  * linkId = "HIV.C.DE121"
  * type = #integer
  * text = "Number of days prescribed"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.C.DE122"
  * linkId = "HIV.C.DE122"
  * type = #open-choice
  * text = "PrEP regimen prescribed"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE122)
  * enableWhen.question = "HIV.C.DE75"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.C.DE76
* item[+]
  * id = "HIV.C.DE123"
  * linkId = "HIV.C.DE123"
  * type = #boolean
  * text = "Adherence counselling provided"
  * required = false
  * repeats = false
  * readOnly = false
