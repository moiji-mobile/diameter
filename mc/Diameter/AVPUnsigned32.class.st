Class {
	#name : 'AVPUnsigned32',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPUnsigned32 class >> decodeData: aByteArray type: aType [ 
	^self new
		avpType: aType;
		contents: (aByteArray unsignedLongAt: 1 bigEndian: true);
		yourself.
]

{ #category : 'as yet unclassified' }
AVPUnsigned32 class >> encode: anInteger [ 
	^(ByteArray new: 4)
		unsignedLongAt: 1 put: anInteger bigEndian: true;
		yourself
]

{ #category : 'as yet unclassified' }
AVPUnsigned32 class >> verify: aByteArrayOrNumber [
	^true 
	
]
