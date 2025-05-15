tests
testHeader
	self parse: '<AVP-Header: 666>' rule: #header to: #($< 'AVP-Header:' '666' nil $>) end: 17.
	self parse: '<AVP-Header: 666 23>' rule: #header to: #($< 'AVP-Header:' '666' '23' $>) end: 20.