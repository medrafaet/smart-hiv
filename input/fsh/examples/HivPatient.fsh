Instance: ExampleHivPatient
InstanceOf: HivPatient
Title: "Example HIV Patient"
Description: "Example Patient conforming to the HIV Patient profile for Ethiopia HIV.A registration."

* id = "ExampleHivPatient"
* active = true
* identifier[mrn].type = $identifier-type#MR "Medical record number"
* identifier[mrn].value = "MRN-123456"
* identifier[nationalId].type = $identifier-type#NI "National unique individual identifier"
* identifier[nationalId].value = "ETH-1234567890"
* identifier[uniqueArtNumber].type = HIVConcepts#HIV.A.DE11 "Unique ART number"
* identifier[uniqueArtNumber].value = "ART-987654"
* name.given = "Abebe"
* name.family = "Kebede"
* gender = #male
* birthDate = "1980-01-01"
* telecom[phone].system = #phone
* telecom[phone].value = "+251911234567"
* telecom[email].system = #email
* telecom[email].value = "abebe.kebede@example.org"
* address.text = "Catchment area example"
* address.district = "Addis Ababa catchment area"
* address.country = "ET"
* contact.name.text = "Almaz Kebede"
* contact.telecom.system = #phone
* contact.telecom.value = "+251922345678"
* contact.address.text = "Alternate contact address example"
* contact.relationship.text = "Family member"
