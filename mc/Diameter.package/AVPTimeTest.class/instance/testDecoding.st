tests
testDecoding
	| dateTime |
	dateTime := AVPTime decodeData: #[16rDC 16r6B 16rF9 16r46]  type: nil.
	self assert: dateTime value year equals: 2017.
	self assert: dateTime value month equals: 3.
	self assert: dateTime value dayOfMonth equals: 9.
	self assert: dateTime value hour equals: 15.
	self assert: dateTime value minute equals: 54.
	self assert: dateTime value seconds equals: 46.
	self assert: dateTime value offset asSeconds equals: 0.
