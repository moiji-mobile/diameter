tests
testULRNestedDecode
	| message |
	message := DiameterMessage
		decode: self class updateLocationRequestSample.
	self class s6aParser decode: message.
	message decodeAll.
	self assert: (message avpsPath / 'Route-Record') size equals: 4.
	self
		assert: (message avpsPath / 'Route-Record') value first value
		equals: 'katdsr.epc.mnc006.mcc260.3gppnetwork.org'.
	self
		assert: (message avpsPath / 'User-Name') value first value
		equals: '310840800002042'.
	self
		assert: (message avpsPath / 'Visited-PLMN-Id') value first value
		equals: #[98 240 96]