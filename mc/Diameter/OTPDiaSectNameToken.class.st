Class {
	#name : 'OTPDiaSectNameToken',
	#superclass : 'Object',
	#instVars : [
		'name'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaSectNameToken >> name: aName [ 
	name := aName
]

{ #category : 'as yet unclassified' }
OTPDiaSectNameToken >> otpApplyOn: aModule [ 
	aModule moduleName: name
]
