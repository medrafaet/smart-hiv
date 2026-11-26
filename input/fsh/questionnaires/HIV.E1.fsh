RuleSet: PmtctVerifiedString(parameter)
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "verifiedValues"
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%maternalHistory.parameter.where(name = '{parameter}').value.ofType(string)"
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%verifiedValues.count() = 1, %verifiedValues.where(trim().length() > 0), {})"

Instance: HIV.E1CaptureOrUpdateMotherSHistory
InstanceOf: sdc-questionnaire-extr-smap
Title: "Capture or update mother's history"
Description: "Records the maternal client, antenatal history, pregnancy outcomes and linked infant history."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[name].valueCoding.code = #maternalHistory
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[type].valueCode = #Parameters
* extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext].extension[description].valueString = "Supply the verified maternal identifiers and names when available as one string each: givenName, fatherName, grandfatherName, familyName, artNumber and ancNumber. Supply currentlyPregnant as one boolean for this encounter and recommendedArtRegimen as one boolean only when the current regimen has been checked against the approved national list. For the verified linked infant, supply infantGivenName, infantFatherName, infantGrandfatherName, infantFamilyName and infantMrn as strings when known. Supply caregiverNationalId only for the verified caregiver. Supply infantAgeInYears as one decimal calculated from elapsed days divided by 365, with the exact infantAgeBirthDate and infantAgeContactDate as dates. Supply postpartumWeeks as one integer from whole weeks between postpartumDeliveryDate and postpartumVisitDate when both verified dates are known. Use empty Parameters for unavailable context."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[key].valueId = "pmtct-maternal-name"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[human].valueString = "Use only letters, periods, and hyphens in maternal names."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE1' | 'HIV.E.ET.DE1' | 'HIV.E.ET.DE44' | 'HIV.E.DE2')).answer.value.ofType(string).all($this.matches('^[\\\\p{L}\\\\p{M}.-]+$'))"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[key].valueId = "pmtct-gestational-age-range"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[severity].valueCode = #warning
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[human].valueString = "Verify the gestational age. It falls outside the workbook range of 4 to 40 completed weeks."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][1].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE5').answer.value.ofType(integer).all($this >= 4 and $this <= 40)"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[key].valueId = "pmtct-gravida-range"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[severity].valueCode = #warning
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[human].valueString = "Verify the total pregnancy count. It exceeds the workbook range."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][2].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE11').answer.value.ofType(integer).all($this <= 15)"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[key].valueId = "pmtct-previous-losses"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[human].valueString = "The number of previous pregnancies ending in miscarriage or abortion must be at most the number of previous pregnancies."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][3].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.E.DE13').answer.value.ofType(integer) <= %resource.item.where(linkId = 'HIV.E.DE12').answer.value.ofType(integer)).where($this = false).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[key].valueId = "pmtct-previous-births"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[severity].valueCode = #warning
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[human].valueString = "Review the recorded birth and caesarean counts against the pregnancy history. A multiple birth can produce more than one infant."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][4].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.E.DE14').answer.value.ofType(integer) + %resource.item.where(linkId = 'HIV.E.DE16').answer.value.ofType(integer) <= %resource.item.where(linkId = 'HIV.E.DE12').answer.value.ofType(integer) - %resource.item.where(linkId = 'HIV.E.DE13').answer.value.ofType(integer)).where($this = false).empty() and (%resource.item.where(linkId = 'HIV.E.DE15').answer.value.ofType(integer) <= %resource.item.where(linkId = 'HIV.E.DE14').answer.value.ofType(integer) + %resource.item.where(linkId = 'HIV.E.DE16').answer.value.ofType(integer)).where($this = false).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[key].valueId = "pmtct-complications-exclusive"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[human].valueString = "Select No past pregnancy complications or Does not know on its own."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][5].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE17').answer.value.ofType(Coding).count() <= 1 or %resource.item.where(linkId = 'HIV.E.DE17').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE18' | 'HIV.E.DE19')).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[key].valueId = "pmtct-recorded-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[human].valueString = "Use today or an earlier date for the documented pregnancy identification, first ANC contact and maternal ART start."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][6].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE38' | 'HIV.E.DE40' | 'HIV.E.DE66')).answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[key].valueId = "pmtct-outcome-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[human].valueString = "Use today or an earlier date for delivery and pregnancy loss dates."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][7].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE46' | 'HIV.E.DE73')).answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[key].valueId = "pmtct-outcome-details"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[human].valueString = "Record the delivery date and place for a live birth or stillbirth. Use the miscarriage or abortion date for early pregnancy loss or induced abortion."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][8].extension[expression].valueExpression.expression = "(%resource.item.where(linkId = 'HIV.E.DE47').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE48' | 'HIV.E.DE51')).exists() implies (%resource.item.where(linkId = 'HIV.E.DE46').answer.value.ofType(date).exists() and %resource.item.where(linkId = 'HIV.E.DE67').answer.value.ofType(Coding).exists())) and (%resource.item.where(linkId = 'HIV.E.DE46').answer.value.ofType(date).exists() implies %resource.item.where(linkId = 'HIV.E.DE47').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE48' | 'HIV.E.DE51')).exists()) and (%resource.item.where(linkId = 'HIV.E.DE73').answer.value.ofType(date).exists() implies %resource.item.where(linkId = 'HIV.E.DE47').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE49' | 'HIV.E.DE50')).exists())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[key].valueId = "pmtct-preterm-category"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[human].valueString = "Choose the preterm birth category that matches the documented gestational age at birth."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][9].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE60').answer.value.ofType(integer).exists() implies %resource.item.where(linkId = 'HIV.E.DE62').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE63' | 'HIV.E.DE64' | 'HIV.E.DE65')).code.where($this = iif(%resource.item.where(linkId = 'HIV.E.DE60').answer.value.ofType(integer) < 32, 'HIV.E.DE65', iif(%resource.item.where(linkId = 'HIV.E.DE60').answer.value.ofType(integer) < 37, 'HIV.E.DE64', 'HIV.E.DE63'))).exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[key].valueId = "pmtct-infant-and-caregiver-names"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[human].valueString = "Use only letters, periods, and hyphens in infant and caregiver names."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][10].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE76' | 'infantGrandfatherName' | 'HIV.E.DE79' | 'HIV.E.ET.DE85' | 'HIV.E.DE80' | 'HIV.E.DE82')).answer.value.ofType(string).all($this.matches('^[\\\\p{L}\\\\p{M}.-]+$'))"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[key].valueId = "pmtct-anc-and-infant-birth-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[human].valueString = "Use today or earlier for the infant date of birth and use the current time or earlier for the ANC contact."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][11].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE87').answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate()) and %resource.item.where(linkId = 'HIV.E.DE85').answer.value.ofType(dateTime).where($this > now()).empty()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][12].extension[key].valueId = "pmtct-infant-known-or-estimated-age"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][12].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][12].extension[human].valueString = "Record the infant’s date of birth, or mark it as unknown and record the estimated age."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][12].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][12].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'recordInfantHistory').answer.value.ofType(boolean).where($this = true).exists() implies iif(%resource.item.where(linkId = 'HIV.E.DE88').answer.value.ofType(boolean).where($this = true).exists(), %resource.item.where(linkId = 'HIV.E.DE87').answer.value.ofType(date).empty() and %resource.item.where(linkId = 'HIV.E.DE89').answer.value.ofType(decimal).where($this >= 0).exists(), %resource.item.where(linkId = 'HIV.E.DE87').answer.value.ofType(date).exists())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][13].extension[key].valueId = "pmtct-maternal-key-population"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][13].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][13].extension[human].valueString = "Record membership when a maternal key population category is documented."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][13].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][13].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE114').answer.value.ofType(Coding).exists() implies %resource.item.where(linkId = 'HIV.E.DE113').answer.value.where($this = true).exists()"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][14].extension[key].valueId = "pmtct-supplement-units"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][14].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][14].extension[human].valueString = "Record the prescribed supplement amount as a positive quantity in milligrams."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][14].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][14].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE135' | 'HIV.E.DE139')).answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code = 'mg' and value > 0 and comparator.empty())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][15].extension[key].valueId = "pmtct-history-event-dates"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][15].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][15].extension[human].valueString = "Record counselling, register, cohort and sample collection dates as today or earlier."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][15].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][15].extension[expression].valueExpression.expression = "%resource.item.where(linkId in ('HIV.E.DE161' | 'HIV.E.DE162' | 'HIV.E.ET.DE177' | 'HIV.E.ET.DE178' | 'HIV.E.ET.DE179' | 'HIV.E.DE244')).answer.value.ofType(date).all($this <= today().toString().substring(0, $this.toString().length()).toDate())"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][16].extension[key].valueId = "pmtct-haemoglobin-unit"
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][16].extension[severity].valueCode = #error
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][16].extension[human].valueString = "Record a positive haemoglobin quantity in g/dL or g/L."
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][16].extension[expression].valueExpression.language = #text/fhirpath
* extension[http://hl7.org/fhir/StructureDefinition/targetConstraint][16].extension[expression].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE245').answer.value.ofType(Quantity).all(system = 'http://unitsofmeasure.org' and code in ('g/dL' | 'g/L') and value > 0 and comparator.empty())"

* item[+]
  * id = "HIV.E.DE1"
  * linkId = "HIV.E.DE1"
  * type = #string
  * text = "Mother's given name"
  * required = false
  * repeats = false
  * readOnly = false
  * insert PmtctVerifiedString(givenName)
* item[+]
  * id = "HIV.E.ET.DE1"
  * linkId = "HIV.E.ET.DE1"
  * type = #string
  * text = "Mother's father's name"
  * insert PmtctVerifiedString(fatherName)
* item[+]
  * id = "HIV.E.ET.DE44"
  * linkId = "HIV.E.ET.DE44"
  * type = #string
  * text = "Mother's grandfather's name"
  * insert PmtctVerifiedString(grandfatherName)
* item[+]
  * id = "HIV.E.DE2"
  * linkId = "HIV.E.DE2"
  * type = #string
  * text = "Mother's family name"
  * required = false
  * repeats = false
  * readOnly = false
  * insert PmtctVerifiedString(familyName)
* item[+]
  * id = "HIV.E.DE3"
  * linkId = "HIV.E.DE3"
  * type = #string
  * text = "Unique ART ID number"
  * required = false
  * repeats = false
  * readOnly = false
  * insert PmtctVerifiedString(artNumber)
* item[+]
  * id = "HIV.E.DE4"
  * linkId = "HIV.E.DE4"
  * type = #string
  * text = "Antenatal care serial number"
  * required = false
  * repeats = false
  * readOnly = false
  * insert PmtctVerifiedString(ancNumber)
* item[+]
  * id = "HIV.E.DE5"
  * linkId = "HIV.E.DE5"
  * type = #integer
  * text = "Gestational age (completed weeks)"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#wk "weeks"
* item[+]
  * id = "HIV.E.DE6"
  * linkId = "HIV.E.DE6"
  * type = #choice
  * text = "Source of gestational age"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE6)
