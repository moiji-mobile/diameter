as yet unclassified
avpTypeInvocationFor: aString 
	aString = #required ifTrue: [ ^AVPRequiredTypeInvocation ].
	aString = #optional ifTrue: [ ^AVPOptionalTypeInvocation ].
	aString = #fixed ifTrue: [ ^AVPFixedTypeInvocation ]