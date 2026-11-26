library HIVConfig

using FHIR version '4.0.1'

include HIVConcepts called Concepts

parameter HivBurdenSetting Code

/* 
 * HIV burden of setting
 */
define "HIV burden of setting":
  if HivBurdenSetting ~ Concepts."High HIV burden setting"
    or HivBurdenSetting ~ Concepts."Low HIV burden setting"
  then HivBurdenSetting
  else null

define "Testing Interval":
  3 months

define "Intervention Interval":
  7 days

define "LTFU Days":
  28 days

define "DSD Retention Interval":
  12 months
