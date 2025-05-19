Class {
	#name : 'AVPEnumerated',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPEnumerated class >> decodeData: aByteArray type: aType [
	^ self new
		contents: (aType typeDefines keyAtValue: aByteArray asInteger);
		avpType: aType;
		yourself
]

{ #category : 'as yet unclassified' }
AVPEnumerated class >> encode: anInteger [ 
	^anInteger asByteArrayOfSize: 4
]

{ #category : 'as yet unclassified' }
AVPEnumerated class >> verify: aByteArrayOrInteger [ 
	^true
]

{ #category : 'as yet unclassified' }
AVPEnumerated >> encodedData [
	^self class encode: (avpType typeDefines at: contents) 
]
