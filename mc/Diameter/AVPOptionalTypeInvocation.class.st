Class {
	#name : 'AVPOptionalTypeInvocation',
	#superclass : 'AVPTypeInvocation',
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
AVPOptionalTypeInvocation >> isOptional [
	^true
]

{ #category : 'as yet unclassified' }
AVPOptionalTypeInvocation >> verifyAvps: avps [
	| items |
	min > 0 ifTrue: [ ^self error: 'Optional is not optional' ].

	items := (max ifNil: [256]) - min.
	1 to: items do: [:each |
		| avp |
		avp := self findAvpIn: avps.
		avp ifNil: [ ^self ].
		avps remove: avp.
	].
]
