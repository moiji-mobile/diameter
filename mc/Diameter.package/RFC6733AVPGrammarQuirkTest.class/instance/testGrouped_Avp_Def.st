as yet unclassified
testGrouped_Avp_Def
	self parse: '<Avp-Name> ::= <AVP-Header: 666><AVP1>1*2{AVP2}[AVP3]' rule: #grouped_avp_def to: #($< 'Avp-Name' $> '::=' #(#($< 'AVP-Header:' '666' nil $>) #(#(nil $< 'AVP1' $>)) #(#(#('1' $* '2') ${ 'AVP2' $}) #(nil $[ 'AVP3' $])))) end: 53.
	
	"Omit <Avp-Name>"
	self parse: 'Avp-Name ::= <AVP-Header: 666><AVP1>1*2{AVP2}[AVP3]' rule: #grouped_avp_def to: #(nil 'Avp-Name' nil '::=' #(#($< 'AVP-Header:' '666' nil $>) #(#(nil $< 'AVP1' $>)) #(#(#('1' $* '2') ${ 'AVP2' $}) #(nil $[ 'AVP3' $])))) end: 51.