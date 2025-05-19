Class {
	#name : 'AVPAddressTest',
	#superclass : 'AVPEncoderTestBase',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
AVPAddressTest >> encoderClass [
	^ AVPAddress
]

{ #category : 'as yet unclassified' }
AVPAddressTest >> roundtripData [
	^ Array
		with: { #[0 1 127 0 0 1]. SocketAddress newFrom: #[127 0 0 1]. }
]

{ #category : 'as yet unclassified' }
AVPAddressTest >> testEncode [
	| data |
	data := AVPAddress encode: (SocketAddress fromDottedString: '127.0.0.1').
	self assert: data equals: #[0 1 127 0 0 1].
]
