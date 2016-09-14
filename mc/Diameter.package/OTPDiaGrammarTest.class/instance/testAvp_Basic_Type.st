as yet unclassified
testAvp_Basic_Type
	self parse: 'Grouped' rule: #avp_basic_type to: 'Grouped' end: 7.
	self fail: 'BlaBlaType' rule: #avp_basic_type