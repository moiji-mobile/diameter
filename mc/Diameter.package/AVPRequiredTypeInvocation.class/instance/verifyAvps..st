as yet unclassified
verifyAvps: avps 
	| items |
	items := max - min + 1.
	[ items > 0 ] whileTrue: [
		| avp |
		avp := self findAvpIn: avps.
		avp ifNil: [
			^self error: 'Required AVP not present'].
		avps remove: avp.
		items := items - 1.
	].