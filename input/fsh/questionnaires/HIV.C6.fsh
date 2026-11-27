Instance: HIV.C6PostTestPackageOfServices
InstanceOf: sdc-questionnaire-extr-smap
Title: "Post-test package of services"
Description: "Questionnaire for post-test package of services"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* insert EthiopiaQuestionnaireVersion
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.C.DE130"
  * linkId = "HIV.C.DE130"
  * type = #boolean
  * text = "Linked to enrolment in care and ART initiation"
  * required = false
  * repeats = false
  * readOnly = false
