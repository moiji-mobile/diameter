as yet unclassified
testHeader
	"Normal mode"
	self parse: '<Diameter-Header:123, REQ, PXY, ERR123>' rule: #header to: #('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>) end: 39.
	self parse: '<Diameter-Header:123, PXY>' rule: #header to: #('<Diameter-Header:' '123' nil ', PXY' nil '' $>) end: 26.

	"Quirk mode as found in the spec. First correct"
	self parse: '<Diameter-Header:9999999, REQ, PXY>' rule: #header to: #('<Diameter-Header:' '9999999' ', REQ' ', PXY' nil '' $>) end: 35.
	self parse: '< Diameter Header: 9999999, REQ, PXY >' rule: #header to: #(#($< 'Diameter' 'Header' $:) '9999999' ', REQ' ', PXY' nil '' $>) end: 38.

	"OTP mode"
	self parse: '< Diameter Header: code, ERR [PXY] >' rule: #header to: #(#($< 'Diameter' 'Header' $:) 'code' nil nil ', ERR [PXY]' '' $>) end: 36.