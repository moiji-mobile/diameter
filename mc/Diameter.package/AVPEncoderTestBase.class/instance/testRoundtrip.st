tests
testRoundtrip
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