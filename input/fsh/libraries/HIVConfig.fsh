Instance: HIVConfig
InstanceOf: Library
Title: "HIVConfig"
Description: "Configuration inputs for HIV decision support, including the programme-approved HIV burden classification for the site."
Usage: #definition
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-shareablelibrary"
* meta.profile[+] = "http://hl7.org/fhir/uv/crmi/StructureDefinition/crmi-publishablelibrary"
* meta.profile[+] = "http://hl7.org/fhir/uv/cql/StructureDefinition/cql-library"
* meta.profile[+] = "http://hl7.org/fhir/uv/cql/StructureDefinition/cql-module"
* url = "https://hiv.fhir.et/Library/HIVConfig"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/cqf-knowledgeCapability"
  * valueCode = #computable
* name = "HIVConfig"
* status = #draft
* experimental = true
* publisher = "World Health Organization (WHO)"
* type = $library-type#logic-library
* parameter[+].name = #HivBurdenSetting
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].type = #Coding
* parameter[=].documentation = "Supply the programme-approved code for the verified site from HIV.Config.DE12."
* content.id = "ig-loader-HIVConfig.cql"