* item[+]
  * id = "HIV.E.DE10"
  * linkId = "HIV.E.DE10"
  * type = #date
  * text = "Expected date of delivery (EDD)"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE11"
  * linkId = "HIV.E.DE11"
  * type = #integer
  * text = "Number of pregnancies (gravida)"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 1
* item[+]
  * id = "HIV.E.DE12"
  * linkId = "HIV.E.DE12"
  * type = #integer
  * text = "Number of previous pregnancies"
  * required = true
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.E.DE11').answer.value.ofType(integer).count() = 1 and %resource.item.where(linkId = 'HIV.E.DE11').answer.value.ofType(integer) >= 1, %resource.item.where(linkId = 'HIV.E.DE11').answer.value.ofType(integer) - 1, {})"
* item[+]
  * id = "HIV.E.DE13"
  * linkId = "HIV.E.DE13"
  * type = #integer
  * text = "Number of previous miscarriages and/or abortions before 28 weeks"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.E.DE14"
  * linkId = "HIV.E.DE14"
  * type = #integer
  * text = "Number of live births after 28 weeks in previous pregnancies"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.E.DE15"
  * linkId = "HIV.E.DE15"
  * type = #integer
  * text = "Number of caesarean sections in previous pregnancies"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.E.DE16"
  * linkId = "HIV.E.DE16"
  * type = #integer
  * text = "Number of stillbirths after 28 weeks in previous pregnancies"
  * required = true
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.E.DE17"
  * linkId = "HIV.E.DE17"
  * type = #choice
  * text = "Past pregnancy complications"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE17-capture)
