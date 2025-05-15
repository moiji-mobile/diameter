tests
testAvp
	self parse: '<AVP-Header: 666><AVP1>1*2{AVP2}[AVP3]' rule: #avp to: #(
#($< 'AVP-Header:' '666' nil $>)
#(#(nil $< 'AVP1' $>))
#(#(#('1' $* '2') ${ 'AVP2' $}))
#(#(nil $[ 'AVP3' $]))
	) end: 38.