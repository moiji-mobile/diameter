Class {
	#name : 'AVPInteger32',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPInteger32 class >> decodeData: aByteArray type: aType [ 
	^self new
		avpType: aType;
		contents: (aByteArray longAt: 1 bigEndian: true);
		yourself.
]

{ #category : 'converting' }
AVPInteger32 class >> encode: anInteger [ 
	^(ByteArray new: 4)
		longAt: 1 put: anInteger bigEndian: true; 
		yourself
]

{ #category : 'as yet unclassified' }
AVPInteger32 class >> verify: aByteArrayOrNumber [
	^true
]
