as yet unclassified
findAvpIn: aCollection 
	aCollection do: [:each |
		each avpCode = avpType avpCode ifTrue: [ ^each ] ].
	^nil