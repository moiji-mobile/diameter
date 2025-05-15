tests
testId
	self parse: '@id 123' rule: #id to: #('@id' '123') end: 7.
	self parse: '@id 0x1' rule: #id to: #('@id' '0x1') end: 7.