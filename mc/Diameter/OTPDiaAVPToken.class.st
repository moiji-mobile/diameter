Class {
	#name : 'OTPDiaAVPToken',
	#superclass : 'Object',
	#instVars : [
		'avpCode',
		'avps'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaAVPToken >> avpCode [
	^ avpCode
]

{ #category : 'as yet unclassified' }
OTPDiaAVPToken >> avpCode: anInteger [ 
	avpCode := anInteger
]

{ #category : 'as yet unclassified' }
OTPDiaAVPToken >> avps [
	^ avps
]

{ #category : 'as yet unclassified' }
OTPDiaAVPToken >> avps: aCollection [
	avps := aCollection
]
