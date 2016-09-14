as yet unclassified
testALPHA
	self fail: '0D' rule: #ALPHA.
	self fail: '' rule: #ALPHA.
	self parse: 'aA' rule: #ALPHA to: $a end: 1.
	self parse: 'zA' rule: #ALPHA to: $z end: 1.