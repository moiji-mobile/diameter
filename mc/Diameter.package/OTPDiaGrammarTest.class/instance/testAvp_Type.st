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

	self
		parse: '   QoS-Filter-Rule                  407 QoSFilterRule    -'
		rule: #avp_type
		to: #('QoS-Filter-Rule' '407' 'QoSFilterRule' #($-))
		end: 58.