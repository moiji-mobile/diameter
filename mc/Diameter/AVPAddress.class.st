Class {
	#name : 'AVPAddress',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPAddress class >> decodeData: aByteArray type: aType [
	| addr |
	addr := (aByteArray beginsWith: #[0 1])
		ifTrue: [ SocketAddress newFrom: (aByteArray allButFirst: 2) ]
		ifFalse: [ aByteArray allButFirst: 2 ].
		
	^self new
		avpType: aType;
		contents: addr;
		yourself.
]

{ #category : 'as yet unclassified' }
AVPAddress class >> encode: aSocketAddress [
	"TODO(zecke): Remove hardcoded IPv4 family string once Pharo has IPv6 support"
	^ (aSocketAddress size = 4)
		ifTrue: [ #[0 1] , aSocketAddress ]
		ifFalse: [ #[0 2], aSocketAddress ].
]

{ #category : 'as yet unclassified' }
AVPAddress class >> verify: anAVPAddress [ 
	^true
]
