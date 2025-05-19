Class {
	#name : 'AVPUTF8String',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPUTF8String class >> decodeData: aByteArray type: aType [
	^self new
		contents: aByteArray utf8Decoded;
		avpType: aType;
		yourself
]

{ #category : 'as yet unclassified' }
AVPUTF8String class >> encode: aString [ 
	^aString asUTF8Bytes
]

{ #category : 'as yet unclassified' }
AVPUTF8String class >> verify: aByteArrayOrString [ 
	^true
]
