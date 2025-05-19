Class {
	#name : 'AVPOctetString',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPOctetString class >> decodeData: aByteArray type: aType [ 
	^self new
		avpType: aType;
		contents: aByteArray;
		yourself
]

{ #category : 'as yet unclassified' }
AVPOctetString class >> encode: aByteArray [
	^aByteArray
]

{ #category : 'as yet unclassified' }
AVPOctetString class >> verify: aByteArrayOrString [
	^true
]
