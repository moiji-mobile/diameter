Class {
	#name : 'AVPEncoderTestBase',
	#superclass : 'TestCase',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
AVPEncoderTestBase class >> isAbstract [
	^super isAbstract or: [ self == AVPEncoderTestBase ].
]

{ #category : 'testing' }
AVPEncoderTestBase class >> shouldInheritSelectors [
	^true
]

{ #category : 'as yet unclassified' }
AVPEncoderTestBase >> encoderClass [
	^self subclassResponsibility
]

{ #category : 'as yet unclassified' }
AVPEncoderTestBase >> roundtripData [
	^self subclassResponsibility
]

{ #category : 'tests' }
AVPEncoderTestBase >> testRoundtrip [
	| encodedData |
	self roundtripData do: [:each |
		| decodedData |
		self assert: (self encoderClass verify: each first).
		decodedData := self encoderClass decodeData: each first type: nil.
		self assert: decodedData class equals: self encoderClass.
		self assert: (self encoderClass verify: decodedData value).

		self assert: decodedData value equals: each second.
		encodedData := self encoderClass encode: decodedData value.
		self assert: encodedData equals: each first.
	]
]