* item[+]
  * id = "HIV.E.DE35"
  * linkId = "HIV.E.DE35"
  * type = #string
  * text = "Other past pregnancy problems (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE17"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE34
* item[+]
  * id = "HIV.E.DE36"
  * linkId = "HIV.E.DE36"
  * type = #integer
  * text = "Parity"
  * required = true
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.E.DE14').answer.value.ofType(integer).count() = 1 and %resource.item.where(linkId = 'HIV.E.DE16').answer.value.ofType(integer).count() = 1 and %resource.item.where(linkId = 'HIV.E.DE14').answer.value.ofType(integer) >= 0 and %resource.item.where(linkId = 'HIV.E.DE16').answer.value.ofType(integer) >= 0, %resource.item.where(linkId = 'HIV.E.DE14').answer.value.ofType(integer) + %resource.item.where(linkId = 'HIV.E.DE16').answer.value.ofType(integer), {})"
* item[+]
  * id = "HIV.E.DE141"
  * linkId = "HIV.E.DE141"
  * type = #choice
  * text = "Maternal HIV status"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE141)
* item[+]
  * id = "HIV.E.DE37"
  * linkId = "HIV.E.DE37"
  * type = #boolean
  * text = "Current pregnancy in a woman living with HIV"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "pregnancyStatus"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%maternalHistory.parameter.where(name = 'currentlyPregnant').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "knownMaternalHivStatus"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE141').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE142' | 'HIV.E.DE143'))"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%pregnancyStatus.count() = 1 and %knownMaternalHivStatus.count() = 1, %pregnancyStatus = true and %knownMaternalHivStatus.code = 'HIV.E.DE142', {})"
