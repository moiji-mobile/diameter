as yet unclassified
testAvp_Type
	self
		parse: 'Acct-Interim-Interval             85    Unsigned32    M'
		rule: #avp_type
		to: #('Acct-Interim-Interval' '85' 'Unsigned32' #($M))
		end: 55.

	self
		parse: '  Acct-Interim-Interval             85    Unsigned32    M'
		rule: #avp_type
		to: #('Acct-Interim-Interval' '85' 'Unsigned32' #($M))
		end: 57.