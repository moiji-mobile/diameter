Extension { #name : 'WriteStream' }

{ #category : '*diameter-stream' }
WriteStream >> nextPutInteger24: anInteger [ 
	self
		nextPut: ((anInteger bitShift: -16) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift:  -8) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift:   0) bitAnd: 16rFF).
]

{ #category : '*diameter-stream' }
WriteStream >> nextPutInteger32: anInteger [
	self
		nextPut: ((anInteger bitShift: -24) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift: -16) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift:  -8) bitAnd: 16rFF);
		nextPut: ((anInteger bitShift:   0) bitAnd: 16rFF).
]
