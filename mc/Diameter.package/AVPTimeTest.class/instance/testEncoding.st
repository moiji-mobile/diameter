tests
testEncoding
	| encoded |
	encoded := AVPTime encode: (DateAndTime year: 2017 month: 3 day: 9 hour: 15 minute: 54 second: 46 offset: 0 asDuration).
	self assert: encoded equals: #[16rDC 16r6B 16rF9 16r46].