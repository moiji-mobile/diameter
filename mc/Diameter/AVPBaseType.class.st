Class {
	#name : 'AVPBaseType',
	#superclass : 'Object',
	#instVars : [
		'avpType',
		'contents'
	],
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPBaseType class >> with: anObject [ 
	^self new
		contents: anObject;
		yourself
]

{ #category : 'evaluating' }
AVPBaseType >> avpType [
	^ avpType
]

{ #category : 'as yet unclassified' }
AVPBaseType >> avpType: anAVPType [ 
	avpType := anAVPType
]

{ #category : 'as yet unclassified' }
AVPBaseType >> contents: aString [ 
	contents := aString
]

{ #category : 'as yet unclassified' }
AVPBaseType >> encodedData [
	^self class encode: contents
]

{ #category : 'evaluating' }
AVPBaseType >> value [
	^contents
]
