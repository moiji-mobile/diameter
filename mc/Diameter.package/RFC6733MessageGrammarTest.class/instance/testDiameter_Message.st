tests
testDiameter_Message
	"This is the BNF as specified. Notice the missing spaces"
	self parse: '<Diameter-Header:123, REQ, PXY, ERR123><AVP1><AVP2>{AVP1}{AVP2}[AVP1][AVP2]' rule: #diameter_message to: #(   
	#('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>)
	#( #(nil $< 'AVP1' $>) #(nil $< 'AVP2' $>))
	#( #(nil ${ 'AVP1' $}) #(nil ${ 'AVP2' $}))
	#( #(nil $[ 'AVP1' $]) #(nil $[ 'AVP2' $])) ) end: 75.

	self parse: '<Diameter-Header:123, REQ, PXY, ERR123><AVP1><AVP2>{AVP1}{AVP2}12*15[AVP1][AVP2]' rule: #diameter_message to: #(   
	#('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>)
	#( #(nil $< 'AVP1' $>) #(nil $< 'AVP2' $>))
	#( #(nil ${ 'AVP1' $}) #(nil ${ 'AVP2' $}))
	#( #(#('12' $* '15') $[ 'AVP1' $]) #(nil $[ 'AVP2' $])) ) end: 80.