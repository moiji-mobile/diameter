tests
testHeader
	"This is the BNF as specified. Notice the missing spaces"
	self parse: '<Diameter-Header:123, REQ, PXY, ERR123>' rule: #header to: #('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>) end: 39.
	self parse: '<Diameter-Header:123, PXY>' rule: #header to: #('<Diameter-Header:' '123' nil ', PXY' nil nil $>) end: 26.