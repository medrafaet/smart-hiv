Instance: HIV.D14PreventScreenAndManageComorbiditiesAndCoinfections
InstanceOf: sdc-questionnaire-extr-smap
Title: "Prevent, screen, and manage comorbidities and coinfections"
Description: "Records the documented risk factors, comorbidities and coinfection signs and symptoms during Care and Treatment."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.D.DE259"
  * linkId = "HIV.D.DE259"
  * type = #choice
  * text = "Risk factors, comorbidities and coinfections signs and symptoms"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.D.DE259-capture)
* item[+]
  * id = "HIV.D.DE288"
  * linkId = "HIV.D.DE288"
  * type = #string
  * text = "Other (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE259"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.D.DE287
* item[+]
  * id = "HIV.D.DE1017"
  * linkId = "HIV.D.DE1017"
  * type = #boolean
  * text = "Eligible for TB preventive treatment"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE1018"
  * linkId = "HIV.D.DE1018"
  * type = #date
  * text = "Date when eligibility for TB preventive treatment (TPT) was determined"
  * required = false
  * repeats = false
  * readOnly = false
