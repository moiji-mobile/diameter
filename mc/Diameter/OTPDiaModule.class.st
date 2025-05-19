Class {
	#name : 'OTPDiaModule',
	#superclass : 'Object',
	#instVars : [
		'moduleId',
		'moduleName',
		'vendorId',
		'vendorName',
		'avpTypes',
		'messages',
		'dependencies'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaModule >> addAVPType: anAVPType [ 
	avpTypes add: anAVPType
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> addDependency: aModule named: aName [ 
	self dependencies at: aName ifAbsentPut: aModule
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> addMessage: aDiameterMessageType [ 
	messages add: aDiameterMessageType
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> avpTypeAt: aString [
	^self avpTypeAt: aString ifAbsent: [NotFoundError signal: 'AVP Type not found'].
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> avpTypeAt: aString ifAbsent: aBlockClosure [
	avpTypes detect: [:each | each avpName = aString ] ifFound: [:each | ^each ].

	aString = 'AVP' ifTrue: [
		^AVPType new
			avpBaseType: 'OctetString';
			avpName: 'AVP';
			yourself].

	"Go into the base directory"
	dependencies ifNotNil: [:modules |
		modules do: [:module |
			| type |
			type := module avpTypeAt: aString ifAbsent: [ ].
			type ifNotNil: [^type]]].

	^aBlockClosure value
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> avpTypeInvocationFor: aString [ 
	aString = #required ifTrue: [ ^AVPRequiredTypeInvocation ].
	aString = #optional ifTrue: [ ^AVPOptionalTypeInvocation ].
	aString = #fixed ifTrue: [ ^AVPFixedTypeInvocation ]
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> buildAvp: aCollection [ 
	| avp |
	avp := self avpTypeAt: aCollection second.
	
	^(self avpTypeInvocationFor: aCollection third) new
		avpType: avp;
		min: aCollection first min;
		max: aCollection first max;
		many: aCollection first many;
		yourself
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> decode: aDiameterMessage [ 
	aDiameterMessage messageType: (self findMessageType: aDiameterMessage).
	^aDiameterMessage
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> dependencies [
	^dependencies ifNil: [ dependencies := Dictionary new ]
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> findDescriptor: aCommandCode request: isRequest [
	^messages
		detect: [:each |
			((each isRequest = isRequest) and: [(each diameterCode = aCommandCode)])]
		ifNone: [NotFound signal: 'Command with code does not exist: ', aCommandCode displayString].
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> findMessageType: aDiameterMessage [ 
	^self findDescriptor: aDiameterMessage commandCode request: aDiameterMessage isRequest.
]

{ #category : 'initialization' }
OTPDiaModule >> initialize [
	super initialize.
	avpTypes := OrderedCollection new.
	messages := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> messageNamed: aName [
	^messages detect: [:each | each messageName = aName ]
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> moduleId: anInteger [ 
	moduleId := anInteger
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> moduleName: aString [ 
	moduleName := aString
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> parseFrom: aReadStream [ 
	| diameterMessage |
	diameterMessage := DiameterMessage parseFrom: aReadStream.
	diameterMessage messageType: (self findMessageType: diameterMessage).
	^diameterMessage
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> resolveType: anAVPType [ 
	self shouldBeImplemented.
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> vendorId: anInteger [ 
	vendorId := anInteger
]

{ #category : 'as yet unclassified' }
OTPDiaModule >> vendorName: aString [ 
	vendorName := aString
]
