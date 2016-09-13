as yet unclassified
testStart

	"This is the BNF as specified. Notice the missing spaces"
	| res |
	res := self parse: '<bla>::=<Diameter-Header:123, REQ, PXY, ERR123><AVP1><AVP2>{AVP1}{AVP2}[AVP1][AVP2]'.
	self assert: res equals: #(
	$< 'bla' $> '::='
	#(#('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>)
	#( #(nil $< 'AVP1' $>) #(nil $< 'AVP2' $>))
	#( #(nil ${ 'AVP1' $}) #(nil ${ 'AVP2' $}))
	#( #(nil $[ 'AVP1' $]) #(nil $[ 'AVP2' $]))))