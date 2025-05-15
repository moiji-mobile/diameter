tests
testP_Bit
	self parse: ', PXY' rule: #p_bit to: ', PXY' end: 5.
	self fail: ',  PXY' rule: #p_bit.