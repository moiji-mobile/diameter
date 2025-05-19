"
I represent BNF rules that are in both the messages and avp-group definition
"
Class {
	#name : 'RFC6733BaseGrammar',
	#superclass : 'PPCompositeParser',
	#instVars : [
		'ALPHA',
		'DIGIT',
		'digits',
		'min',
		'max',
		'qual',
		'diameter_name',
		'avp_spec',
		'fixed',
		'required',
		'optional'
	],
	#category : 'Diameter-Grammar',
	#package : 'Diameter',
	#tag : 'Grammar'
}

{ #category : 'as yet unclassified' }
RFC6733BaseGrammar >> ALPHA [
	"ALPHA =  %x41-5A / %x61-7A   ; A-Z / a-z"
	"Probably matches more in terms of unicecode than this narrow definition
	of purse ASCII"
	^#letter asParser
]

{ #category : 'RFC5234' }
RFC6733BaseGrammar >> DIGIT [
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
RFC6733BaseGrammar >> avp_spec [
	"The avp-spec has to be an AVP Name, defined
    in the base or extended Diameter
    specifications."
	^diameter_name
]

{ #category : 'as yet unclassified' }
RFC6733BaseGrammar >> diameter_name [
	^(ALPHA, (ALPHA / DIGIT / $- asParser) star) flatten
]

{ #category : 'digits' }
RFC6733BaseGrammar >> digits [
	"General 1*DIGIT rule referenced"
	^DIGIT plus flatten
]

{ #category : 'as yet unclassified' }
RFC6733BaseGrammar >> fixed [
	" Defines the fixed position of an AVP."
	^(qual optional, $< asParser trimSpaces, avp_spec, $> asParser trimSpaces) trimBlanks
]

{ #category : 'digits' }
RFC6733BaseGrammar >> max [
	"The maximum number of times the element may
    be present.  If absent, the default value is
    infinity.  A value of 0 implies the AVP MUST
    NOT be present."
	^digits
]

{ #category : 'digits' }
RFC6733BaseGrammar >> min [
	"The minimum number of times the element may
    be present.  If absent, the default value is 0
    for fixed and optional rules and 1 for
    required rules.  The value MUST be at least 1
    for required rules."
	^digits
]

{ #category : 'as yet unclassified' }
RFC6733BaseGrammar >> optional [
	"The avp-name in the 'optional' rule cannot
    evaluate to any AVP Name that is included
    in a fixed or required rule.  The AVP can
    appear anywhere in the message.

    NOTE:  '[' and ']' have a slightly different
    meaning than in ABNF.  These braces
    cannot be used to express optional fixed rules
    (such as an optional ICV at the end).  To do
    this, the convention is '0*1fixed'."
	^(qual optional, $[ asParser trimSpaces, avp_spec, $] asParser trimSpaces) trimBlanks
]

{ #category : 'as yet unclassified' }
RFC6733BaseGrammar >> qual [
	"See ABNF conventions, RFC 5234, Section 4.
    The absence of any qualifier depends on
    whether it precedes a fixed, required, or
    optional rule.  If a fixed or required rule has
    no qualifier, then exactly one such AVP MUST
    be present.  If an optional rule has no
    qualifier, then 0 or 1 such AVP may be
    present.  If an optional rule has a qualifier,
    then the value of min MUST be 0 if present."
	^(min optional, $* asParser, max optional) trimSpaces
]

{ #category : 'as yet unclassified' }
RFC6733BaseGrammar >> required [
	"The AVP MUST be present and can appear
    anywhere in the message."
	^(qual optional, ${ asParser trimSpaces, avp_spec, $} asParser trimSpaces) trimBlanks
]
