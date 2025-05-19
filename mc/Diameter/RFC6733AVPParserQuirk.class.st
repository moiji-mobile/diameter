Class {
	#name : 'RFC6733AVPParserQuirk',
	#superclass : 'RFC6733AVPGrammarQuirk',
	#traits : 'TRFC6733Parser',
	#classTraits : 'TRFC6733Parser classTrait',
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'accessing' }
RFC6733AVPParserQuirk >> avp [
	^super avp ==> [:p | OTPDiaAVPToken new
									avpCode: (p first third asInteger);
									avps: p second, p third]
]

{ #category : 'accessing' }
RFC6733AVPParserQuirk >> grouped_avp_def [
	^super grouped_avp_def ==> [:p | OTPDiaAVPGroupToken new
												avpName: p second;
												avps: p fifth ]
]
