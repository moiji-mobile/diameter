Class {
	#name : 'AVPUnsigned64',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPUnsigned64 class >> decodeData: aByteArray type: aType [ 
	^self new
		avpType: aType;
		contents: (aByteArray unsignedLongLongAt: 1 bigEndian: true);
		yourself.
]

{ #category : 'converting' }
AVPUnsigned64 class >> encode: anInteger [ 
	^(ByteArray new: 8)
		unsignedLongLongAt: 1 put: anInteger bigEndian: true;
		yourself
]

{ #category : 'as yet unclassified' }
AVPUnsigned64 class >> verify: aByteArrayOrNumber [
	^true
]
