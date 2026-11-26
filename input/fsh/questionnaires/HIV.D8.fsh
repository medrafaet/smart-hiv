Instance: HIV.D8CaptureOrUpdateClientHistory
InstanceOf: sdc-questionnaire-extr-smap
Title: "Capture or update client history"
Description: "Questionnaire for capture or update client history"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#patient
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Patient
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Patient record supplying date of birth for age at enrolment."
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext][1].extension[name].valueCoding.code = #careArtHistory
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext][1].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext][1].extension[description].valueString = "Supply visitDate (date), artFacility (repeated references to verified MFR Organizations that offer ART), currentArtFacility (one eligible MFR Organization reference), and artStartType (Coding) when known. Supply priorArvLocation references and approved priorArvRegimen codings for the corresponding fields. For regimen history, supply firstLineArtRegimen choices, currentArtRegimenStartDate, one latestPrescribedArtRegimen Coding, and any verified regimen decision outputs. For staging, supply documented hivStatus as one HIV.B.DE115 choice. For adherence, supply prescribedArtDoses as one integer covering the same period since the last visit as the missed-dose count. For ART timing, supply hivDiagnosisDate from HIV.B.DE71, the documented date the diagnosis was returned to the client. Supply lateArtInitiation as one boolean from the baseline CD4 measure in Diagnostics (HIV.D.DE369) when known. For the regimen start date, supply visitPrescribedArtRegimen and visitArtPrescriptionDate from the same documented prescription at this visit. Supply empty Parameters when context is unavailable."
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "eligibleArtFacilities"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'artFacility').value.ofType(Reference).where(reference.exists())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "art-first-start-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "For first-time ART, record the same date for ART start and first initiation."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.D.DE43').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE44')).exists() and %resource.item.where(linkId = 'HIV.D.DE39').answer.value.exists()) implies %resource.item.where(linkId = 'HIV.D.DE46').answer.value.where($this.toString() = %resource.item.where(linkId = 'HIV.D.DE39').answer.value.toString()).exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "art-cohort-month"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Record the ART cohort as a year and month."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE49').answer.value.all($this.toString().matches('^[0-9]{4}-[0-9]{2}$'))"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "prior-arv-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Record the prior ARV start date as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE62').answer.value.all($this <= today().toString().substring(0, $this.toString().length()).toDate())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "care-chronic-exclusive"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "Select No chronic or past health conditions or Unknown on its own."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE65').answer.value.ofType(Coding).count() <= 1 or %resource.item.where(linkId = 'HIV.D.DE65').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE66' | 'HIV.D.DE67')).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[key].valueId = "care-art-regimen-reconciliation"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[severity].valueCode = #warning
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[human].valueString = "Review the current ART regimen. It differs from the latest prescription on record."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE75').answer.value.ofType(Coding).where(system in %resource.item.where(linkId = 'latestPrescribedArtRegimen').answer.value.ofType(Coding).system).all(code in %resource.item.where(linkId = 'latestPrescribedArtRegimen').answer.value.ofType(Coding).code)"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[key].valueId = "care-hiv-stage-required"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[human].valueString = "Record the assessed WHO clinical stage for a client with confirmed HIV who is off ART or within six months of starting ART."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[expression].valueExpression.expression = """
  (%resource.item.where(linkId = 'HIV.B.DE115').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.B.DE116').exists() and
    (%resource.item.where(linkId = 'HIV.D.DE38').answer.value.where($this = false).exists() or
      (%resource.item.where(linkId = 'HIV.D.DE38').answer.value.where($this = true).exists() and
        %resource.item.where(linkId = 'careVisitDate').answer.value.ofType(date).where(toString().length() = 10).exists($this >= %resource.item.where(linkId = 'HIV.D.DE39').answer.value.ofType(date).where(toString().length() = 10) and $this <= (%resource.item.where(linkId = 'HIV.D.DE39').answer.value.ofType(date).where(toString().length() = 10) + 6 months)))))
  implies %resource.item.where(linkId = 'HIV.D.DE186').answer.value.ofType(Coding).exists()
  """

* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[key].valueId = "care-art-delay-reason"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[human].valueString = "Record the reason for starting ART after seven days when the baseline CD4 measure is also positive."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.D.DE369').answer.value.where($this = true).exists() and %resource.item.where(linkId = 'HIV.D.DE383').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.D.ET.DE79').exists()) implies %resource.item.where(linkId = 'HIV.D.DE370').answer.value.ofType(Coding).exists()"

* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[key].valueId = "care-current-medications-exclusive"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[human].valueString = "Select No medications or Don’t know on its own."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE537').answer.value.ofType(Coding).count() <= 1 or %resource.item.where(linkId = 'HIV.D.DE537').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE538' | 'HIV.D.DE539')).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[key].valueId = "care-allergies-exclusive"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[human].valueString = "Select No known allergies or Don’t know on its own."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE560').answer.value.ofType(Coding).count() <= 1 or %resource.item.where(linkId = 'HIV.D.DE560').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE561' | 'HIV.D.DE562')).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[key].valueId = "care-gravida-required"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[human].valueString = "Record a positive number of pregnancies if currently pregnant."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE31').answer.value.where($this = true).exists() implies %resource.item.where(linkId = 'HIV.D.DE33').answer.value.ofType(integer).where($this > 0).exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[key].valueId = "tb-diagnosis-date"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[human].valueString = "Record the TB diagnosis date as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE952').answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[key].valueId = "tpt-start-required"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[human].valueString = "Record the start date when the client is currently taking TB preventive treatment."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE953').answer.value.where($this = true).exists() implies %resource.item.where(linkId = 'HIV.D.DE954').answer.value.ofType(date).exists()"

* item[+]
  * id = "HIV.D.DE31"
  * linkId = "HIV.D.DE31"
  * type = #boolean
  * text = "Currently pregnant"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE32"
  * linkId = "HIV.D.DE32"
  * type = #boolean
  * text = "Breastfeeding"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE33"
  * linkId = "HIV.D.DE33"
  * type = #integer
  * text = "Number of pregnancies (gravida)"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.D.DE34"
  * linkId = "HIV.D.DE34"
  * type = #integer
  * text = "Number of miscarriages and/or abortions before 28 weeks"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.D.DE35"
  * linkId = "HIV.D.DE35"
  * type = #integer
  * text = "Number of live births"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.D.DE36"
  * linkId = "HIV.D.DE36"
  * type = #integer
  * text = "Parity"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.D.DE37"
  * linkId = "HIV.D.DE37"
  * type = #boolean
  * text = "Serodiscordant couple"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE38"
  * linkId = "HIV.D.DE38"
  * type = #boolean
  * text = "On ART"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE39"
  * linkId = "HIV.D.DE39"
  * type = #date
  * text = "ART start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE40"
  * linkId = "HIV.D.DE40"
  * type = #boolean
  * text = "Stopped ART"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE41"
  * linkId = "HIV.D.DE41"
  * type = #date
  * text = "Date ART stopped"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE40"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE42"
  * linkId = "HIV.D.DE42"
  * type = #boolean
  * text = "Established on ART"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE38"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE43"
  * linkId = "HIV.D.DE43"
  * type = #choice
  * text = "ART start type"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE43)
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%careArtHistory.parameter.where(name = 'artStartType').value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE44' | 'HIV.D.DE45' | 'HIV.D.ET.DE103'))"
* item[+]
  * id = "HIV.D.DE46"
  * linkId = "HIV.D.DE46"
  * type = #date
  * text = "Date of initiation on ART"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE47"
  * linkId = "HIV.D.DE47"
  * type = #integer
  * text = "Time on current ART (completed months)"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#mo "months"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "artStart"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE39').answer.value.toString()"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "artVisitDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%careArtHistory.parameter.where(name = 'visitDate').value.ofType(date).toString()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.D.DE38').answer.value.where($this = true).exists() and %artStart.length() = 10 and %artVisitDate.length() = 10 and %artStart.toDate() <= %artVisitDate.toDate(), (%artVisitDate.substring(0,4).toInteger() - %artStart.substring(0,4).toInteger()) * 12 + %artVisitDate.substring(5,2).toInteger() - %artStart.substring(5,2).toInteger() - iif(%artVisitDate.substring(8,2).toInteger() < %artStart.substring(8,2).toInteger(), 1, 0), {})"
* item[+]
  * id = "HIV.D.DE48"
  * linkId = "HIV.D.DE48"
  * type = #date
  * text = "Date(s) ART restarted"
  * required = false
  * repeats = true
  * readOnly = false
* item[+]
  * id = "HIV.D.DE49"
  * linkId = "HIV.D.DE49"
  * type = #date
  * text = "ART cohort (year and month)"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE50"
  * linkId = "HIV.D.DE50"
  * type = #boolean
  * text = "Transfer in for HIV care"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE51"
  * linkId = "HIV.D.DE51"
  * type = #date
  * text = "Date of transfer in"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE50"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE52"
  * linkId = "HIV.D.DE52"
  * type = #reference
  * text = "Facility transferred from"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE50"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Organization
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = "http://fhir.et/core/StructureDefinition/ethiopian-mfr-organization"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%eligibleArtFacilities"
* item[+]
  * id = "HIV.D.DE53"
  * linkId = "HIV.D.DE53"
  * type = #date
  * text = "Date enrolled in HIV care"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE54"
  * linkId = "HIV.D.DE54"
  * type = #integer
  * text = "Age at enrolment (years)"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "birthDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%patient.birthDate.toString()"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "enrolmentDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE53').answer.value.toString()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%birthDate.length() = 10 and %enrolmentDate.length() = 10 and %birthDate.toDate() <= %enrolmentDate.toDate(), (%enrolmentDate.replace('-', '').toInteger() - %birthDate.replace('-', '').toInteger()) div 10000, {})"
* item[+]
  * id = "HIV.D.DE55"
  * linkId = "HIV.D.DE55"
  * type = #reference
  * text = "Facility where client first started ART"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Organization
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = "http://fhir.et/core/StructureDefinition/ethiopian-mfr-organization"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%eligibleArtFacilities"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "eligibleCurrentArtFacility"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'currentArtFacility').value.ofType(Reference).where(reference.exists() and reference in %eligibleArtFacilities.reference)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%careArtHistory.parameter.where(name = 'artStartType').value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.D.DE44').exists() and %eligibleCurrentArtFacility.count() = 1, %eligibleCurrentArtFacility, {})"
* item[+]
  * id = "HIV.D.DE56"
  * linkId = "HIV.D.DE56"
  * type = #choice
  * text = "Antiretroviral (ARV) drugs received prior to enrolment"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE56)
* item[+]
  * id = "HIV.D.DE62"
  * linkId = "HIV.D.DE62"
  * type = #date
  * text = "Date ARV drugs received prior to enrolment"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE56').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE58' | 'HIV.D.DE59' | 'HIV.D.DE60' | 'HIV.D.DE61')).exists()"
* item[+]
  * id = "HIV.D.DE63"
  * linkId = "HIV.D.DE63"
  * type = #reference
  * text = "Location ARV drugs received prior to enrolment"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE56').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE58' | 'HIV.D.DE59' | 'HIV.D.DE60' | 'HIV.D.DE61')).exists()"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource].valueCode = #Organization
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceResource][1].valueCode = #Location
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile].valueCanonical = "http://fhir.et/core/StructureDefinition/ethiopian-mfr-organization"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-referenceProfile][1].valueCanonical = "http://hl7.org/fhir/StructureDefinition/Location"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careArtHistory.parameter.where(name = 'priorArvLocation').value.ofType(Reference).where(reference.exists())"
* item[+]
  * id = "HIV.D.DE64"
  * linkId = "HIV.D.DE64"
  * type = #choice
  * text = "ARV drug regimen received prior to enrolment"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE56').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE58' | 'HIV.D.DE59' | 'HIV.D.DE60' | 'HIV.D.DE61')).exists() and %resource.item.where(linkId = 'HIV.D.DE62').answer.value.exists()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careArtHistory.parameter.where(name = 'priorArvRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * id = "HIV.D.DE65"
  * linkId = "HIV.D.DE65"
  * type = #choice
  * text = "Existing chronic health conditions"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE65)
* item[+]
  * id = "HIV.D.DE73"
  * linkId = "HIV.D.DE73"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE65"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE72
* item[+]
  * id = "HIV.D.DE74"
  * linkId = "HIV.D.DE74"
  * type = #choice
  * text = "Original first-line ART regimen"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%careArtHistory.parameter.where(name = 'firstLineArtRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
* item[+]
  * linkId = "latestPrescribedArtRegimen"
  * type = #choice
  * text = "Latest prescribed ART regimen"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "prescriptionRegimen"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'latestPrescribedArtRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%prescriptionRegimen.count() = 1, %prescriptionRegimen, {})"
* item[+]
  * id = "HIV.D.DE75"
  * linkId = "HIV.D.DE75"
  * type = #choice
  * text = "Current ART regimen"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE75)
  * enableWhen.question = "HIV.D.DE38"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE76"
  * linkId = "HIV.D.DE76"
  * type = #date
  * text = "Current ART regimen start date"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE38"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%careArtHistory.parameter.where(name = 'currentArtRegimenStartDate').value.ofType(date)"
* item[+]
  * id = "HIV.D.DE77"
  * linkId = "HIV.D.DE77"
  * type = #choice
  * text = "Preferred first-line ART regimen"
  * required = false
  * repeats = true
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "approvedRegimens"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'preferredFirstLineArtRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%approvedRegimens.exists()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%approvedRegimens"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%approvedRegimens"
* item[+]
  * id = "HIV.D.DE78"
  * linkId = "HIV.D.DE78"
  * type = #choice
  * text = "Alternative first-line ART regimen"
  * required = false
  * repeats = true
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "approvedRegimens"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'alternativeFirstLineArtRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%approvedRegimens.exists()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%approvedRegimens"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%approvedRegimens"
* item[+]
  * id = "HIV.D.DE79"
  * linkId = "HIV.D.DE79"
  * type = #choice
  * text = "First-line ART regimen under special circumstances"
  * required = false
  * repeats = true
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "approvedRegimens"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'firstLineArtRegimenUnderSpecialCircumstances').value.ofType(Coding).where(system.exists() and code.exists())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%approvedRegimens.exists()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%approvedRegimens"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%approvedRegimens"
* item[+]
  * id = "HIV.D.DE80"
  * linkId = "HIV.D.DE80"
  * type = #choice
  * text = "Preferred second-line ART regimen"
  * required = false
  * repeats = true
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "approvedRegimens"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'preferredSecondLineArtRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%approvedRegimens.exists()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%approvedRegimens"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%approvedRegimens"
* item[+]
  * id = "HIV.D.DE81"
  * linkId = "HIV.D.DE81"
  * type = #choice
  * text = "Alternative second-line ART regimen"
  * required = false
  * repeats = true
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "approvedRegimens"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'alternativeSecondLineArtRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%approvedRegimens.exists()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%approvedRegimens"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%approvedRegimens"
* item[+]
  * id = "HIV.D.DE82"
  * linkId = "HIV.D.DE82"
  * type = #choice
  * text = "Optimal regimen for transition"
  * required = false
  * repeats = true
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "approvedRegimens"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'optimalRegimenForTransition').value.ofType(Coding).where(system.exists() and code.exists())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%approvedRegimens.exists()"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-answerExpression].valueExpression.expression = "%approvedRegimens"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "%approvedRegimens"
* item[+]
  * id = "HIV.D.DE83"
  * linkId = "HIV.D.DE83"
  * type = #choice
  * text = "Current ART regimen (first-, second-, or third-line)"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE83)
  * enableWhen.question = "HIV.D.DE38"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE90"
  * linkId = "HIV.D.DE90"
  * type = #choice
  * text = "Recorded ART regimen"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE90-capture)
* item[+]
  * id = "HIV.D.DE127"
  * linkId = "HIV.D.DE127"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE90"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE126
* item[+]
  * id = "HIV.D.DE128"
  * linkId = "HIV.D.DE128"
  * type = #choice
  * text = "ART regimen composition"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE128)
  * enableWhen.question = "HIV.D.DE38"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE146"
  * linkId = "HIV.D.DE146"
  * type = #choice
  * text = "ART regimen drug class"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE146)
  * enableWhen.question = "HIV.D.DE38"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "HIV.B.DE115"
  * type = #choice
  * text = "Documented HIV status"
  * readOnly = true
  * answerValueSet = Canonical(HIV.B.DE115)
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "documentedStatus"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'hivStatus').value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.B.DE116' | 'HIV.B.DE117' | 'HIV.B.DE118'))"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%documentedStatus.count() = 1, %documentedStatus, {})"
* item[+]
  * linkId = "careVisitDate"
  * type = #date
  * text = "Care visit date"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "visitDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'visitDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%visitDates.count() = 1, %visitDates, {})"
* item[+]
  * id = "HIV.D.DE186"
  * linkId = "HIV.D.DE186"
  * type = #choice
  * text = "HIV clinical stage"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE186)
* item[+]
  * id = "HIV.D.DE191"
  * linkId = "HIV.D.DE191"
  * type = #integer
  * text = "Number of missed doses"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * linkId = "artAdherencePercentage"
  * type = #decimal
  * text = "Adherence (%)"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#"%" "%"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "missedDoses"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE191').answer.value.ofType(integer)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "prescribedDoses"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%careArtHistory.parameter.where(name = 'prescribedArtDoses').value.ofType(integer)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%prescribedDoses.count() = 1 and %missedDoses.count() = 1, iif(%prescribedDoses > 0 and %missedDoses >= 0 and %missedDoses <= %prescribedDoses, (100 * (%prescribedDoses - %missedDoses) / %prescribedDoses).round(2), {}), {})"
* item[+]
  * linkId = "HIV.D.DE369"
  * type = #boolean
  * text = "Late ART initiation (baseline CD4 measure)"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-hidden].valueBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "lateArtFlags"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'lateArtInitiation').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%lateArtFlags.count() = 1, %lateArtFlags, {})"
* item[+]
  * id = "HIV.D.DE383"
  * linkId = "HIV.D.DE383"
  * type = #choice
  * text = "Time to start ART"
  * required = false
  * repeats = false
  * readOnly = true
  * answerOption[+].valueCoding = HIVConcepts#HIV.D.DE384 "Within 7 days of HIV diagnosis"
  * answerOption[+].valueCoding = HIVConcepts#HIV.D.ET.DE79 "After 7 days of HIV diagnosis"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "diagnosisDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'hivDiagnosisDate').value.ofType(date).select(toString())"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "firstArtDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = """
    iif(%resource.item.where(linkId = 'HIV.D.DE46').answer.value.exists(),
      %resource.item.where(linkId = 'HIV.D.DE46').answer.value.ofType(date).select(toString()),
      iif(%resource.item.where(linkId = 'HIV.D.DE43').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code = 'HIV.D.DE44').exists(),
        %resource.item.where(linkId = 'HIV.D.DE39').answer.value.ofType(date).select(toString()), {}))
    """
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = """
    iif(%diagnosisDate.count() = 1 and %firstArtDate.count() = 1,
      iif(%diagnosisDate.length() = 10 and %firstArtDate.length() = 10 and %firstArtDate.toDate() >= %diagnosisDate.toDate(),
        %questionnaire.item.where(linkId = 'HIV.D.DE383').answerOption.value.ofType(Coding).where(code =
          iif(%firstArtDate.toDate() <= (%diagnosisDate.toDate() + 7 days), 'HIV.D.DE384', 'HIV.D.ET.DE79')), {}), {})
    """
* item[+]
  * id = "HIV.D.DE382"
  * linkId = "HIV.D.DE382"
  * type = #boolean
  * text = "ART initiated within 7 days of diagnosis"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "timeToArtCode"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE383').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.D.DE384' | 'HIV.D.ET.DE79')).code"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%timeToArtCode.count() = 1, %timeToArtCode = 'HIV.D.DE384', {})"
* item[+]
  * id = "HIV.D.DE370"
  * linkId = "HIV.D.DE370"
  * type = #choice
  * text = "Reasons for delayed ART initiation"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE370)
  * enableWhen.question = "HIV.D.DE383"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.ET.DE79
* item[+]
  * id = "HIV.D.DE381"
  * linkId = "HIV.D.DE381"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE370"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE380
* item[+]
  * id = "HIV.D.DE456"
  * linkId = "HIV.D.DE456"
  * type = #date
  * text = "Regimen start date"
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "visitRegimen"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%careArtHistory.parameter.where(name = 'visitPrescribedArtRegimen').value.ofType(Coding).where(system.exists() and code.exists())"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "recordedRegimen"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%resource.item.where(linkId = 'HIV.D.DE75').answer.value.ofType(Coding).where(system.exists() and code.exists())"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.name = "visitPrescriptionDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.expression = "%careArtHistory.parameter.where(name = 'visitArtPrescriptionDate').value.ofType(date).select(toString())"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = """
    iif(%visitRegimen.count() = 1 and %recordedRegimen.count() = 1 and
      %visitRegimen.system = %recordedRegimen.system and %visitRegimen.code != %recordedRegimen.code and %visitPrescriptionDates.count() = 1,
      %visitPrescriptionDates.toDate(),
      %resource.item.where(linkId = 'HIV.D.DE76').answer.value.ofType(date).single())
    """
* item[+]
  * id = "HIV.D.DE537"
  * linkId = "HIV.D.DE537"
  * type = #choice
  * text = "Current medications"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE537)
* item[+]
  * id = "HIV.D.DE559"
  * linkId = "HIV.D.DE559"
  * type = #string
  * text = "Other medications (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE537"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE558
* item[+]
  * id = "HIV.D.DE560"
  * linkId = "HIV.D.DE560"
  * type = #choice
  * text = "Allergies"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE560)
* item[+]
  * id = "HIV.D.DE568"
  * linkId = "HIV.D.DE568"
  * type = #string
  * text = "Other allergies (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE560"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE567
* item[+]
  * id = "HIV.D.DE569"
  * linkId = "HIV.D.DE569"
  * type = #choice
  * text = "Family planning method used"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE569)
* item[+]
  * id = "HIV.D.DE593"
  * linkId = "HIV.D.DE593"
  * type = #choice
  * text = "Medication status"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE593)
* item[+]
  * id = "HIV.D.DE653"
  * linkId = "HIV.D.DE653"
  * type = #boolean
  * text = "AIDS-related death"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE654"
  * linkId = "HIV.D.DE654"
  * type = #date
  * text = "Date of first AIDS diagnosis"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE655"
  * linkId = "HIV.D.DE655"
  * type = #integer
  * text = "Age at final HPV vaccination dose received"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#a "years"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.D.DE938"
  * linkId = "HIV.D.DE938"
  * type = #boolean
  * text = "TB disease"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * linkId = "HIV.D.ET.DE938"
  * type = #boolean
  * text = "Documented mono drug-resistant TB"
* item[+]
  * linkId = "HIV.D.ET.DE939"
  * type = #boolean
  * text = "Documented extensively drug-resistant TB (XDR-TB)"
* item[+]
  * id = "HIV.D.DE939"
  * linkId = "HIV.D.DE939"
  * type = #choice
  * text = "TB diagnosis result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE939)
* item[+]
  * id = "HIV.D.DE942"
  * linkId = "HIV.D.DE942"
  * type = #choice
  * text = "Method of TB diagnosis"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE942)
  * enableWhen.question = "HIV.D.DE939"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE940
* item[+]
  * id = "HIV.D.DE945"
  * linkId = "HIV.D.DE945"
  * type = #boolean
  * text = "Presumptive TB"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE946"
  * linkId = "HIV.D.DE946"
  * type = #date
  * text = "Presumptive TB registration date"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE945"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE947"
  * linkId = "HIV.D.DE947"
  * type = #choice
  * text = "TB treatment history"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE947-capture)
* item[+]
  * linkId = "HIV.D.ET.DE9"
  * type = #string
  * text = "Other TB treatment history (specify)"
  * required = true
  * enableWhen.question = "HIV.D.DE947"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVTBWorkbookConcepts#HIV.D.ET.DE6
* item[+]
  * id = "HIV.D.DE952"
  * linkId = "HIV.D.DE952"
  * type = #date
  * text = "Date of TB diagnosis"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE939"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE940
* item[+]
  * id = "HIV.D.DE953"
  * linkId = "HIV.D.DE953"
  * type = #boolean
  * text = "Currently on TB preventive treatment (TPT)"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE954"
  * linkId = "HIV.D.DE954"
  * type = #date
  * text = "TB preventive treatment (TPT) start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE955"
  * linkId = "HIV.D.DE955"
  * type = #date
  * text = "TB preventive treatment (TPT) completion date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE1000"
  * linkId = "HIV.D.DE1000"
  * type = #boolean
  * text = "TB treatment started"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE1001"
  * linkId = "HIV.D.DE1001"
  * type = #date
  * text = "TB treatment start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE1002"
  * linkId = "HIV.D.DE1002"
  * type = #choice
  * text = "TB treatment outcome"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE1002)
* item[+]
  * id = "HIV.D.DE1009"
  * linkId = "HIV.D.DE1009"
  * type = #date
  * text = "TB treatment completion date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE1010"
  * linkId = "HIV.D.DE1010"
  * type = #choice
  * text = "TB treatment regimen composition"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE1010-capture)
