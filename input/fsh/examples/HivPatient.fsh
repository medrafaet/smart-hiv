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
* name.given[0] = "Abebe"
* name.given[1] = "Bekele"
* name.family = "Kebede"
* gender = #male
* birthDate = "1980-01-01"
* extension[communicationConsent].valueBoolean = true
* extension[reminderMessages].valueBoolean = true
* extension[communicationPreference].valueCodeableConcept = HIVConcepts#HIV.A.DE47 "Text message/SMS"
* extension[educationStatus].valueCodeableConcept = HIVConcepts#HIV.A.ET.DE10 "Primary school"
* extension[occupation].valueCodeableConcept = HIVConcepts#HIV.A.ET.DE14 "Employed"
* telecom[phone].system = #phone
* telecom[phone].value = "+251911234567"
* telecom[email].system = #email
* telecom[email].value = "abebe.kebede@example.org"
* address.text = "House 24, Kebele 08, Ketena 03, Bole Woreda, Addis Ababa"
* address.line = "House 24, Kebele 08, Ketena 03"
* address.city = "Bole Subcity"
* address.district = "Bole Woreda"
* address.state = "Addis Ababa"
* address.country = "ET"
* address.extension[kebele].valueString = "Kebele 08"
* address.extension[ketenaGott].valueString = "Ketena 03"
* address.extension[houseNumber].valueString = "House 24"
* contact.name.text = "Almaz Kebede"
* contact.telecom.system = #phone
* contact.telecom.value = "+251922345678"
* contact.address.text = "Alternate contact address example"
* contact.relationship.text = "Family member"
