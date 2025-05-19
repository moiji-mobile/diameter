Class {
	#name : 'AVPGroupType',
	#superclass : 'AVPType',
	#instVars : [
		'avps'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
AVPGroupType >> avps [
	^ avps
]

{ #category : 'accessing' }
AVPGroupType >> avps: aCollection [
	avps := aCollection
]

{ #category : 'as yet unclassified' }
AVPGroupType >> newValue [
	^AVPGrouped new
		avpType: self;
		yourself
]

{ #category : 'as yet unclassified' }
AVPGroupType >> verify: avpHeader [
	| parsedAvps |
	parsedAvps := avpHeader avpData avpHeaders.
	DiameterMessage validate: avps avps: parsedAvps asOrderedCollection copy.

]
