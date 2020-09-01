as yet unclassified
verifyAvps: avps
	| items |
	items := max
		ifNil: [ min asInteger "TODO(zecke): Fix that in the parser.." ]
		ifNotNil: [ max - min + 1 ].

	"Now verify that they are present."
	1 to: items do: [ :each | 
		| avp |
		avp := self findAvpIn: avps.
		avp
			ifNil: [ ^ self error: 'Required AVP not present: ' , self avpType avpName ].
		avps remove: avp ]