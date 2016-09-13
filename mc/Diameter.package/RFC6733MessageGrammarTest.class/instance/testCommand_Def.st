as yet unclassified
testCommand_Def

	"This is the BNF as specified. Notice the missing spaces"
	self parse: '<bla>::=<Diameter-Header:123, REQ, PXY, ERR123><AVP1><AVP2>{AVP1}{AVP2}[AVP1][AVP2]' rule: #command_def to: #(
	$< 'bla' $> '::='
	#(#('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>)
	#( #(nil $< 'AVP1' $>) #(nil $< 'AVP2' $>))
	#( #(nil ${ 'AVP1' $}) #(nil ${ 'AVP2' $}))
	#( #(nil $[ 'AVP1' $]) #(nil $[ 'AVP2' $])))) end: 83.