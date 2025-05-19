"
An OTPDiaGrammarTest is a test class for testing the behavior of OTPDiaGrammar
"
Class {
	#name : 'OTPDiaGrammarTest',
	#superclass : 'PPCompositeParserTest',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest class >> avpVendorIdExample [
	^String streamContents: [:str |
		str
			nextPutAll: '@avp_vendor_id 1234'; lf;
			nextPutAll: 'Realm-Foo'; lf;
			nextPutAll: 'Other-Ident' ]
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest class >> avpVendorIdTabExample [
	^String streamContents: [:str |
		str
			nextPutAll: '@avp_vendor_id'; nextPutAll: Character tab asString; nextPutAll: ' 1234'; lf;
			nextPutAll: 'Realm-Foo'; lf;
			nextPutAll: 'Other-Ident' ]
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest class >> exampleAvpType [
	^String streamContents: [:str |
		str
			nextPutAll: '@avp_types'; lf;
			lf;
			nextPutAll: '  ;; comment'; lf;
   			nextPutAll: '  Acct-Interim-Interval             85    Unsigned32    M'; lf;
   			nextPutAll: '	Accounting-Realtime-Required     483    Enumerated    M'; lf;
			yourself]
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest class >> exampleEnum [
	^String streamContents: [:str |
		str
			nextPutAll: '@enum Disconnect-Cause'; lf;
			lf;
			nextPutAll: '  '; lf;
			nextPutAll: ' ;; bla bla comment'; lf;
			nextPutAll: '   REBOOTING                      0'; lf;
			nextPutAll: '   BUSY                           1'; lf;
			nextPutAll: '   DO_NOT_WANT_TO_TALK_TO_YOU     2'; lf]
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest class >> exampleGrouped [
	^String streamContents: [:str |
		str
			nextPutAll: '@grouped'; lf;
			lf;
			nextPutAll: ' ;; comment'; lf;
			nextPutAll: '      Proxy-Info ::= < AVP Header: 284 >'; lf;
			nextPutAll: '                     { Proxy-Host }'; lf;
			nextPutAll: '                     { Proxy-State }'; lf;
			nextPutAll: '                   * [ AVP ]'; lf;
			lf;
			nextPutAll: '      Failed-AVP ::= < AVP Header: 279 >'; lf;
			nextPutAll: '                  1* {AVP}'; lf;
			lf;
			yourself]
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest class >> exampleMessage [
	^String streamContents: [:str |
		str
			nextPutAll: 'DPR ::= < Diameter Header: 282, REQ >'; lf;
         nextPutAll: ' { Origin-Host }'; lf;
         nextPutAll: ' { Origin-Realm }'; lf;
         nextPutAll: '{ Disconnect-Cause }'; lf;
         nextPutAll: ' * [ AVP ]'; lf]
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest class >> exampleMessages [
	^String streamContents: [:str |
		str
			nextPutAll: '@messages'; lf;
			nextPutAll: '  '; lf;
			lf;
			nextPutAll: ' ;; Some comment'; lf;
			nextPutAll: '      DWR ::= < Diameter Header: 280, REQ >'; lf;
			nextPutAll: '              { Origin-Host }'; lf;
			nextPutAll: '              { Origin-Realm }'; lf;
			nextPutAll: '              [ Origin-State-Id ]'; lf;
			nextPutAll: '            * [ AVP ]'; lf;
			lf;
			lf;
			nextPutAll: '      DWA ::= < Diameter Header: 280 >'; lf;
			nextPutAll: '              { Result-Code }'; lf;
			nextPutAll: '              { Origin-Host }'; lf;
			nextPutAll: '              { Origin-Realm }'; lf;
			nextPutAll: '              [ Error-Message ]'; lf;
			nextPutAll: '              [ Failed-AVP ]'; lf;
			nextPutAll: '              [ Origin-State-Id ]'; lf;
			nextPutAll: '            * [ AVP ]'; lf]
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest class >> upToAvpTypes [
	^String streamContents: [:str |
		str
			nextPutAll: ';; Copyright Ericsson AB 2013. All Rights Reserved.'; lf;
			nextPutAll: ';;'; lf;
			nextPutAll: ';; The contents of this file are subject to the Erlang Public License,'; lf;
			nextPutAll: ';; Version 1.1, (the "License"); you may not use this file except in'; lf;
			nextPutAll: ';; compliance with the License. You should have received a copy of the'; lf;
			nextPutAll: ';; Erlang Public License along with this software. If not, it can be'; lf;
			nextPutAll: ';; retrieved online at http://www.erlang.org/.'; lf;
			nextPutAll: ';;'; lf;
			nextPutAll: ';; Software distributed under the License is distributed on an "AS IS"'; lf;
			nextPutAll: ';; basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See'; lf;
			nextPutAll: ';; the License for the specific language governing rights and limitations'; lf;
			nextPutAll: ';; under the License.'; lf;
			nextPutAll: ';;'; lf;
			nextPutAll: ';; %CopyrightEnd%'; lf;
			nextPutAll: ';;'; lf;
			lf;
			nextPutAll: '@id 0'; lf;
			nextPutAll: '@name   diameter_gen_base_rfc6733'; lf;
			nextPutAll: '@prefix diameter_base'; lf;
			nextPutAll: '@vendor 0 IETF'; lf;
			yourself].
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> parserClass [
	^OTPDiaGrammar
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testALPHA [
	self fail: '0D' rule: #ALPHA.
	self fail: '' rule: #ALPHA.
	self parse: 'aA' rule: #ALPHA to: $a end: 1.
	self parse: 'zA' rule: #ALPHA to: $z end: 1.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testAvp_Basic_Type [
	self parse: 'Grouped' rule: #avp_basic_type to: 'Grouped' end: 7.
	self fail: 'BlaBlaType' rule: #avp_basic_type
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testAvp_Info [
	self parse: 'M' rule: #avp_info to: #($M) end: 1.
	self parse: '-' rule: #avp_info to: #($-) end: 1.
	self parse: 'MV' rule: #avp_info to: #($M $V) end: 2.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testAvp_Type [
	self
		parse: 'Acct-Interim-Interval             85    Unsigned32    M'
		rule: #avp_type
		to: #('Acct-Interim-Interval' '85' 'Unsigned32' #($M))
		end: 55.

	self
		parse: '  Acct-Interim-Interval             85    Unsigned32    M'
		rule: #avp_type
		to: #('Acct-Interim-Interval' '85' 'Unsigned32' #($M))
		end: 57.

	self
		parse: '   QoS-Filter-Rule                  407 QoSFilterRule    -'
		rule: #avp_type
		to: #('QoS-Filter-Rule' '407' 'QoSFilterRule' #($-))
		end: 58.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testAvp_Types [
	self
		parse: self class exampleAvpType
		rule: #avp_types
		to: {'@avp_types'. {
			{';;'. ' comment'. Character lf}.
			#('Acct-Interim-Interval' '85' 'Unsigned32' #($M)).
			#('Accounting-Realtime-Required' '483' 'Enumerated' #($M))}}
		end: 140.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testAvp_Vendor_id [

	self
		parse: self class avpVendorIdExample
		rule: #avp_vendor_id
		to: #('@avp_vendor_id' '1234' #('Realm-Foo' 'Other-Ident'))
		end: 41.

	self
		parse: self class avpVendorIdTabExample
		rule: #avp_vendor_id
		to: #('@avp_vendor_id' '1234' #('Realm-Foo' 'Other-Ident'))
		end: 42.

]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testBase_10_Id [
	self parse: '1234' rule: #base_10_id to: '1234' end: 4.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testBase_16_Id [
	self parse: '0xCAFE0123' rule: #base_16_id to: '0xCAFE0123' end: 10.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testComment [
	self
		parse: ';;123', Character lf asString, 'long long long long long'
		rule: #comment
		to: {';;'. '123'. Character lf}
		end: 6.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testDiameter_Name [
	self parse: 'Acct-Interim-Interval' rule: #diameter_name to: 'Acct-Interim-Interval' end: 21.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testDigit [
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
OTPDiaGrammarTest >> testEnum [
	self
		parse: self class exampleEnum
		rule: #enum
		to: {'@enum'. 'Disconnect-Cause'. {{';;'. ' bla bla comment'. Character lf}. #('REBOOTING' '0'). #('BUSY' '1'). #('DO_NOT_WANT_TO_TALK_TO_YOU' '2')}}
		end: 155.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testEnum_Field [
	self
		parse: '   MULTI_ROUND_AUTH            1001'
		rule: #enum_field
		to: #('MULTI_ROUND_AUTH' '1001')
		end: 35.

	self
		parse: '   MULTI_ROUND_AUTH            0x10CA'
		rule: #enum_field
		to: #('MULTI_ROUND_AUTH' '0x10CA')
		end: 37.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testEnum_Field_Name [
	self
		parse: 'MULTI_ROUND_AUTH'
		rule: #enum_field_name
		to: 'MULTI_ROUND_AUTH'
		end: 16.

	self
		parse: '''WIRELESS_802.11'''
		rule: #enum_field_name
		to: '''WIRELESS_802.11'''
		end: 17.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testFull [
	| res |
	res := self parse: self class upToAvpTypes.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testGrouped [
	self
		parse: self class exampleGrouped
		rule: #grouped
		to: {'@grouped'. {{';;'. ' comment'. Character lf}. #(nil 'Proxy-Info' nil '::=' #(#($< 'AVP Header:' '284' nil $>) #() #(#(nil ${ 'Proxy-Host' $}) #(nil ${ 'Proxy-State' $}) #(#(nil $* nil) $[ 'AVP' $])))). #(nil 'Failed-AVP' nil '::=' #(#($< 'AVP Header:' '279' nil $>) #() #(#(#('1' $* nil) ${ 'AVP' $}))))}}
		end: 235.
		
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testId [
	self parse: '@id 123' rule: #id to: #('@id' '123') end: 7.
	self parse: '@id 0x1' rule: #id to: #('@id' '0x1') end: 7.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testInherits [
	self
		parse: '@inherits abc_def'
		rule: #inherits
		to: #('@inherits' 'abc_def' #())
		end: 17.
	self
		parse: '@inherits abc_def Foo-1 Foo-2'
		rule: #inherits
		to: #('@inherits' 'abc_def' #('Foo-1' 'Foo-2'))
		end: 29.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testMessage [
	self
		parse: self class exampleMessage
		rule: #message
		to: #(nil 'DPR' nil '::=' #(#(#($< 'Diameter' 'Header' $:) '282' ', REQ' nil nil nil $>) #() #(#(nil ${ 'Origin-Host' $}) #(nil ${ 'Origin-Realm' $}) #(nil ${ 'Disconnect-Cause' $}) #(#(nil $* nil) $[ 'AVP' $]))))
		end: 105.
		
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testMessages [
	self
		parse: self class exampleMessages
		rule: #messages
		to: {'@messages'. {{';;'. ' Some comment'. Character lf}. #(nil 'DWR' nil '::=' #(#(#($< 'Diameter' 'Header' $:) '280' ', REQ' nil nil nil $>) #() #(#(nil ${ 'Origin-Host' $}) #(nil ${ 'Origin-Realm' $}) #(nil $[ 'Origin-State-Id' $]) #(#(nil $* nil) $[ 'AVP' $])))). #(nil 'DWA' nil '::=' #(#(#($< 'Diameter' 'Header' $:) '280' nil nil nil nil $>) #() #(#(nil ${ 'Result-Code' $}) #(nil ${ 'Origin-Host' $}) #(nil ${ 'Origin-Realm' $}) #(nil $[ 'Error-Message' $]) #(nil $[ 'Failed-AVP' $]) #(nil $[ 'Origin-State-Id' $]) #(#(nil $* nil) $[ 'AVP' $]))))}}
		end: 441.
		
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testPrefix [
	self
		parse: '@prefix diameter_base'
		rule: #prefix
		to: #('@prefix' 'diameter_base')
		end: 21.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testSectName [
	self
		parse: '@name   diameter_gen_base_rfc6733'
		rule: #sectName
		to: #('@name' 'diameter_gen_base_rfc6733')
		end: 33.
]

{ #category : 'as yet unclassified' }
OTPDiaGrammarTest >> testVendor [
	self
		parse: '@vendor 0 IETF'
		rule: #vendor
		to: #('@vendor' '0' 'IETF')
		end: 14.
]
