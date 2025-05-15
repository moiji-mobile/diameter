tests
testAvp_Info
	self parse: 'M' rule: #avp_info to: #($M) end: 1.
	self parse: '-' rule: #avp_info to: #($-) end: 1.
	self parse: 'MV' rule: #avp_info to: #($M $V) end: 2.