tests
testEnum_Field_Name
	self
		parse: 'MULTI_ROUND_AUTH'
		rule: #enum_field_name
		to: 'MULTI_ROUND_AUTH'
		end: 16.

	self
		parse: '''WIRELESS_802.11'''
		rule: #enum_field_name
		to: '''WIRELESS_802.11'''
		end: 17.