* item[+]
  * id = "HIV.E.DE38"
  * linkId = "HIV.E.DE38"
  * type = #date
  * text = "Date new pregnancy of HIV-positive woman identified"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE141"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE142
* item[+]
  * id = "HIV.E.DE39"
  * linkId = "HIV.E.DE39"
  * type = #boolean
  * text = "ANC contact during pregnancy"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE40"
  * linkId = "HIV.E.DE40"
  * type = #date
  * text = "Date of first ANC contact"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE39"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE66"
  * linkId = "HIV.E.DE66"
  * type = #date
  * text = "Maternal ART start date"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE41"
  * linkId = "HIV.E.DE41"
  * type = #choice
  * text = "Timing of ART initiation"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE41)
  * enableBehavior = #all
  * enableWhen[0].question = "HIV.E.DE141"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE142
  * enableWhen[+].question = "HIV.E.DE66"
  * enableWhen[=].operator = #exists
  * enableWhen[=].answerBoolean = true
* item[+]
  * id = "HIV.E.DE45"
  * linkId = "HIV.E.DE45"
  * type = #boolean
  * text = "Maternal use of recommended ART regimen"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "regimenAssessment"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%maternalHistory.parameter.where(name = 'recommendedArtRegimen').value.ofType(boolean)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression].valueExpression.expression = "iif(%regimenAssessment.count() = 1, %regimenAssessment, {})"
  * enableWhen.question = "HIV.E.DE141"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE142
