Class {
	#name : 'DiameterMessage',
	#superclass : 'Object',
	#traits : 'AVPBuilderTrait',
	#classTraits : 'AVPBuilderTrait classTrait',
	#instVars : [
		'flagRequest',
		'flagProxyable',
		'flagError',
		'flagRetransmit',
		'commandCode',
		'applicationId',
		'hopByHopId',
		'endToEndId',
		'avps',
		'messageType'
	],
	#category : 'Diameter-AVP-Base',
	#package : 'Diameter',
	#tag : 'AVP-Base'
}

{ #category : 'parsing' }
DiameterMessage class >> decode: aByteArray [

	^ self parseFrom: aByteArray readStream 
]

{ #category : 'parsing' }
DiameterMessage class >> parseFrom: aReadStream [
	| version length data |
	version := aReadStream next.
	length := aReadStream uint24.
	data := (aReadStream next: length - 4) readStream.
	^self basicNew
		diameterFlags: data next;
		commandCode: data uint24;
		applicationId: data uint32;
		hopByHopId: data uint32;
		endToEndId: data uint32;
		parseAvps: data.
]

{ #category : 'as yet unclassified' }
DiameterMessage class >> validate: descriptor avps: avps [ 
	descriptor do: [:type |
		type verifyAvps: avps].

	descriptor hasGenericAVP ifFalse: [
		avps isEmpty ifFalse: [
			^self error: 'Non parsed AVPs']].
]

{ #category : 'internal' }
DiameterMessage >> addAvp: anAvp [ 
	avps add: anAvp
]

{ #category : 'as yet unclassified' }
DiameterMessage >> applicationId [
	^ applicationId
]

{ #category : 'as yet unclassified' }
DiameterMessage >> applicationId: anInteger [ 
	applicationId := anInteger
]

{ #category : 'as yet unclassified' }
DiameterMessage >> asEncodedMessage [
	^ByteArray streamContents: [:str | self encodeOn: str ]
]

{ #category : 'as yet unclassified' }
DiameterMessage >> avpTypeAvps [
	^messageType avps
]

{ #category : 'as yet unclassified' }
DiameterMessage >> avps [
	^ avps
]

{ #category : 'as yet unclassified' }
DiameterMessage >> avpsPath [

	^ AVPPath on: avps 
]

{ #category : 'as yet unclassified' }
DiameterMessage >> buildFlags [
	^
		(flagRequest asBit << 7) |
		(flagProxyable asBit << 6) |
		(flagError asBit << 5) |
		(flagRetransmit asBit << 4)
]

{ #category : 'as yet unclassified' }
DiameterMessage >> commandCode [
	^ commandCode
]

{ #category : 'as yet unclassified' }
DiameterMessage >> commandCode: anInteger [ 
	commandCode := anInteger
]

{ #category : 'as yet unclassified' }
DiameterMessage >> decodeAll [
	"Extract all encoded ByteArray's to their native types"
	messageType avps do: [:type |
		type parse: avps].
]

{ #category : 'as yet unclassified' }
DiameterMessage >> diameterFlags: anInteger [ 
	flagRequest := (anInteger bitAt: 8) == 1.
	flagProxyable := (anInteger bitAt: 7) == 1.
	flagError := (anInteger bitAt: 6) == 1.
	flagRetransmit := (anInteger bitAt: 5) == 1.
]

{ #category : 'as yet unclassified' }
DiameterMessage >> encodeOn: aWriteStream [ 
	| encodedAvps |
	encodedAvps := ByteArray streamContents: [:str |
		avps do: [:each | each encodeOn: str ] ].

	aWriteStream
		nextPut: 16r01;
		nextPutInteger24: 20 + encodedAvps size;
		nextPut: self buildFlags;
		nextPutInteger24: commandCode;
		nextPutInteger32: applicationId;
		nextPutInteger32: hopByHopId;
		nextPutInteger32: endToEndId;
		nextPutAll: encodedAvps.
]

{ #category : 'as yet unclassified' }
DiameterMessage >> endToEndId [
	^ endToEndId
]

{ #category : 'as yet unclassified' }
DiameterMessage >> endToEndId: anInteger [ 
	endToEndId := anInteger.
]

{ #category : 'as yet unclassified' }
DiameterMessage >> flagProxyable: aBoolean [ 
	flagProxyable := aBoolean
]

{ #category : 'as yet unclassified' }
DiameterMessage >> flagRequest: aBoolean [ 
	flagRequest := aBoolean
]

{ #category : 'as yet unclassified' }
DiameterMessage >> hopByHopId [
	^ hopByHopId
]

{ #category : 'as yet unclassified' }
DiameterMessage >> hopByHopId: anInteger [ 
	hopByHopId := anInteger
]

{ #category : 'as yet unclassified' }
DiameterMessage >> initializeMessage [
	avps := OrderedCollection new.
	flagRequest := flagProxyable := flagError := flagRetransmit := false.
	hopByHopId := endToEndId := 0.
]

{ #category : 'as yet unclassified' }
DiameterMessage >> isError [
	^flagError
]

{ #category : 'as yet unclassified' }
DiameterMessage >> isPotentialRetransmit [
	^flagRetransmit
]

{ #category : 'as yet unclassified' }
DiameterMessage >> isProxyable [
	^flagProxyable
]

{ #category : 'as yet unclassified' }
DiameterMessage >> isRequest [
	^flagRequest
]

{ #category : 'as yet unclassified' }
DiameterMessage >> messageAvps [
	^avps
]

{ #category : 'as yet unclassified' }
DiameterMessage >> messageType: aMessage [ 
	messageType := aMessage
]

{ #category : 'as yet unclassified' }
DiameterMessage >> parseAvps: aReadStream [
	avps := OrderedCollection new.
	[aReadStream atEnd] whileFalse: [
		avps add: (AVPHeader parseFrom: aReadStream).
	].
]

{ #category : 'validation' }
DiameterMessage >> validate [
	| copiedAvps |
	"TODO(zecke): Check commandCode/applicationId/bits.."
	copiedAvps := avps copy.
	self class validate: messageType avps avps: copiedAvps.
]
