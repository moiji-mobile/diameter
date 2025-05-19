Class {
	#name : 'OTPDiaDiameterMessageToken',
	#superclass : 'Object',
	#instVars : [
		'diameterHeader',
		'avps',
		'messageName'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaDiameterMessageToken >> avps: aCollection [
	avps := aCollection
]

{ #category : 'as yet unclassified' }
OTPDiaDiameterMessageToken >> diameterHeader: aHeader [ 
	diameterHeader := aHeader
]

{ #category : 'as yet unclassified' }
OTPDiaDiameterMessageToken >> messageName: aName [ 
	messageName := aName
]

{ #category : 'as yet unclassified' }
OTPDiaDiameterMessageToken >> optApplyOn: aModule [
	aModule addMessage: (DiameterMessageType new
		messageName: messageName;
		diameterCode: diameterHeader diameterCode;
		requestBit: diameterHeader requestBit;
		proxyBit: diameterHeader proxyBit;
		errorBit: diameterHeader errorBit;
		applicationId: diameterHeader applicationId;
		avps: (avps collect: [:each | aModule buildAvp: each]);
		yourself)
]