* item[+]
  * id = "HIV.E.DE47"
  * linkId = "HIV.E.DE47"
  * type = #choice
  * text = "Pregnancy outcome"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE47)
* item[+]
  * id = "HIV.E.DE46"
  * linkId = "HIV.E.DE46"
  * type = #date
  * text = "Delivery date"
  * required = true
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE48
  * enableWhen[+].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE51
* item[+]
  * id = "HIV.E.DE52"
  * linkId = "HIV.E.DE52"
  * type = #choice
  * text = "Delivery mode"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE52)
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE48
  * enableWhen[+].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE51
* item[+]
  * id = "HIV.E.DE56"
  * linkId = "HIV.E.DE56"
  * type = #string
  * text = "Indications for caesarian section (C/S)"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE52"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE55
* item[+]
  * id = "HIV.E.DE57"
  * linkId = "HIV.E.DE57"
  * type = #string
  * text = "Obstetric complications"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE58"
  * linkId = "HIV.E.DE58"
  * type = #boolean
  * text = "Live birth"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "recordedOutcome"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE47').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE48' | 'HIV.E.DE49' | 'HIV.E.DE50' | 'HIV.E.DE51'))"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%recordedOutcome.count() = 1, %recordedOutcome.code = 'HIV.E.DE48', {})"
* item[+]
  * id = "HIV.E.DE59"
  * linkId = "HIV.E.DE59"
  * type = #boolean
  * text = "Live birth to an HIV-positive woman"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "recordedOutcome"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE47').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE48' | 'HIV.E.DE49' | 'HIV.E.DE50' | 'HIV.E.DE51'))"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "knownMaternalStatus"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE141').answer.value.ofType(Coding).where(system = 'http://smart.who.int/hiv/CodeSystem/HIVConcepts' and code in ('HIV.E.DE142' | 'HIV.E.DE143'))"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%recordedOutcome.count() = 1, iif(%recordedOutcome.code = 'HIV.E.DE48', iif(%knownMaternalStatus.count() = 1, %knownMaternalStatus.code = 'HIV.E.DE142', {}), false), {})"
* item[+]
  * id = "HIV.E.DE60"
  * linkId = "HIV.E.DE60"
  * type = #integer
  * text = "Gestational age at birth (completed weeks)"
  * required = false
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE48
  * enableWhen[+].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE51
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 1
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#wk "weeks"
* item[+]
  * id = "HIV.E.DE61"
  * linkId = "HIV.E.DE61"
  * type = #boolean
  * text = "Documented small for gestational age (SGA)"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE60"
  * enableWhen.operator = #exists
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE62"
  * linkId = "HIV.E.DE62"
  * type = #choice
  * text = "Preterm birth status"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE62)
  * enableWhen.question = "HIV.E.DE60"
  * enableWhen.operator = #exists
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE67"
  * linkId = "HIV.E.DE67"
  * type = #choice
  * text = "Place of delivery"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE67)
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE48
  * enableWhen[+].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE51
* item[+]
  * id = "HIV.E.DE71"
  * linkId = "HIV.E.DE71"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE67"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE70
* item[+]
  * id = "HIV.E.DE72"
  * linkId = "HIV.E.DE72"
  * type = #string
  * text = "Delivery facility name"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE67"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE68
* item[+]
  * id = "HIV.E.DE73"
  * linkId = "HIV.E.DE73"
  * type = #date
  * text = "Date of miscarriage or abortion"
  * required = false
  * repeats = false
  * readOnly = false
  * enableBehavior = #any
  * enableWhen[0].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE49
  * enableWhen[+].question = "HIV.E.DE47"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerCoding = HIVConcepts#HIV.E.DE50
