Class {
	#name : 'AVPGrouped',
	#superclass : 'AVPBaseType',
	#traits : 'AVPBuilderTrait',
	#classTraits : 'AVPBuilderTrait classTrait',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPGrouped class >> decodeData: aByteArray type: aType [ 
	| stream parsedAvps |
	stream := aByteArray readStream.
	parsedAvps := OrderedCollection new.
	[ stream atEnd ] whileFalse: [
		parsedAvps add: (AVPHeader parseFrom: stream)].
	aType avps do: [:type |
		type parse: parsedAvps].
	^self new
		avpType: aType;
		contents: parsedAvps;
		yourself.
]

{ #category : 'as yet unclassified' }
AVPGrouped class >> encode: avps [ 
	^ByteArray streamContents: [:str |
		avps do: [:avp |
			avp encodeOn: str ]].
]

{ #category : 'as yet unclassified' }
AVPGrouped >> / aName [
	^ self avpsPath / aName
]

{ #category : 'as yet unclassified' }
AVPGrouped >> addAvp: anAvp [
	contents add: anAvp.
]

{ #category : 'as yet unclassified' }
AVPGrouped >> avpHeaders [
	^contents
]

{ #category : 'as yet unclassified' }
AVPGrouped >> avpTypeAvps [
	^avpType avps
]

{ #category : 'as yet unclassified' }
AVPGrouped >> avpsPath [

	^ AVPPath on: self avpHeaders
]

{ #category : 'initialization' }
AVPGrouped >> initialize [
	super initialize.
	contents := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
AVPGrouped >> messageAvps [
	^contents
]
