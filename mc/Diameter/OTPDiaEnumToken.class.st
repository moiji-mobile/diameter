Class {
	#name : 'OTPDiaEnumToken',
	#superclass : 'Object',
	#instVars : [
		'typeIsDefine',
		'avpTypeName',
		'enumValues'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaEnumToken >> avpTypeName: aString [ 
	avpTypeName := aString
]

{ #category : 'as yet unclassified' }
OTPDiaEnumToken >> enumValues: defines [ 
	enumValues := defines
]

{ #category : 'as yet unclassified' }
OTPDiaEnumToken >> otpApplyOn: aModule [
	| avpType |
	avpType := aModule avpTypeAt: avpTypeName.
	enumValues do: [:each |
		avpType addDefine: each first value: each second]
]

{ #category : 'accessing' }
OTPDiaEnumToken >> typeAsString: aString [
	typeIsDefine := aString ~= '@enum'
]
