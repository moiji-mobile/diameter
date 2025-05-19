"
Obviously the BNF doesn't describe the format used in the file. This is a subclass fixing some of this.
"
Class {
	#name : 'RFC6733MessageGrammarQuirk',
	#superclass : 'RFC6733MessageGrammar',
	#instVars : [
		'answer_quirk',
		'optional_application_id'
	],
	#category : 'Diameter-Grammar',
	#package : 'Diameter',
	#tag : 'Grammar'
}

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirk >> answer_quirk [
	"Handle ERR [PXY] from OTP (RFC would be ERR [, PXY]) but both are wrong
	as the p-bit comes before the e-bit in the RFC..."
	^', ERR [PXY]' asParser
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirk >> command_def [
	"Orig:
		command-def      = '<' command-name '>' '::=' diameter-message
	Fixes:
		* Allow spaces between <abc>__::=__
		* Make < > optional around the command name
		* Swallow anything at the end..
	"
	^$< asParser optional, command_name, $> asParser optional,
		'::=' asParser trimSpaces,
		diameter_message
]

{ #category : 'digits' }
RFC6733MessageGrammarQuirk >> diameter_message [
	^header, fixed star, (required / optional) star
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirk >> diameter_name [
	^(ALPHA / DIGIT / $- asParser) plus flatten
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirk >> e_bit [
	"Quirk mode for OTP that puts [] arround PXY and omits the ,..."
	^', ERR [PXY]' asParser / super e_bit
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirk >> header [
	"
	Original:
	   header           = '<Diameter-Header:' command-id
                         [r-bit] [p-bit] [e-bit] [application-id]'>'
	Fixes:
		* < ___ Diameter__Header___:___'>
		* Spaces between the fields..
		* OTP has ERR [PXY] in the RFC it is ERR [, PXY] which would not be valid either
		but is meant as a place holder. So quirk around it. Also code as a general place
		holder for the request message."
	^('<Diameter-Header:' asParser /
			($< asParser trimSpaces, 'Diameter' asParser trimSpaces, 'Header' asParser trimSpaces,
				$: asParser)) trimSpaces,
		(command_id / 'code' asParser) trimSpaces,
		r_bit optional trimSpaces, p_bit optional trimSpaces, (e_bit optional trimSpaces),
		optional_application_id,
		$> asParser trimBlanks
]

{ #category : 'digits' }
RFC6733MessageGrammarQuirk >> max [
	"Be able to parse a >>#qual like * 3"
	^digits flatten trimSpaces
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammarQuirk >> optional_application_id [
	^(($, asParser optional, application_id optional trimSpaces) ==> [:p | p second ] )
]
