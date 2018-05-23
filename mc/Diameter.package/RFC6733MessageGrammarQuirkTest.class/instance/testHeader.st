as yet unclassified
testHeader
	"Normal mode"
	self parse: '<Diameter-Header:123, REQ, PXY, ERR123>' rule: #header to: #('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>) end: 39.
	self parse: '<Diameter-Header:123, PXY>' rule: #header to: #('<Diameter-Header:' '123' nil ', PXY' nil nil $>) end: 26.

	"Quirk mode as found in the spec. First correct"
	self parse: '<Diameter-Header:9999999, REQ, PXY>' rule: #header to: #('<Diameter-Header:' '9999999' ', REQ' ', PXY' nil nil $>) end: 35.
	self parse: '< Diameter Header: 9999999, REQ, PXY >' rule: #header to: #(#($< 'Diameter' 'Header' $:) '9999999' ', REQ' ', PXY' nil nil $>) end: 38.

	"OTP mode"
	self parse: '< Diameter Header: code, ERR [PXY] >' rule: #header to: #(#($< 'Diameter' 'Header' $:) 'code' nil nil ', ERR [PXY]' nil $>) end: 36.
	
	"Wrong application id..."
	self parse: '< Diameter Header: code, ERR [PXY], 1234 >' rule: #header to: #(#($< 'Diameter' 'Header' $:) 'code' nil nil ', ERR [PXY]' '1234' $>) end: 42.
	self parse: '< Diameter Header: code, ERR [PXY] 1234 >' rule: #header to: #(#($< 'Diameter' 'Header' $:) 'code' nil nil ', ERR [PXY]' '1234' $>) end: 41.