Instance: ExampleHivPatient
InstanceOf: HivPatient
Title: "Example HIV Patient"
Description: "Example Patient conforming to the HIV Patient profile for Ethiopia HIV.A registration."

* id = "ExampleHivPatient"
* active = true
* identifier[mrn].type = $identifier-type#MR "Medical record number"
* identifier[mrn].value = "MRN-123456"
* identifier[nationalIdentifier].type = $identifier-type#NI "National unique individual identifier"
* identifier[nationalIdentifier].value = "ETH-1234567890"
// The open ART identifier follows the two inherited slices; [+] would restart at index 0.
* identifier[2].type = HIVConcepts#HIV.A.DE11 "Unique ART number"
* identifier[2].value = "ART-987654"
* name.given = "Abebe"
* name.family.extension[fathersName].valueString = "Bekele"
* name.family.extension[grandfathersName].valueString = "Kebede"
* gender = #male
* birthDate = "1980-01-01"
* extension[communicationConsent].valueBoolean = true
* extension[reminderMessages].valueBoolean = true
* extension[communicationPreference].valueCodeableConcept = HIVConcepts#HIV.A.DE47 "Text message/SMS"
* extension[education].valueCodeableConcept = http://fhir.et/core/CodeSystem/education-status-cs#primary "Primary school"
* extension[Occupation].valueCodeableConcept = http://fhir.et/core/CodeSystem/occupation#emp "Employed"
* telecom[phone].system = #phone
* telecom[phone].value = "+251911234567"
* telecom[email].system = #email
* telecom[email].use = #home
* telecom[email].value = "abebe.kebede@example.org"
* address.text = "House 24, Kebele 08, Ketena 03, Bole Woreda, Addis Ababa"
* address.line = "House 24, Kebele 08, Ketena 03"
* address.extension[zone].valueString = "Bole Subcity"
* address.district = "Bole Woreda"
* address.state = "AA"
* address.country = "ET"
* address.extension[kebele].valueString = "Kebele 08"
* address.extension[ketena_Gott].valueString = "Ketena 03"
* address.extension[houseNumber].valueString = "House 24"
* contact.name.text = "Almaz Kebede"
* contact.telecom.system = #phone
* contact.telecom.value = "+251922345678"
* contact.address.text = "Alternate contact address example"
* contact.relationship.text = "Family member"
