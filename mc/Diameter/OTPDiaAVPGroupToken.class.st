Class {
	#name : 'OTPDiaAVPGroupToken',
	#superclass : 'Object',
	#instVars : [
		'avpName',
		'avps'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaAVPGroupToken >> avpName: aString [ 
	avpName := aString
]

{ #category : 'as yet unclassified' }
OTPDiaAVPGroupToken >> avps: aGroup [ 
	avps := aGroup
]

{ #category : 'as yet unclassified' }
OTPDiaAVPGroupToken >> optApplyOn: aModule [
	| avpType |
	avpType := aModule avpTypeAt: avpName.
	avpType avpBaseType = AVPGrouped ifFalse: [
		^self error: 'Base type should be grouped. Inconsistent'].
	avpType avpCode = avps avpCode ifFalse: [
		^self error: 'AVP code not consistent'].
	avpType
		avps: (avps avps collect: [:each | aModule buildAvp: each]).
]
