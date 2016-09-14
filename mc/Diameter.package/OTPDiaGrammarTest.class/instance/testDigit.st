as yet unclassified
testDigit
	self parse: '0A' rule: #DIGIT to: $0 end: 1.
	self parse: '1A' rule: #DIGIT to: $1 end: 1.
	self parse: '2A' rule: #DIGIT to: $2 end: 1.
	self parse: '3A' rule: #DIGIT to: $3 end: 1.
	self parse: '4A' rule: #DIGIT to: $4 end: 1.
	self parse: '5A' rule: #DIGIT to: $5 end: 1.
	self parse: '6A' rule: #DIGIT to: $6 end: 1.
	self parse: '7A' rule: #DIGIT to: $7 end: 1.
	self parse: '8A' rule: #DIGIT to: $8 end: 1.
	self parse: '9A' rule: #DIGIT to: $9 end: 1.
	self fail: 'A' rule: #DIGIT.