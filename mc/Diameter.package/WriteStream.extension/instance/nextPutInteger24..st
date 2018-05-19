*diameter-stream
nextPutInteger24: anInteger 
	self
		nextPut: ((anInteger bitShift: -16) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift:  -8) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift:   0) bitAnd: 16rFF).