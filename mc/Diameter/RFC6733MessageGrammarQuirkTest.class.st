Class {
	#name : 'RFC6733MessageGrammarQuirkTest',
	#superclass : 'RFC6733MessageGrammarTest',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirkTest class >> exampleRequest [
	^String streamContents: [:str |
		str
			nextPutAll: 'Example-Request ::= < Diameter Header: 9999999, REQ, PXY >'; lf;
			nextPutAll: ' { User-Name }'; lf;
			nextPutAll: ' 1* { Origin-Host }'; lf;
         nextPutAll: ' * [ AVP ] '; lf].
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirkTest class >> otpAnswerMessage [
	^String streamContents: [:str |
		str
			nextPutAll: 'answer-message ::= < Diameter Header: code, ERR [PXY] >'; lf;
			nextPutAll: '0*1 < Session-Id >'; lf;
         nextPutAll: '{ Origin-Host }'; lf;
         nextPutAll: '{ Origin-Realm }'; lf;
         nextPutAll: '{ Result-Code }'; lf;
         nextPutAll: '[ Origin-State-Id ]'; lf;
         nextPutAll: '[ Error-Message ]'; lf;
         nextPutAll: '[ Error-Reporting-Host ]'; lf;
         nextPutAll: '[ Failed-AVP ]'; lf;
         nextPutAll: '[ Experimental-Result ]'; lf;
         nextPutAll: '* [ Proxy-Info ]'; lf;
         nextPutAll: '* [ AVP ]'; lf;
			yourself
	]
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirkTest >> parserClass [
	^RFC6733MessageGrammarQuirk
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirkTest >> testExampleRequest [
	| res |
	res := self parse: self class exampleRequest.
	self assert: res equals: #(
		nil 'Example-Request' nil '::='
		#(
			#( #($< 'Diameter' 'Header' $:) '9999999' ', REQ' ', PXY' nil nil $>)
			#()
			#( #(nil ${ 'User-Name' $} ) #( #('1' $* nil) ${ 'Origin-Host' $} )
			   #( #( nil $* nil) $[ 'AVP' $]) )
		))
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirkTest >> testHeader [
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
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirkTest >> testOtpQuirk [
	| res |
	res := self parse: self class otpAnswerMessage
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirkTest >> testQual [
	self parse: '*' rule: #qual to: #(nil $* nil) end: 1.
	self parse: '*10' rule: #qual to: #(nil $* '10') end: 3.

	"Test quirk"
	self parse: ' * ' rule: #qual to: #(nil $* nil) end: 3.
	self parse: ' 1*' rule: #qual to: #('1' $* nil) end: 3.
]
