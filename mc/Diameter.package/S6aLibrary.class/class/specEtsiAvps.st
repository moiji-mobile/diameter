as yet unclassified
specEtsiAvps
	
	^ '@name	etsi-avps
@vendor	13019	etsi

@avp_types
Address-Realm                                	301      	OctetString         	V   
Logical-Access-ID                            	302      	OctetString         	V   
Transport-Class                              	311      	Unsigned32          	V   
Physical-Access-ID                           	313      	UTF8String          	V   
Location-Information                         	350      	Grouped             	V   
RACS-Contact-Point                           	351      	DiameterIdentity    	V   
Terminal-Type                                	352      	OctetString         	V   
Requested-Information                        	353      	Enumerated          	V   
Reservation-Class                            	456      	Unsigned32          	MV  
Reservation-Priority                         	458      	Enumerated          	V   
Media-Authorization-Context-ID               	462      	UTF8String          	V   
Line-Identifier                              	500      	OctetString         	V   

@avp_vendor_id	13019
Address-Realm
Logical-Access-ID
Location-Information
RACS-Contact-Point
Terminal-Type
Requested-Information
Line-Identifier
Physical-Access-ID
Reservation-Priority
Reservation-Class
Transport-Class
Media-Authorization-Context-ID

@grouped
Location-Information ::= <AVP Header: 350>
      [ Line-Identifier ]
  *   [ AVP ]

@enum Requested-Information
SUBSCRIBER_ID                                	0
LOCATION_INFORMATION                         	1
RACS_CONTACT_POINT                           	2
ACCESS_NETWORK_TYPE                          	3
TERMINAL_TYPE                                	4
LOGICAL_ACCESS_ID                            	5
PHYSICAL_ACCESS_ID                           	6
ACCESS_NETWORK_TYPE1                         	7
INITIAL_GATE_SETTING                         	8
QOS_PROFILE                                  	9
IP_CONNECTIVITY_STATUS                       	10

@enum Reservation-Priority
DEFAULT                                      	0
PRIORITY_1                                   	1
PRIORITY_2                                   	2
PRIORITY_3                                   	3
PRIORITY_4                                   	4
PRIORITY_5                                   	5
PRIORITY_6                                   	6
PRIORITY_7                                   	7
PRIORITY_8                                   	8
PRIORITY_9                                   	9
PRIORITY_10                                  	10
PRIORITY_11                                  	11
PRIORITY_12                                  	12
PRIORITY_13                                  	13
PRIORITY_14                                  	14
PRIORITY_15                                  	15

'