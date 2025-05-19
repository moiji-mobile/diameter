Class {
	#name : 'AVPTimeTest',
	#superclass : 'AVPEncoderTestBase',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
AVPTimeTest >> encoderClass [
	^AVPTime
]

{ #category : 'as yet unclassified' }
AVPTimeTest >> roundtripData [
	^{
		{ #[16rDC 16r6B 16rF9 16r46].
	 	 DateAndTime year: 2017 month: 3 day: 9 hour: 15 minute: 54 second: 46 offset: 0 asDuration.
		}.
	}
]

{ #category : 'tests' }
AVPTimeTest >> testDecoding [
	| dateTime |
	dateTime := AVPTime decodeData: #[16rDC 16r6B 16rF9 16r46]  type: nil.
	self assert: dateTime value year equals: 2017.
	self assert: dateTime value month equals: 3.
	self assert: dateTime value dayOfMonth equals: 9.
	self assert: dateTime value hour equals: 15.
	self assert: dateTime value minute equals: 54.
	self assert: dateTime value seconds equals: 46.
	self assert: dateTime value offset asSeconds equals: 0.

]

{ #category : 'tests' }
AVPTimeTest >> testEncoding [
	| encoded |
	encoded := AVPTime encode: (DateAndTime year: 2017 month: 3 day: 9 hour: 15 minute: 54 second: 46 offset: 0 asDuration).
	self assert: encoded equals: #[16rDC 16r6B 16rF9 16r46].
]
