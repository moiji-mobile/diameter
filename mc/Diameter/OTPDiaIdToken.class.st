Class {
	#name : 'OTPDiaIdToken',
	#superclass : 'Object',
	#instVars : [
		'id'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaIdToken >> id: anInteger [ 
	id := anInteger
]

{ #category : 'as yet unclassified' }
OTPDiaIdToken >> otpApplyOn: aModule [ 
	aModule moduleId: id.
]
