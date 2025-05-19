"
A RFC6733AVPGrammarTest is a test class for testing the behavior of RFC6733AVPGrammar
"
Class {
	#name : 'RFC6733AVPGrammarTest',
	#superclass : 'PPCompositeParserTest',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarTest >> parserClass [
	^RFC6733AVPGrammar
]

{ #category : 'tests-as yet unclassified' }
RFC6733AVPGrammarTest >> testAvp [
	self parse: '<AVP-Header: 666><AVP1>1*2{AVP2}[AVP3]' rule: #avp to: #(
#($< 'AVP-Header:' '666' nil $>)
#(#(nil $< 'AVP1' $>))
#(#(#('1' $* '2') ${ 'AVP2' $}))
#(#(nil $[ 'AVP3' $]))
	) end: 38.
]

{ #category : 'tests-as yet unclassified' }
RFC6733AVPGrammarTest >> testAvpcode [
	self parse: '1234A' rule: #avpcode to: '1234' end: 4.
]

{ #category : 'tests-as yet unclassified' }
RFC6733AVPGrammarTest >> testGrouped_Avp_Def [
	self parse: '<Avp-Name> ::= <AVP-Header: 666><AVP1>1*2{AVP2}[AVP3]' rule: #grouped_avp_def to: #($< 'Avp-Name' $> '::=' #(#($< 'AVP-Header:' '666' nil $>) #(#(nil $< 'AVP1' $>)) #(#(#('1' $* '2') ${ 'AVP2' $})) #(#(nil $[ 'AVP3' $])))) end: 53.
]

{ #category : 'tests-as yet unclassified' }
RFC6733AVPGrammarTest >> testHeader [
	self parse: '<AVP-Header: 666>' rule: #header to: #($< 'AVP-Header:' '666' nil $>) end: 17.
	self parse: '<AVP-Header: 666 23>' rule: #header to: #($< 'AVP-Header:' '666' '23' $>) end: 20.
]

{ #category : 'tests-as yet unclassified' }
RFC6733AVPGrammarTest >> testName [
	self parse: 'Abc-Def/' rule: #name to: 'Abc-Def' end: 7. 
]

{ #category : 'tests-as yet unclassified' }
RFC6733AVPGrammarTest >> testName_Fmt [
	self parse: 'Abc-Def/' rule: #name_fmt to: 'Abc-Def' end: 7. 
]

{ #category : 'tests-as yet unclassified' }
RFC6733AVPGrammarTest >> testVendor [
	self parse: '1234A' rule: #vendor to: '1234' end: 4.
]