* item[+]
  * linkId = "recordInfantHistory"
  * type = #boolean
  * text = "Record the linked infant's history now?"
  * enableWhen.question = "HIV.E.DE47"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.E.DE48
* item[+]
  * id = "HIV.E.DE76"
  * linkId = "HIV.E.DE76"
  * type = #string
  * text = "Infant's given name"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * insert PmtctVerifiedString(infantGivenName)
* item[+]
  * linkId = "HIV.E.ET.DE77"
  * type = #string
  * text = "Infant's father's name"
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * insert PmtctVerifiedString(infantFatherName)
* item[+]
  * linkId = "infantGrandfatherName"
  * type = #string
  * text = "Infant's grandfather's name"
  * required = true
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * insert PmtctVerifiedString(infantGrandfatherName)
* item[+]
  * id = "HIV.E.DE77"
  * linkId = "HIV.E.DE77"
  * type = #string
  * text = "Infant's family name"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * insert PmtctVerifiedString(infantFamilyName)
* item[+]
  * id = "HIV.E.DE78"
  * linkId = "HIV.E.DE78"
  * type = #string
  * text = "Infant's MRN"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * insert PmtctVerifiedString(infantMrn)
* item[+]
  * id = "HIV.E.DE79"
  * linkId = "HIV.E.DE79"
  * type = #string
  * text = "Biological mother's given name"
  * required = false
  * repeats = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.E.DE1').answer.value.ofType(string).count() = 1, %resource.item.where(linkId = 'HIV.E.DE1').answer.value.ofType(string), {})"
* item[+]
  * linkId = "HIV.E.ET.DE82"
  * type = #string
  * text = "Biological mother's father's name"
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.E.ET.DE1').answer.value.ofType(string).count() = 1, %resource.item.where(linkId = 'HIV.E.ET.DE1').answer.value.ofType(string), {})"
* item[+]
  * linkId = "HIV.E.ET.DE85"
  * type = #string
  * text = "Biological mother's grandfather's name"
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.E.ET.DE44').answer.value.ofType(string).count() = 1, %resource.item.where(linkId = 'HIV.E.ET.DE44').answer.value.ofType(string), {})"
* item[+]
  * id = "HIV.E.DE80"
  * linkId = "HIV.E.DE80"
  * type = #string
  * text = "Biological mother's family name"
  * required = false
  * repeats = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.E.DE2').answer.value.ofType(string).count() = 1, %resource.item.where(linkId = 'HIV.E.DE2').answer.value.ofType(string), {})"
* item[+]
  * id = "HIV.E.DE81"
  * linkId = "HIV.E.DE81"
  * type = #string
  * text = "Biological mother's unique ART number"
  * required = false
  * repeats = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%resource.item.where(linkId = 'HIV.E.DE3').answer.value.ofType(string).count() = 1, %resource.item.where(linkId = 'HIV.E.DE3').answer.value.ofType(string), {})"
* item[+]
  * id = "HIV.E.DE82"
  * linkId = "HIV.E.DE82"
  * type = #string
  * text = "Caregiver's given name"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "HIV.E.ET.DE83"
  * type = #string
  * text = "Caregiver's grandfather's name"
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "caregiverFatherName"
  * type = #string
  * text = "Caregiver's father's name"
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE84"
  * linkId = "HIV.E.DE84"
  * type = #string
  * text = "Caregiver's national ID"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * insert PmtctVerifiedString(caregiverNationalId)
