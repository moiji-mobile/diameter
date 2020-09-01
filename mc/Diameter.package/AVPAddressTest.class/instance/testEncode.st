as yet unclassified
testEncode
	| data |
	data := AVPAddress encode: (SocketAddress fromDottedString: '127.0.0.1').
	self assert: data equals: #[0 1 127 0 0 1].