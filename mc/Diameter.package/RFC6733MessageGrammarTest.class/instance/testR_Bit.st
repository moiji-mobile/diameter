as yet unclassified
testR_Bit
	self parse: ', REQ' rule: #r_bit to: ', REQ' end: 5.
	self fail: ',  REQ' rule: #r_bit.