* item[+]
  * id = "HIV.E.DE85"
  * linkId = "HIV.E.DE85"
  * type = #dateTime
  * text = "ANC contact date"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.E.DE39"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE86"
  * linkId = "HIV.E.DE86"
  * type = #boolean
  * text = "Infant referred for care"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE88"
  * linkId = "HIV.E.DE88"
  * type = #boolean
  * text = "Date of birth of infant unknown"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE87"
  * linkId = "HIV.E.DE87"
  * type = #date
  * text = "Infant date of birth"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-enableWhenExpression].valueExpression.expression = "%resource.item.where(linkId = 'recordInfantHistory').answer.value.ofType(boolean).where($this = true).exists() and %resource.item.where(linkId = 'HIV.E.DE88').answer.value.ofType(boolean).where($this = true).empty()"
* item[+]
  * id = "HIV.E.DE89"
  * linkId = "HIV.E.DE89"
  * type = #decimal
  * text = "Estimated age of infant (years)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableBehavior = #all
  * enableWhen[0].question = "recordInfantHistory"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerBoolean = true
  * enableWhen[+].question = "HIV.E.DE88"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueDecimal = 0.0
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#a "years"
* item[+]
  * id = "HIV.E.DE90"
  * linkId = "HIV.E.DE90"
  * type = #decimal
  * text = "Age of infant at recorded contact (years)"
  * required = false
  * repeats = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "recordedBirthDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE87').answer.value.ofType(date).where(toString().length() = 10)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "recordedContactDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE85').answer.value.ofType(dateTime).toString().substring(0,10).toDate().where(toString().length() = 10)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.name = "ageBirthDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.expression = "%maternalHistory.parameter.where(name = 'infantAgeBirthDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.name = "ageContactDate"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.expression = "%maternalHistory.parameter.where(name = 'infantAgeContactDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][4].valueExpression.name = "verifiedAge"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][4].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][4].valueExpression.expression = "%maternalHistory.parameter.where(name = 'infantAgeInYears').value.ofType(decimal)"
  * readOnly = true
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%recordedBirthDate.count() = 1 and %recordedContactDate.count() = 1 and %ageBirthDate.count() = 1 and %ageContactDate.count() = 1 and %verifiedAge.count() = 1 and %recordedBirthDate = %ageBirthDate and %recordedContactDate = %ageContactDate and %recordedContactDate >= %recordedBirthDate, %verifiedAge.where($this >= 0), {})"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#a "years"
* item[+]
  * id = "HIV.E.DE91"
  * linkId = "HIV.E.DE91"
  * type = #choice
  * text = "Recorded sex of infant"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE91-capture)
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE113"
  * linkId = "HIV.E.DE113"
  * type = #boolean
  * text = "Key population member"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE114"
  * linkId = "HIV.E.DE114"
  * type = #choice
  * text = "Key population member type"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE114-capture)
  * enableWhen.question = "HIV.E.DE113"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE134"
  * linkId = "HIV.E.DE134"
  * type = #boolean
  * text = "Taking iron and folic acid (IFA) tablets"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE135"
  * linkId = "HIV.E.DE135"
  * type = #quantity
  * text = "Amount of iron prescribed"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#mg "mg"
* item[+]
  * id = "HIV.E.DE136"
  * linkId = "HIV.E.DE136"
  * type = #choice
  * text = "Iron prescription frequency"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE136)
* item[+]
  * id = "HIV.E.DE139"
  * linkId = "HIV.E.DE139"
  * type = #quantity
  * text = "Amount of daily dose of folic acid prescribed"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption].valueCoding = http://unitsofmeasure.org#mg "mg"
* item[+]
  * id = "HIV.E.DE145"
  * linkId = "HIV.E.DE145"
  * type = #choice
  * text = "Maternal HIV status at first ANC visit"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE145)
* item[+]
  * linkId = "maternalRiskFindingsRecorded"
  * type = #boolean
  * text = "Were any listed HIV risk findings documented?"
* item[+]
  * linkId = "HIV.E.DE155"
  * type = #choice
  * text = "Documented signs of substantial risk of HIV infection"
  * answerValueSet = Canonical(HIV.E.DE155-capture)
  * repeats = true
  * required = true
  * enableWhen.question = "maternalRiskFindingsRecorded"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "maternalPrepProvided"
  * type = #boolean
  * text = "PrEP provided to the maternal client"
