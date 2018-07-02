as yet unclassified
verifyAvps: avps 
	| items |
	items := max - min + 1.
	1 to: items do: [:each | 
		| avp |
		avp := self findAvpIn: avps.
		avp ifNil: [
			^self error: 'Required AVP not present'].
		avps remove: avp.
	].