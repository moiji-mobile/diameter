Class {
	#name : 'RFC6733AVPGrammarQuirk',
	#superclass : 'RFC6733AVPGrammar',
	#category : 'Diameter-Grammar',
	#package : 'Diameter',
	#tag : 'Grammar'
}

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirk >> avp [
	"3GPP messed things up... and this is why we can't have nice things.."
	^header, fixed star, (required / optional) star
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirk >> diameter_name [
	^(ALPHA / DIGIT / $- asParser) plus flatten
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirk >> grouped_avp_def [
	"They forgot the <> at some points.."
	^$< asParser optional trimSpaces, name trimSpaces, $> asParser optional trimSpaces, '::=' asParser trimSpaces, avp
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirk >> header [
	^$< asParser trimSpaces, ('AVP-Header:' asParser / 'AVP Header:' asParser) trimSpaces, avpcode, vendor optional, $> asParser
]

{ #category : 'digits' }
RFC6733AVPGrammarQuirk >> max [
	"Be able to parse a >>#qual like * 3"
	^digits flatten trimSpaces
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammarQuirk >> name_fmt [
	^(ALPHA / DIGIT / $- asParser) plus flatten
]
