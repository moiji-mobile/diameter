Class {
	#name : 'AVPWriter',
	#superclass : 'Object',
	#instVars : [
		'avpHeader',
		'avpType'
	],
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPWriter class >> on: anAvpHeader type: aType [
	^self new
		avpHeader: anAvpHeader;
		avpType: aType;
		yourself.	
]

{ #category : 'as yet unclassified' }
AVPWriter >> avpHeader: anAVPHeader [ 
	avpHeader := anAVPHeader
]

{ #category : 'as yet unclassified' }
AVPWriter >> avpType: aTypeInvocation [ 
	avpType := aTypeInvocation.
]

{ #category : 'as yet unclassified' }
AVPWriter >> contents: anObject [
	| content |
	content := avpType newContents: anObject.
	avpHeader avpData: content.
]

{ #category : 'as yet unclassified' }
AVPWriter >> contentsWith: aBlock [
	| content |
	content := avpType newDefaultValue.
	aBlock value: content.
	avpHeader avpData: content
]
