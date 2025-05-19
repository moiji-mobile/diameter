Class {
	#name : 'OTPDiaInheritToken',
	#superclass : 'Object',
	#instVars : [
		'parsed',
		'moduleName'
	],
	#category : 'Diameter-Parser-Token',
	#package : 'Diameter',
	#tag : 'Parser-Token'
}

{ #category : 'as yet unclassified' }
OTPDiaInheritToken >> moduleName: aName [
	moduleName := aName
]

{ #category : 'as yet unclassified' }
OTPDiaInheritToken >> otpApplyOn: aModule [
	| module |
	module := OTPDiaModule new.
	parsed do: [:each | each otpApplyOn: module ].
	aModule addDependency: module named: moduleName.
]

{ #category : 'as yet unclassified' }
OTPDiaInheritToken >> parsed: aCollection [ 
	parsed := aCollection
]
