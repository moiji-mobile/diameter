Class {
	#name : 'AVPType',
	#superclass : 'Object',
	#instVars : [
		'avpName',
		'avpCode',
		'avpBaseType',
		'flagMandatory',
		'flagVendor',
		'typeDefines',
		'vendorId'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
AVPType >> addDefine: aString value: anInteger [ 
	self typeDefines at: aString put: anInteger
]

{ #category : 'as yet unclassified' }
AVPType >> avpBaseType [
	^ avpBaseType
]

{ #category : 'as yet unclassified' }
AVPType >> avpBaseType: aType [
	self flag: #todo. "Resolve that to a Base class that can read and write?"
	avpBaseType := aType
]

{ #category : 'accessing' }
AVPType >> avpCode [
	^ avpCode
]

{ #category : 'as yet unclassified' }
AVPType >> avpCode: anInteger [ 
	avpCode := anInteger
]

{ #category : 'as yet unclassified' }
AVPType >> avpFlagFromCharacter: aCharacter [ 
	aCharacter = $- ifTrue: [ ^self ].
	aCharacter = $M ifTrue: [ ^self beMandatory ].
	aCharacter = $V ifTrue: [ ^self beVendor ].
	^self error: 'Unknown avp info flag'
]

{ #category : 'as yet unclassified' }
AVPType >> avpFlagString [
	^String streamContents: [:str |
		str nextPut: (flagMandatory
							ifTrue: [ $M ]
							ifFalse: [
								flagVendor
									ifTrue: [ $V ]
									ifFalse: [ $-  ] ])]
]

{ #category : 'as yet unclassified' }
AVPType >> avpName [
	^ avpName
]

{ #category : 'as yet unclassified' }
AVPType >> avpName: aString [ 
	avpName := aString
]

{ #category : 'as yet unclassified' }
AVPType >> beMandatory [
	flagMandatory := true
]

{ #category : 'as yet unclassified' }
AVPType >> beVendor [
	flagVendor := true
]

{ #category : 'as yet unclassified' }
AVPType >> decodeData: aByteArray type: anObject [
	^avpBaseType decodeData: aByteArray type: self.
]

{ #category : 'as yet unclassified' }
AVPType >> hasVendorFlag [
	^flagVendor
]

{ #category : 'as yet unclassified' }
AVPType >> initialize [
	super initialize.
	flagVendor := false.
	flagMandatory := false.
]

{ #category : 'as yet unclassified' }
AVPType >> newContents: anObject [
	^(avpBaseType with: anObject)
		avpType: self;
		yourself.
]

{ #category : 'as yet unclassified' }
AVPType >> newDefaultValue [
	^ avpBaseType new
		avpType: self;
		yourself
]

{ #category : 'as yet unclassified' }
AVPType >> newHeader [
	^AVPHeader new
		avpCode: avpCode;
		avpFlagProtected: false;
		avpFlagMandatory: flagMandatory;
		avpFlagVendor: vendorId notNil;
		avpVendorId: vendorId;
		yourself.
]

{ #category : 'as yet unclassified' }
AVPType >> optApplyOn: aModule [ 
	aModule addAVPType: self
]

{ #category : 'as yet unclassified' }
AVPType >> printOn: aStream [
	aStream
		nextPutAll: '<AVP ';
		nextPutAll: avpName;
		nextPutAll: ' ';
		nextPutAll: avpCode displayString;
		nextPutAll: ' ';
		nextPutAll: avpBaseType displayString;
		nextPutAll: ' ';
		nextPutAll: self avpFlagString;
		nextPutAll: '>'
]

{ #category : 'as yet unclassified' }
AVPType >> typeDefines [
	^typeDefines ifNil: [ typeDefines := Dictionary new ]
]

{ #category : 'as yet unclassified' }
AVPType >> vendorId: aNumber [
	vendorId := aNumber
]

{ #category : 'as yet unclassified' }
AVPType >> verify: avpHeader [ 
	avpBaseType verify: avpHeader avpData.
]
