tests
testULAnswerQuerying
	| message |
	message := DiameterMessage
		decode: self class updateLocationAnswerSample.
	self class s6aParser decode: message.
	message decodeAll.
	self
		assert: (message avpsPath / 'Auth-Session-State') value first value = 1.
	self
		assert:
			(message avpsPath / 'Authentication-Info' / 'E-UTRAN-Vector' / 'AUTN')
				value first value
				= #[86 24 113 202 134 104 185 185 166 31 213 146 105 155 17 135]