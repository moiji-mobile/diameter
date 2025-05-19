Trait {
	#name : 'TRFC6733Parser',
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
TRFC6733Parser >> buildFixedQualifier: aQualifier [
	aQualifier ifNil: [
		^OTPDiaQualifierToken new
			min: 1; max: 1; many: nil].
	^aQualifier
]

{ #category : 'as yet unclassified' }
TRFC6733Parser >> buildOptionalQualifier: aQualifier [
	aQualifier ifNil: [
		^OTPDiaQualifierToken new
			min: 0; max: 1; many: nil].
	aQualifier min = 0 ifFalse: [
		^self error: 'Minimum must be 0'].
	^aQualifier
]

{ #category : 'as yet unclassified' }
TRFC6733Parser >> fixed [
	"Not invokved by anyone... during parsing"
	^super fixed ==> [:p |
		| qual |
		qual := self buildFixedQualifier: p first.
		{qual. p third. #fixed} ]
]

{ #category : 'operators' }
TRFC6733Parser >> optional [
	^super optional ==> [:p |
		| qual |
		qual := self buildOptionalQualifier: p first.
		{qual. p third. #optional} ]
]

{ #category : 'as yet unclassified' }
TRFC6733Parser >> qual [
	^super qual ==> [:p | OTPDiaQualifierToken new
									min: p first;
									max: p third;
									many: p second ]
]

{ #category : 'accessing' }
TRFC6733Parser >> required [
	^super required ==> [:p |
		| qual |
		qual := self buildFixedQualifier: p first.
		{qual. p third. #required} ]
]
