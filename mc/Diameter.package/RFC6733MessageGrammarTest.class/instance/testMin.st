tests
testMin
		self parse: '01234A' rule: #min to: '01234' end: 5.
		self parse: '01234A' rule: #min to: '01234' end: 5.
		self fail: 'ABC' rule: #min.