Class {
	#name : 'RFC6733MessageParserQuirk',
	#superclass : 'RFC6733MessageGrammarQuirk',
	#traits : 'TRFC6733Parser',
	#classTraits : 'TRFC6733Parser classTrait',
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
RFC6733MessageParserQuirk >> command_def [
	^super command_def ==> [:p | p fifth
											messageName: p second]
]

{ #category : 'as yet unclassified' }
RFC6733MessageParserQuirk >> diameter_message [
	^super diameter_message ==> [:p | OTPDiaDiameterMessageToken new
													diameterHeader: p first;
													avps: p second, p third]
]

{ #category : 'as yet unclassified' }
RFC6733MessageParserQuirk >> header [
	^super header ==> [:p | OTPDiaHeaderToken new
										diameterCode: p second asInteger;
										request: p third isNil not;
										proxy: p fourth isNil not;
										errorBit: (p at: 5) isNil not;
										applicationId: (p at: 6)]
]

{ #category : 'as yet unclassified' }
RFC6733MessageParserQuirk >> optional_application_id [
	^super optional_application_id ==> [:p |
		p ifNil: [nil] ifNotNil: [p asInteger]]
]
