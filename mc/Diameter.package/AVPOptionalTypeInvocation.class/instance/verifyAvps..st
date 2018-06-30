as yet unclassified
verifyAvps: avps
	| items |
	min > 0 ifTrue: [ ^self error: 'Optional is not optional' ].

	items := (max ifNil: [256]) - min.
	[ items > 0 ] whileTrue: [
		| avp |
		avp := self findAvpIn: avps.
		avp ifNil: [ ^self ].
		avps remove: avp.
		items := items - 1.
	].