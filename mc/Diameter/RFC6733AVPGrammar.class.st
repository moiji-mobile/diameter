Class {
	#name : 'RFC6733AVPGrammar',
	#superclass : 'RFC6733BaseGrammar',
	#instVars : [
		'grouped_avp_def',
		'name',
		'name_fmt',
		'header',
		'avp',
		'avpcode',
		'vendor'
	],
	#category : 'Diameter-Grammar',
	#package : 'Diameter',
	#tag : 'Grammar'
}

{ #category : 'as yet unclassified' }
RFC6733AVPGrammar >> avp [
	^header, fixed star, required star, optional star
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammar >> avpcode [
	"The AVP Code assigned to the Grouped AVP."
	^DIGIT plus flatten trimSpaces
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammar >> grouped_avp_def [
	^$< asParser trimSpaces, name, $> asParser trimSpaces, '::=' asParser trimSpaces, avp
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammar >> header [
	^$< asParser trimSpaces, 'AVP-Header:' asParser trimSpaces, avpcode, vendor optional, $> asParser
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammar >> name [
	"The name has to be the name of an AVP,
    defined in the base or extended Diameter
    specifications."
	^name_fmt
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammar >> name_fmt [
	^(ALPHA, (ALPHA / DIGIT / $- asParser) star) flatten
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammar >> start [
	^grouped_avp_def end
]

{ #category : 'as yet unclassified' }
RFC6733AVPGrammar >> vendor [
	"The Vendor-ID assigned to the Grouped AVP.
    If absent, the default value of zero is
    used."
	^DIGIT plus trimSpaces flatten
]
