as yet unclassified
testAvp_Info
	self parse: 'M' rule: #avp_info to: $M end: 1.
	self parse: '-' rule: #avp_info to: $- end: 1.