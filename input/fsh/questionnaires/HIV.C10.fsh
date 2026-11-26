Instance: HIV.C10CounselOnRiskAndPrevention
InstanceOf: sdc-questionnaire-extr-smap
Title: "Counsel on risk and prevention"
Description: "Records prevention and support services offered and supplies given during counselling."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablequestionnaire"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablequestionnaire"
* subjectType = #Patient
* language = #en
* version = "2026-10"
* status = #draft
* experimental = true

* item[+]
  * id = "HIV.C.DE131"
  * linkId = "HIV.C.DE131"
  * type = #choice
  * text = "Prevention services offered and referrals"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE131)
* item[+]
  * id = "HIV.C.DE136"
  * linkId = "HIV.C.DE136"
  * type = #date
  * text = "Date provided condoms"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.DE137"
  * linkId = "HIV.C.DE137"
  * type = #integer
  * text = "Condoms distributed"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
* item[+]
  * id = "HIV.C.DE138"
  * linkId = "HIV.C.DE138"
  * type = #choice
  * text = "Condom type"
  * required = true
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE138)
  * enableWhen.question = "HIV.C.DE137"
  * enableWhen.operator = #>
  * enableWhen.answerInteger = 0
* item[+]
  * id = "HIV.C.DE141"
  * linkId = "HIV.C.DE141"
  * type = #boolean
  * text = "HIV self-test kits accepted"
  * required = false
  * repeats = false
  * readOnly = false
* item[+]
  * id = "HIV.C.DE142"
  * linkId = "HIV.C.DE142"
  * type = #integer
  * text = "Number of HIV self-test kits distributed"
  * required = false
  * repeats = false
  * readOnly = false
  * extension[http://hl7.org/fhir/StructureDefinition/minValue].valueInteger = 0
  * enableWhen.question = "HIV.C.DE141"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.C.DE143"
  * linkId = "HIV.C.DE143"
  * type = #choice
  * text = "HIV self-test distributed for use by"
  * required = false
  * repeats = false
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE143)
  * enableWhen.question = "HIV.C.DE141"
  * enableWhen.operator = #=
  * enableWhen.answerBoolean = true
* item[+]
  * id = "HIV.C.DE149"
  * linkId = "HIV.C.DE149"
  * type = #choice
  * text = "Sexual and reproductive health integrated services"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE149)
* item[+]
  * id = "HIV.C.DE157"
  * linkId = "HIV.C.DE157"
  * type = #choice
  * text = "Offer other clinical services"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE157)
* item[+]
  * id = "HIV.C.DE164"
  * linkId = "HIV.C.DE164"
  * type = #choice
  * text = "Other support services"
  * required = false
  * repeats = true
  * readOnly = false
  * answerValueSet = Canonical(HIV.C.DE164)
