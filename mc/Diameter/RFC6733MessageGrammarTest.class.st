"
A RFC6733GrammarTest is a test class for testing the behavior of RFC6733Grammar
"
Class {
	#name : 'RFC6733MessageGrammarTest',
	#superclass : 'PPCompositeParserTest',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> parserClass [
	^RFC6733MessageGrammar
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testALPHA [
	self fail: '0D' rule: #ALPHA.
	self fail: '' rule: #ALPHA.
	self parse: 'aA' rule: #ALPHA to: $a end: 1.
	self parse: 'zA' rule: #ALPHA to: $z end: 1.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testApplication_Id [
		self parse: '01234A' rule: #application_id to: '01234' end: 5.
		self parse: '01234A' rule: #application_id to: '01234' end: 5.
		self fail: 'ABC' rule: #application_id.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testAvp_Name [
	self parse: 'Hello-World' rule: #avp_spec to: 'Hello-World' end: 11.
	self parse: 'AVP' rule: #avp_spec to: 'AVP' end: 3.
	self fail: '0Hello-World' rule: #avp_spec.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testAvp_Spec [
	self parse: 'Hello-World' rule: #avp_spec to: 'Hello-World' end: 11.
	self parse: 'AVP' rule: #avp_spec to: 'AVP' end: 3.
	self fail: '0Hello-World' rule: #avp_spec.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testCommand_Def [

	"This is the BNF as specified. Notice the missing spaces"
	self parse: '<bla>::=<Diameter-Header:123, REQ, PXY, ERR123><AVP1><AVP2>{AVP1}{AVP2}[AVP1][AVP2]' rule: #command_def to: #(
	$< 'bla' $> '::='
	#(#('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>)
	#( #(nil $< 'AVP1' $>) #(nil $< 'AVP2' $>))
	#( #(nil ${ 'AVP1' $}) #(nil ${ 'AVP2' $}))
	#( #(nil $[ 'AVP1' $]) #(nil $[ 'AVP2' $])))) end: 83.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testCommand_Id [
		self parse: '01234A' rule: #command_id to: '01234' end: 5.
		self parse: '01234A' rule: #command_id to: '01234' end: 5.
		self fail: 'ABC' rule: #command_id.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testCommand_name [
	self parse: 'Example-Request' rule: #command_name to: 'Example-Request' end: 15.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testDiameter_Message [
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
]

{ #category : 'tests-as yet unclassified' }
RFC6733MessageGrammarTest >> testDiameter_name [
	self parse: 'Example-Request' rule: #diameter_name to: 'Example-Request' end: 15.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testDigit [
	self parse: '0A' rule: #DIGIT to: $0 end: 1.
	self parse: '1A' rule: #DIGIT to: $1 end: 1.
	self parse: '2A' rule: #DIGIT to: $2 end: 1.
	self parse: '3A' rule: #DIGIT to: $3 end: 1.
	self parse: '4A' rule: #DIGIT to: $4 end: 1.
	self parse: '5A' rule: #DIGIT to: $5 end: 1.
	self parse: '6A' rule: #DIGIT to: $6 end: 1.
	self parse: '7A' rule: #DIGIT to: $7 end: 1.
	self parse: '8A' rule: #DIGIT to: $8 end: 1.
	self parse: '9A' rule: #DIGIT to: $9 end: 1.
	self fail: 'A' rule: #DIGIT.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testDigits [
		self parse: '01234A' rule: #digits to: '01234' end: 5.
		self parse: '01234A' rule: #digits to: '01234' end: 5.
		self fail: 'ABC' rule: #digits.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testE_Bit [
	self parse: ', ERR' rule: #e_bit to: ', ERR' end: 5.
	self fail: ',  ERR' rule: #e_bit.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testFixed [
	self parse: '<AVP>' rule: #fixed to: #(nil $< 'AVP' $>) end: 5.
	self parse: '*<AVP>' rule: #fixed to: #(#(nil $* nil) $< 'AVP' $>) end: 6.
	self parse: '*2<AVP>' rule: #fixed to: #(#(nil $* '2') $< 'AVP' $>) end: 7.
	self parse: '1*3<AVP>' rule: #fixed to: #(#('1' $* '3') $< 'AVP' $>) end: 8.

	"whitespace extension"
	self parse: ' * < AVP > ' rule: #fixed to: #(#(nil $* nil) $< 'AVP' $>) end: 11.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testHeader [
	"This is the BNF as specified. Notice the missing spaces"
	self parse: '<Diameter-Header:123, REQ, PXY, ERR123>' rule: #header to: #('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>) end: 39.
	self parse: '<Diameter-Header:123, PXY>' rule: #header to: #('<Diameter-Header:' '123' nil ', PXY' nil nil $>) end: 26.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testMax [
		self parse: '01234A' rule: #max to: '01234' end: 5.
		self parse: '01234A' rule: #max to: '01234' end: 5.
		self fail: 'ABC' rule: #max.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testMin [
		self parse: '01234A' rule: #min to: '01234' end: 5.
		self parse: '01234A' rule: #min to: '01234' end: 5.
		self fail: 'ABC' rule: #min.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testOptional [
	self parse: '[AVP]' rule: #optional to: #(nil $[ 'AVP' $]) end: 5.
	self parse: '*[AVP]' rule: #optional to: #(#(nil $* nil) $[ 'AVP' $]) end: 6.
	self parse: '*2[AVP]' rule: #optional to: #(#(nil $* '2') $[ 'AVP' $]) end: 7.
	self parse: '1*3[AVP]' rule: #optional to: #(#('1' $* '3') $[ 'AVP' $]) end: 8.

	"whitespace extension"
	self parse: ' * [ AVP ] ' rule: #optional to: #(#(nil $* nil) $[ 'AVP' $]) end: 11.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testP_Bit [
	self parse: ', PXY' rule: #p_bit to: ', PXY' end: 5.
	self fail: ',  PXY' rule: #p_bit.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testQual [
	self parse: '*' rule: #qual to: #(nil $* nil) end: 1.
	self parse: '*10' rule: #qual to: #(nil $* '10') end: 3.
]

{ #category : 'accessing' }
RFC6733MessageGrammarTest >> testRBit [
	self parse: ', REQ' rule: #r_bit to: ', REQ' end: 5.
	self fail: ',  REQ' rule: #r_bit.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testR_Bit [
	self parse: ', REQ' rule: #r_bit to: ', REQ' end: 5.
	self fail: ',  REQ' rule: #r_bit.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testRequired [
	self parse: '{AVP}' rule: #required to: #(nil ${ 'AVP' $}) end: 5.
	self parse: '*{AVP}' rule: #required to: #(#(nil $* nil) ${ 'AVP' $}) end: 6.
	self parse: '*2{AVP}' rule: #required to: #(#(nil $* '2') ${ 'AVP' $}) end: 7.
	self parse: '1*3{AVP}' rule: #required to: #(#('1' $* '3') ${ 'AVP' $}) end: 8.

	"whitespace extension"
	self parse: ' * { AVP } ' rule: #required to: #(#(nil $* nil) ${ 'AVP' $}) end: 11.
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarTest >> testStart [

	"This is the BNF as specified. Notice the missing spaces"
	| res |
	res := self parse: '<bla>::=<Diameter-Header:123, REQ, PXY, ERR123><AVP1><AVP2>{AVP1}{AVP2}[AVP1][AVP2]'.
	self assert: res equals: #(
	$< 'bla' $> '::='
	#(#('<Diameter-Header:' '123' ', REQ' ', PXY' ', ERR' '123' $>)
	#( #(nil $< 'AVP1' $>) #(nil $< 'AVP2' $>))
	#( #(nil ${ 'AVP1' $}) #(nil ${ 'AVP2' $}))
	#( #(nil $[ 'AVP1' $]) #(nil $[ 'AVP2' $]))))
]
