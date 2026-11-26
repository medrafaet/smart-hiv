Instance: HIV.B9DetermineRecommendedServices
InstanceOf: sdc-questionnaire-extr-smap
Title: "Determine recommended services"
Description: "Questionnaire for determine recommended services"
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.B.DE149"
  * linkId = "HIV.B.DE149"
  * type = #choice
  * text = "Prevention services offered and referrals"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE149)
* item[+]
  * id = "HIV.B.DE158"
  * linkId = "HIV.B.DE158"
  * type = #choice
  * text = "Sexual and reproductive health integrated services"
  * required = true
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE158)
* item[+]
  * id = "HIV.B.DE165"
  * linkId = "HIV.B.DE165"
  * type = #choice
  * text = "Offer other clinical services"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE165)
* item[+]
  * id = "HIV.B.DE172"
  * linkId = "HIV.B.DE172"
  * type = #choice
  * text = "Other support services"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE172)
* item[+]
  * id = "HIV.B.DE178"
  * linkId = "HIV.B.DE178"
  * type = #boolean
  * text = "Clinical enquiry for intimate partner violence (IPV) done"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE179"
  * linkId = "HIV.B.DE179"
  * type = #choice
  * text = "Intimate partner violence enquiry results"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.B.DE179)
  * enableWhen.question = "HIV.B.DE178"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.B.DE184"
  * linkId = "HIV.B.DE184"
  * type = #string
  * text = "Other IPV result (specify)"
  * required = true
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE179"
  * enableWhen.operator = #=
  * enableWhen.answerCoding = HIVConcepts#HIV.B.DE183
* item[+]
  * id = "HIV.B.DE185"
  * linkId = "HIV.B.DE185"
  * type = #boolean
  * text = "Offered voluntary partner services"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE187"
  * linkId = "HIV.B.DE187"
  * type = #boolean
  * text = "Offered social network-based/partner services"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.B.DE188"
  * linkId = "HIV.B.DE188"
  * type = #boolean
  * text = "Accepted social network-based/partner services"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen[+].question = "HIV.B.DE185"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerBoolean = true
  * enableWhen[+].question = "HIV.B.DE187"
  * enableWhen[=].operator = #=
  * enableWhen[=].answerBoolean = true
  * enableBehavior = #any
* item[+]
  * id = "HIV.B.DE186"
  * linkId = "HIV.B.DE186"
  * type = #integer
  * text = "Count of contacts or partners given for social network-based/partner services"
  * required = false
  * repeats = false
  * readOnly = false
  * enableWhen.question = "HIV.B.DE188"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * linkId = "indexContact"
  * type = #group
  * text = "Index contact"
  * repeats = true
  * enableWhen.question = "HIV.B.DE188"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
  * item[+]
    * linkId = "HIV.B.ET.DE19"
    * text = "Full name of contact"
    * type = #string
  * item[+]
    * linkId = "HIV.B.ET.DE11"
    * text = "Phone number"
    * type = #string
  * item[+]
    * linkId = "HIV.B.ET.DE18"
    * text = "Physical address"
    * type = #string
  * item[+]
    * linkId = "HIV.B.ET.DE12"
    * text = "Has the index client already disclosed their HIV status?"
    * type = #boolean
  * item[+]
    * linkId = "HIV.B.ET.DE13"
    * text = "Notification plan or method"
    * type = #choice
    * answerValueSet = Canonical(HIV.B.ET.DE13)
