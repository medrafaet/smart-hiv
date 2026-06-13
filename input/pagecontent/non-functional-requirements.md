This page provides an overview of illustrative non-functional requirements that may be considered when designing or adapting HIV digital tracking and decision-support systems for Ethiopian Ministry of Health implementation.

Non-functional requirements provide the general attributes and features of the digital system to ensure usability and overcome technical and physical constraints. Examples of non-functional requirements include ability to work offline, multiple language settings and password protection.

# Table 17 - Non-functional Requirements

| Requirement ID | Category | Non-Functional Requirement |
| --- | --- | --- |
| HIV.NFXNREQ.001 | Security - confidentiality | Provide password protected access for authorized users  |
| HIV.NFXNREQ.002 | Security - confidentiality | Provide a means to ensure confidentiality and privacy of personal health information |
| HIV.NFXNREQ.003 | Security - confidentiality | Provide ability for authorized users to view confidential data   |
| HIV.NFXNREQ.004 | Security - confidentiality | Anonymise data that is exported from the system |
| HIV.NFXNREQ.005 | Security - confidentiality | Prevent remembering username and password |
| HIV.NFXNREQ.006 | Security - confidentiality | Log out the user after specified time of inactivity |
| HIV.NFXNREQ.007 | Security - confidentiality | Provide encrypted communication between components |
| HIV.NFXNREQ.008 | Security - authentication | Notify the user to change their password the first time they log in |
| HIV.NFXNREQ.009 | Security - authentication | Adhere to complex password requirements |
| HIV.NFXNREQ.010 | Security - authentication | Provide a mechanism to securely change a user's password |
| HIV.NFXNREQ.011 | Security - authentication | Notify the user of password change to their account |
| HIV.NFXNREQ.012 | Security - authentication | Reset a user's password in a secure manner |
| HIV.NFXNREQ.013 | Security - authentication | Lock a user out after a specified number of wrong password attempts |
| HIV.NFXNREQ.014 | Security - authentication | Notify a user if their account is locked due to wrong password attempts |
| HIV.NFXNREQ.015 | Security - authentication | Provide role-based access to the system |
| HIV.NFXNREQ.016 | Security - audit trail and logs | Log system logins and logouts |
| HIV.NFXNREQ.017 | Security - audit trail and logs | Record all authentication violations |
| HIV.NFXNREQ.018 | Security - audit trail and logs | Log all activities performed by the user, including date and time stamp |
| HIV.NFXNREQ.019 | Security - audit trail and logs | Log access to views of individual client records |
| HIV.NFXNREQ.020 | Security - audit trail and logs | Log access to data summaries, reports, analysis and visualization features |
| HIV.NFXNREQ.021 | Security - audit trail and logs | Log exchange of data with other systems |
| HIV.NFXNREQ.022 | Security - audit trail and logs | Generate analysis of the usage of different system features and reports  |
| HIV.NFXNREQ.023 | Security - audit trail and logs | Log all data and system errors |
| HIV.NFXNREQ.024 | Security - user management | Allow user with permission to create a new user and temporary password |
| HIV.NFXNREQ.025 | Security - user management | Provide role-based access   |
| HIV.NFXNREQ.026 | Security - user management | Allow roles to be associated with specific geographical areas and/or health facilities |
| HIV.NFXNREQ.027 | Security - user management | Allow cascading user management and assignment of roles |
| HIV.NFXNREQ.028 | Security - user management | Allow user to change their own password |
| HIV.NFXNREQ.029 | Security - user management | Allow admin user to request password reset |
| HIV.NFXNREQ.030 | Security - user management | Notify the user to regularly change the user's password |
| HIV.NFXNREQ.031 | Security - user management | Allow each user to be assigned to one or more roles |
| HIV.NFXNREQ.032 | Security - user management | Support definitions of unlimited roles and assigned levels of access, viewing, entry, editing and auditing  |
| HIV.NFXNREQ.033 | System requirements - general | Provide a unique version number for each revision  |
| HIV.NFXNREQ.034 | System requirements - general | Enable earlier versions of a record to be recoverable |
| HIV.NFXNREQ.035 | System requirements - general | Enable deployment in an environment subject to power loss |
| HIV.NFXNREQ.036 | System requirements - general | Work in an environment that is subject to loss of connectivity |
| HIV.NFXNREQ.037 | System requirements - general | Generate IDs that are unique across different installations or sites |
| HIV.NFXNREQ.038 | System requirements - general | Report version number when saving data to the database |
| HIV.NFXNREQ.039 | System requirements - general | Be designed to be flexible enough to accommodate necessary changes in the future |
| HIV.NFXNREQ.040 | System requirements - general | Allow for offline and online functionality |
| HIV.NFXNREQ.041 | System requirements - general | Show the number of records that are not yet synchronised |
| HIV.NFXNREQ.042 | System requirements - general | Have ability to easily back up information |
| HIV.NFXNREQ.043 | System requirements - general | Warn user if no valid backup for more than a predefined number of days |
| HIV.NFXNREQ.044 | System requirements - general | Must have the ability to store images and other unstructured data |
| HIV.NFXNREQ.045 | System requirements - scalability | Scalable to accommodate new demands |
| HIV.NFXNREQ.046 | System requirements - scalability | Be able to accommodate at least [x number of] health facilities |
| HIV.NFXNREQ.047 | System requirements - scalability | Be able to accommodate at least [x number of] concurrent users |
| HIV.NFXNREQ.048 | System requirements - usability | Be user-friendly for people with low computer literacy |
| HIV.NFXNREQ.049 | System requirements - usability | Provide informative error messages and tooltips   |
| HIV.NFXNREQ.050 | System requirements - usability | Alert the user when navigating away from the form without saving |
| HIV.NFXNREQ.051 | System requirements - usability | Support real time data entry validation and feedback to prevent data entry errors from being recorded |
| HIV.NFXNREQ.052 | System requirements - usability | Simplify data recording through predefined drop-down or searchable lists, radio buttons, check boxes |
| HIV.NFXNREQ.053 | System requirements - usability | Support multiple languages |
| HIV.NFXNREQ.054 | System requirements - usability | Use industry standard user interface practices and apply them in a consistent manner throughout the system |
| HIV.NFXNREQ.055 | System requirements - usability | Easy to learn and intuitive to enable user to navigate between pages |
| HIV.NFXNREQ.056 | System requirements - usability | Provide guidance to the users to better support clinical guidelines and best clinical practices |
| HIV.NFXNREQ.057 | System requirements - usability | Be reliable and robust (minimize the number of system crashes) |
| HIV.NFXNREQ.058 | System requirements - usability | Adjust display to fit small screens (e.g. mobile phones) |
| HIV.NFXNREQ.059 | System requirements - configuration | Configure the system centrally |
| HIV.NFXNREQ.060 | System requirements - configuration | Configure business rules in line with guidelines and standard operating procedures (SOPs) |
| HIV.NFXNREQ.061 | System requirements - configuration | Configure error messages |
| HIV.NFXNREQ.062 | System requirements - configuration | Configure workflows and business rules to accommodate differences between facilities |
| HIV.NFXNREQ.063 | System requirements - interoperability | Communicate with external systems through mediators |
| HIV.NFXNREQ.064 | System requirements - interoperability | Provide access to data through application programming interfaces (APIs) |
| HIV.NFXNREQ.065 | System requirements - interoperability | Be interoperable with external systems through mediators |
| HIV.NFXNREQ.066 | System requirements - interoperability | Link with insurance systems to verify eligibility and submit claims |
| HIV.NFXNREQ.067 | System requirements - interoperability | Exchange data with other approved systems |
| HIV.NFXNREQ.068 | System requirements - interoperability | Accept data from multiple input methods including paper, geocoding (GPS) |
| HIV.NFXNREQ.069 | System requirements - hardware and connectivity | Allow for data exchange and efficient synchronization across multiple facilities and points of service when internet is available, even when it is intermittent and slow  |
