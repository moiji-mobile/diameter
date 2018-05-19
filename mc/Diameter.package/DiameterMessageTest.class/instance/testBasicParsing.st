tests
testBasicParsing
	| diameter data |
	diameter := DiameterMessage parseFrom: self class diameterCreditControl readStream.
	self assert: diameter isRequest.
	self assert: diameter isProxyable.
	self deny: diameter isError.
	self deny: diameter isPotentialRetransmit.
	self assert: diameter commandCode equals: 272.
	self assert: diameter applicationId equals: 16777238.
	self assert: diameter hopByHopId equals: 16r2c0001c7.
	self assert: diameter endToEndId equals: 16r93c4269e.
	self assert: diameter avps size equals: 30.

	data := ByteArray streamContents: [:str |
		diameter encodeOn: str].
	self assert: data equals: self class diameterCreditControl.