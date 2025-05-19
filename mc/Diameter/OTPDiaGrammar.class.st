"
I parse the Ericsson Erlang OTP definition of a dia module. I got created by looking the file definition.
"
Class {
	#name : 'OTPDiaGrammar',
	#superclass : 'PPCompositeParser',
	#instVars : [
		'ALPHA',
		'DIGIT',
		'section',
		'comment',
		'id',
		'base_10_id',
		'base_16_id',
		'sectName',
		'prefix',
		'vendor',
		'blank',
		'avp_types',
		'avp_type',
		'diameter_name',
		'avp_basic_type',
		'avp_info',
		'messages',
		'message',
		'enum',
		'enum_field',
		'enum_field_name',
		'grouped',
		'group',
		'inherits',
		'avp_vendor_id'
	],
	#category : 'Diameter-Grammar',
	#package : 'Diameter',
	#tag : 'Grammar'
}

{ #category : 'avp_types' }
OTPDiaGrammar >> ALPHA [
	"ALPHA =  %x41-5A / %x61-7A   ; A-Z / a-z"
	"Probably matches more in terms of unicecode than this narrow definition
	of purse ASCII"
	^#letter asParser
]

{ #category : 'avp_types' }
OTPDiaGrammar >> DIGIT [
	"RFC5234
	A range of alternative numeric values can be specified compactly,
   using a dash ('-') to indicate the range of alternative values.
   Hence:
         DIGIT       =  %x30-39
   is equivalent to:
DIGIT = '0'/'1'/'2'/'3'/'4'/'5'/'6'/ '7' / '8' / '9'"
	^#digit asParser
]

{ #category : 'as yet unclassified' }
OTPDiaGrammar >> avpGrammarClass [
	^RFC6733AVPGrammarQuirk
]

{ #category : 'avp_types' }
OTPDiaGrammar >> avp_basic_type [
	^'Unsigned32' asParser / 'Unsigned64' asParser / 'Enumerated' asParser / 'UTF8String' asParser / 'OctetString' asParser / 'DiamIdent' asParser / 'DiameterIdentity' asParser / 'Time' asParser / 'Grouped' asParser / 'Address' asParser / 'DiamURI' asParser / 'Integer32' asParser / 'Integer64' asParser / 'IPFilterRule' asParser / 'DiameterURI' asParser / 'QoSFilterRule' asParser
]

{ #category : 'avp_types' }
OTPDiaGrammar >> avp_info [
	"AVP Flags and ignoring P"
	^($M asParser / $- asParser / $V asParser) plus
]

{ #category : 'avp_types' }
OTPDiaGrammar >> avp_type [
	^diameter_name trimSpaces, #digit asParser plus flatten trimSpaces, avp_basic_type trimSpaces, avp_info trimSpaces
]

{ #category : 'avp_types' }
OTPDiaGrammar >> avp_types [
	"@avp_types\n
	<blanks>
		<type1>
		<type2>
	"
	^'@avp_types' asParser trimBlanks trimSpaces,
		(comment / avp_type) trimBlanks trimSpaces plus
]

{ #category : 'grammar' }
OTPDiaGrammar >> avp_vendor_id [
	"@avp_vendor 1234567\n
	<blanks>
		<avp1>
		<avp2>
	"
	^'@avp_vendor_id' asParser trimSpaces, #digit asParser plus flatten trimSpaces trimBlanks,
		(comment / diameter_name) trimBlanks trimSpaces star
]

{ #category : 'id' }
OTPDiaGrammar >> base_10_id [
	"@id 0"
	^#digit asParser plus flatten
]

{ #category : 'id' }
OTPDiaGrammar >> base_16_id [
	"@id 0xFFF"
	^('0x' asParser, #hex asParser plus) flatten
]

{ #category : 'grammar' }
OTPDiaGrammar >> blank [
	self flag: #todo. "Rename selector to space"
	^#space asParser
]

{ #category : 'grammar' }
OTPDiaGrammar >> comment [
	"Parse ;; until the end of a line"
	| cr lf |
	cr := Character cr.
	lf := Character lf.
	^';;' asParser,
		(PPPredicateObjectParser anyExceptAnyOf: {lf. cr}) star flatten,
		(lf asParser / cr asParser).  
]

{ #category : 'avp_types' }
OTPDiaGrammar >> diameter_name [
	^(ALPHA / DIGIT / $- asParser) plus flatten
]

{ #category : 'enum' }
OTPDiaGrammar >> enum [

	^('@enum' asParser / '@define' asParser) trimSpaces, diameter_name trimSpaces trimBlanks,
		(comment / enum_field) trimBlanks trimSpaces plus
	
]

{ #category : 'enum' }
OTPDiaGrammar >> enum_field [
	^enum_field_name trimSpaces, (base_16_id / base_10_id)
]

{ #category : 'enum' }
OTPDiaGrammar >> enum_field_name [
	^((ALPHA / DIGIT / $' asParser), (ALPHA / DIGIT / $- asParser / $_ asParser / $. asParser / $: asParser / $( asParser / $) asParser / $, asParser) star, $' asParser optional) flatten
]

{ #category : 'grouped' }
OTPDiaGrammar >> group [
	"Parse the RFC6733 message here..."
	^self avpGrammarClass new productionAt: #grouped_avp_def
]

{ #category : 'grammar' }
OTPDiaGrammar >> grouped [
	"@grouped\n
	<blanks>
		<message1>
		<message2>
	"
	^'@grouped' asParser trimBlanks trimSpaces,
		(comment / group) trimBlanks trimSpaces plus
]

{ #category : 'id' }
OTPDiaGrammar >> id [
	^'@id' asParser trimSpaces, (base_16_id / base_10_id)
]

{ #category : 'inherits' }
OTPDiaGrammar >> inherits [
	"@inherits module_name Optional-Avp-Name Optional-Avp-Name"
	^'@inherits' asParser trimSpaces,
		(#word asParser / $- asParser / $_ asParser) star flatten trimSpaces,
		diameter_name flatten trimSpaces star 
]

{ #category : 'messages' }
OTPDiaGrammar >> message [
	"Parse the RFC6733 message here..."
	^self messageGrammarClass new productionAt: #command_def
]

{ #category : 'as yet unclassified' }
OTPDiaGrammar >> messageGrammarClass [
	^RFC6733MessageGrammarQuirk
]

{ #category : 'messages' }
OTPDiaGrammar >> messages [
	"@message\n
	<blanks>
		<message1>
		<message2>
	"
	^'@messages' asParser trimBlanks trimSpaces,
		(comment / message) trimBlanks trimSpaces plus
]

{ #category : 'as yet unclassified' }
OTPDiaGrammar >> prefix [
	^'@prefix' asParser trimSpaces, (#word asParser / $- asParser / $_ asParser) star flatten
]

{ #category : 'as yet unclassified' }
OTPDiaGrammar >> sectName [
	^'@name' asParser trimSpaces, (#word asParser / $- asParser / $_ asParser) star flatten
]

{ #category : 'as yet unclassified' }
OTPDiaGrammar >> section [
	^(comment / blank / id / inherits / sectName / prefix / vendor / avp_types / messages / enum / grouped / avp_vendor_id) trimBlanks
]

{ #category : 'as yet unclassified' }
OTPDiaGrammar >> start [
	^section plus end
]

{ #category : 'as yet unclassified' }
OTPDiaGrammar >> vendor [
	^'@vendor' asParser trimSpaces, #digit asParser plus flatten trimSpaces, #word asParser plus flatten
]
