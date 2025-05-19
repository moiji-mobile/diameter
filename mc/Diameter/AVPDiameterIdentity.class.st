Class {
	#name : 'AVPDiameterIdentity',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPDiameterIdentity class >> decodeData: aByteArray type: aType [
	^self new
		avpType: aType;
		contents: aByteArray utf8Decoded;
		yourself
]

{ #category : 'as yet unclassified' }
AVPDiameterIdentity class >> encode: aString [ 
	^aString utf8Encoded
]

{ #category : 'as yet unclassified' }
AVPDiameterIdentity class >> verify: aByteArrayOrString [
	^true
]
