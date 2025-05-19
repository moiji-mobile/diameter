Class {
	#name : 'AVPInteger64',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPInteger64 class >> decodeData: aByteArray type: aType [ 
	^self new
		avpType: aType;
		contents: (aByteArray longlongAt: 1 bigEndian: true);
		yourself.
]

{ #category : 'converting' }
AVPInteger64 class >> encode: anInteger [ 
	^(ByteArray new: 8)
		longlongAt: 1 put: anInteger bigEndian: true; 
		yourself
]

{ #category : 'as yet unclassified' }
AVPInteger64 class >> verify: aByteArrayOrNumber [
	^true
]
