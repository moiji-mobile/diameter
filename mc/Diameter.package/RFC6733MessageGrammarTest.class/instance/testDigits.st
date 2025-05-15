tests
testDigits
		self parse: '01234A' rule: #digits to: '01234' end: 5.
		self parse: '01234A' rule: #digits to: '01234' end: 5.
		self fail: 'ABC' rule: #digits.