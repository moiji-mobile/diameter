tests
testEnum_Field
	self
		parse: '   MULTI_ROUND_AUTH            1001'
		rule: #enum_field
		to: #('MULTI_ROUND_AUTH' '1001')
		end: 35.

	self
		parse: '   MULTI_ROUND_AUTH            0x10CA'
		rule: #enum_field
		to: #('MULTI_ROUND_AUTH' '0x10CA')
		end: 37.