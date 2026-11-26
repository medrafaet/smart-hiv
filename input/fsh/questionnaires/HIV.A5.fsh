Instance: HIV.A5CreateNewClientRecord
InstanceOf: sdc-questionnaire-extr-smap
Title: "Create new client record"
Description: "Questionnaire for create new client record"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true
* insert RegistrationBirthConstraint
* insert RegistrationGeographyContext

* item[+]
  * id = "HIV.A.DE8"
  * linkId = "HIV.A.DE8"
  * type = #string
  * text = "Medical record number (MRN)"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE9"
  * linkId = "HIV.A.DE9"
  * type = #string
  * text = "National ID"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE11"
  * linkId = "HIV.A.DE11"
  * type = #string
  * text = "Unique ART number"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE12"
  * linkId = "HIV.A.DE12"
  * type = #string
  * text = "National health insurance ID"
  * required = false
  * repeats = false
  * readOnly = false
* insert RegistrationBirthQuestions
* item[+]
  * id = "HIV.A.DE18"
  * linkId = "HIV.A.DE18"
  * type = #choice
  * text = "Sex"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = "http://fhir.et/core/ValueSet/gender-vs"
* insert RegistrationResidenceQuestions
* item[+]
  * id = "HIV.A.DE30"
  * linkId = "HIV.A.DE30"
  * type = #choice
  * text = "Marital Status"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.A.DE30)
* insert Question(HIV.A.ET.DE8, Educational status, choice, false, false)
* item[=].id = "HIV.A.ET.DE8"
* item[=].answerValueSet = "http://fhir.et/core/ValueSet/education-status-vs"
* insert Question(HIV.A.ET.DE14, Occupation, choice, false, false)
* item[=].id = "HIV.A.ET.DE14"
* item[=].answerValueSet = "http://fhir.et/core/ValueSet/occupation-vs"
* insert Question(HIV.A.ET.DE24, Specify other occupation, string, false, false)
* item[=].id = "HIV.A.ET.DE24"
* item[=].enableWhen[+].question = "HIV.A.ET.DE14"
* item[=].enableWhen[=].operator = #=
* item[=].enableWhen[=].answerCoding = http://fhir.et/core/CodeSystem/occupation#other
* item[+]
  * id = "HIV.A.DE42"
  * linkId = "HIV.A.DE42"
  * type = #string
  * text = "Telephone number"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE43"
  * linkId = "HIV.A.DE43"
  * type = #string
  * text = "Catchment area"
  * required = true
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE44"
  * linkId = "HIV.A.DE44"
  * type = #boolean
  * text = "Communication consent"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE45"
  * linkId = "HIV.A.DE45"
  * type = #boolean
  * text = "Reminder messages"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE46"
  * linkId = "HIV.A.DE46"
  * type = #choice
  * text = "Communication preference(s)"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.A.DE46)
* item[+]
  * id = "HIV.A.DE49"
  * linkId = "HIV.A.DE49"
  * type = #string
  * text = "Client's email"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/regex].valueString = "^[^@\\s]+@[^@\\s]+$"
* item[+]
  * id = "HIV.A.DE50"
  * linkId = "HIV.A.DE50"
  * type = #string
  * text = "Alternate contact's name"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE51"
  * linkId = "HIV.A.DE51"
  * type = #string
  * text = "Alternate contact's phone number"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE52"
  * linkId = "HIV.A.DE52"
  * type = #string
  * text = "Alternate contact's address"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.A.DE53"
  * linkId = "HIV.A.DE53"
  * type = #string
  * text = "Alternate contact relationship"
  * required = false
  * repeats = false
  * readOnly = false