* item[+]
  * id = "HIV.E.DE160"
  * linkId = "HIV.E.DE160"
  * type = #boolean
  * text = "Serodiscordant partner"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE161"
  * linkId = "HIV.E.DE161"
  * type = #date
  * text = "Date woman received counselling for CPT"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE162"
  * linkId = "HIV.E.DE162"
  * type = #date
  * text = "Date woman received counselling for TPT"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.E.DE173"
  * linkId = "HIV.E.DE173"
  * type = #choice
  * text = "Maternal and child health service visit"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE173)
* item[+]
  * id = "HIV.E.DE177"
  * linkId = "HIV.E.DE177"
  * type = #integer
  * text = "Weeks postpartum"
  * required = false
  * repeats = false
  * readOnly = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#wk "weeks"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.name = "deliveryDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable].valueExpression.expression = "%resource.item.where(linkId = 'HIV.E.DE46').answer.value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.name = "weeksDeliveryDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][1].valueExpression.expression = "%maternalHistory.parameter.where(name = 'postpartumDeliveryDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.name = "postpartumVisitDates"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][2].valueExpression.expression = "%maternalHistory.parameter.where(name = 'postpartumVisitDate').value.ofType(date)"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.name = "postpartumWeeks"
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/StructureDefinition/variable][3].valueExpression.expression = "%maternalHistory.parameter.where(name = 'postpartumWeeks').value.ofType(integer)"
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.language = #text/fhirpath
  * extension[http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression].valueExpression.expression = "iif(%deliveryDates.count() = 1 and %weeksDeliveryDates.count() = 1 and %postpartumVisitDates.count() = 1 and %postpartumWeeks.count() = 1, iif(%weeksDeliveryDates.toString().length() = 10 and %postpartumVisitDates.toString().length() = 10 and %deliveryDates = %weeksDeliveryDates and %postpartumVisitDates.toDate() >= %weeksDeliveryDates.toDate() and %postpartumVisitDates.toDate() <= today(), %postpartumWeeks.where($this >= 0), {}), {})"
* item[+]
  * linkId = "HIV.E.ET.DE177"
  * type = #date
  * text = "Integrated PMTCT register date"
* item[+]
  * linkId = "HIV.E.ET.DE178"
  * type = #date
  * text = "Maternal cohort date"
* item[+]
  * linkId = "HIV.E.ET.DE179"
  * type = #date
  * text = "HIV-exposed infant cohort date"
* item[+]
  * id = "HIV.E.DE243"
  * linkId = "HIV.E.DE243"
  * type = #integer
  * text = "Age at additional infant HIV test (months)"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unit].valueCoding = http://unitsofmeasure.org#mo "months"
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.E.DE244"
  * linkId = "HIV.E.DE244"
  * type = #date
  * text = "Date of sample collection of additional infant HIV test"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "recordInfantHistory"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.E.DE245"
  * linkId = "HIV.E.DE245"
  * type = #quantity
  * text = "Haemoglobin (Hb) result"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption][0].valueCoding = http://unitsofmeasure.org#g/dL "g/dL"
  * extension[http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption][+].valueCoding = http://unitsofmeasure.org#g/L "g/L"
* item[+]
  * id = "HIV.E.DE246"
  * linkId = "HIV.E.DE246"
  * type = #choice
  * text = "Blood group and Rh factor"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE246)
* item[+]
  * id = "HIV.E.DE255"
  * linkId = "HIV.E.DE255"
  * type = #choice
  * text = "Asymptomatic bacteriuria (ASB) test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE255)
* item[+]
  * id = "HIV.E.DE259"
  * linkId = "HIV.E.DE259"
  * type = #choice
  * text = "Urine protein test result"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.E.DE259)
