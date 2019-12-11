tests
testULRequestQuerying
	| message |
	message := DiameterMessage
		decode: self class updateLocationRequestSample.
	self class s6aParser decode: message.
	message decodeAll.
	self assert: (message avpsPath / 'Route-Record') size = 4.
	self
		assert:
			(message avpsPath / 'Route-Record') value first value
				= 'katdsr.epc.mnc006.mcc260.3gppnetwork.org'.
	self
		assert: (message avpsPath / 'User-Name') value first value = '310840800002042'.
	self
		assert:
			(message avpsPath / 'Visited-PLMN-Id') value first value
				= #[98 240 96].
				
	self assert: (message avpsPath / 'Requested-EUTRAN-Authentication-Info' / 'Number-Of-Requested-Vectors') value first value = 1