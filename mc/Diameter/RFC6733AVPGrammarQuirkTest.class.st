Class {
	#name : 'RFC6733AVPGrammarQuirkTest',
	#superclass : 'RFC6733AVPGrammarTest',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirkTest class >> exampleAvp [
	^String streamContents: [:str |
		str
			nextPutAll: 'Example-AVP  ::= < AVP Header: 999999 >'; lf;
         nextPutAll: '  { Origin-Host }'; lf;
         nextPutAll: '1*{ Session-Id }'; lf;
         nextPutAll: ' *[ AVP ]'; lf;
			yourself]
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirkTest class >> mip6AgentInfo [
	^String streamContents: [:stream |
		stream
			nextPutAll: 'MIP6-Agent-Info ::= <AVP Header: 486>'; lf;
			nextPutAll: '  * 2 [ MIP-Home-Agent-Address ]'; lf;
			nextPutAll: '      [ MIP-Home-Agent-Host ]'; lf;
			nextPutAll: '      [ MIP6-Home-Link-Prefix ]'; lf;
			nextPutAll: '  *   [ AVP ]'
	 ]
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirkTest class >> rfcProxyInfo [
	^String streamContents: [:str |
		str
			nextPutAll: 'Proxy-Info ::= < AVP Header: 284 >'; lf;
			nextPutAll: ' { Proxy-Host }'; lf;
			nextPutAll: ' { Proxy-State }'; lf;
         nextPutAll: ' * [ AVP ]'; lf;
			yourself]
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirkTest >> parserClass [
	^RFC6733AVPGrammarQuirk
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirkTest >> testExampleAvp [
	| res |
	res := self parse: self class exampleAvp.
	self assert: res equals: #(nil 'Example-AVP' nil '::=' #(#($< 'AVP Header:' '999999' nil $>) #() #(#(nil ${ 'Origin-Host' $}) #(#('1' $* nil) ${ 'Session-Id' $}) #(#(nil $* nil) $[ 'AVP' $])))).

]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirkTest >> testGrouped_Avp_Def [
	self parse: '<Avp-Name> ::= <AVP-Header: 666><AVP1>1*2{AVP2}[AVP3]' rule: #grouped_avp_def to: #($< 'Avp-Name' $> '::=' #(#($< 'AVP-Header:' '666' nil $>) #(#(nil $< 'AVP1' $>)) #(#(#('1' $* '2') ${ 'AVP2' $}) #(nil $[ 'AVP3' $])))) end: 53.
	
	"Omit <Avp-Name>"
	self parse: 'Avp-Name ::= <AVP-Header: 666><AVP1>1*2{AVP2}[AVP3]' rule: #grouped_avp_def to: #(nil 'Avp-Name' nil '::=' #(#($< 'AVP-Header:' '666' nil $>) #(#(nil $< 'AVP1' $>)) #(#(#('1' $* '2') ${ 'AVP2' $}) #(nil $[ 'AVP3' $])))) end: 51.
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirkTest >> testHeader [
	self parse: '<AVP-Header: 666>' rule: #header to: #($< 'AVP-Header:' '666' nil $>) end: 17.
	self parse: '<AVP-Header: 666 23>' rule: #header to: #($< 'AVP-Header:' '666' '23' $>) end: 20.

	"Quirk handling"
	self parse: '< AVP Header: 666 23>' rule: #header to: #($< 'AVP Header:' '666' '23' $>) end: 21.
	self parse: '< AVP Header: 284 >' rule: #header to: #($< 'AVP Header:' '284' nil $>) end: 19.
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirkTest >> testMIP6AgentInfo [
	| res |
	res := self parse: self class mip6AgentInfo.
	self assert: res equals: #(nil 'MIP6-Agent-Info' nil '::=' #(#($< 'AVP Header:' '486' nil $>) #() #(#(#(nil $* '2') $[ 'MIP-Home-Agent-Address' $]) #(nil $[ 'MIP-Home-Agent-Host' $]) #(nil $[ 'MIP6-Home-Link-Prefix' $]) #(#(nil $* nil) $[ 'AVP' $])))).
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirkTest >> testParseProxyInfo [
	| res |
	res := self parse: self class rfcProxyInfo.
	self assert: res equals: #(nil 'Proxy-Info' nil '::=' #(#($< 'AVP Header:' '284' nil $>) #() #(#(nil ${ 'Proxy-Host' $}) #(nil ${ 'Proxy-State' $}) #(#(nil $* nil) $[ 'AVP' $])))).
]
