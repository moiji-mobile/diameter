as yet unclassified
decodeData: aByteArray type: aType
	| addr |
	addr := (aByteArray beginsWith: #[0 1])
		ifTrue: [ SocketAddress newFrom: (aByteArray allButFirst: 2) ]
		ifFalse: [ aByteArray allButFirst: 2 ].
		
	^self new
		avpType: aType;
		contents: addr;
		yourself.