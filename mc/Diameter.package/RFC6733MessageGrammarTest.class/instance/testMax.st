tests
testMax
		self parse: '01234A' rule: #max to: '01234' end: 5.
		self parse: '01234A' rule: #max to: '01234' end: 5.
		self fail: 'ABC' rule: #max.