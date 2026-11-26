Instance: HIV.D25OfferVoluntaryPartnerAndFamilyServices
InstanceOf: sdc-questionnaire-extr-smap
Title: "Offer voluntary partner and family services"
Description: "Records the voluntary service offer, the client’s response and follow-up details for individual family members."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.D.DE517"
  * linkId = "HIV.D.DE517"
  * type = #boolean
  * text = "Offered voluntary partner services"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE512"
  * linkId = "HIV.D.DE512"
  * type = #boolean
  * text = "Accepted partner services"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE517"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.D.DE513"
  * linkId = "HIV.D.DE513"
  * type = #boolean
  * text = "Offered voluntary HIV testing for partners and biological children"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE518"
  * linkId = "HIV.D.DE518"
  * type = #boolean
  * text = "Provided support for disclosure and partner services"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE772"
  * linkId = "HIV.D.DE772"
  * type = #boolean
  * text = "Partner testing offered"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.D.DE773"
  * linkId = "HIV.D.DE773"
  * type = #boolean
  * text = "Partner testing accepted"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.D.DE772"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * linkId = "familyMember"
  * type = #group
  * text = "Family member or partner"
  * repeats = true
  * enableWhen.question = "HIV.D.DE512"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * item[+]
    * linkId = "HIV.D.DE515"
    * type = #string
    * text = "Unique ID of family member"
  * item[+]
    * linkId = "HIV.D.DE514"
    * type = #choice
    * text = "Documented HIV status of family member"
    * answerValueSet = Canonical(HIV.D.DE514)
  * item[+]
    * linkId = "HIV.D.DE516"
    * type = #date
    * text = "Date of death of family member"
  * item[+]
    * linkId = "HIV.D.DE774"
    * type = #date
    * text = "Date partner contacted for index testing"
  * item[+]
    * linkId = "HIV.D.DE775"
    * type = #date
    * text = "Date partner tested for HIV"
