as yet unclassified
findAvpIn: aCollection
	^aCollection
		detect: [:each | each avpCode = avpType avpCode ]
			ifFound: [:each | avpType verify: each. each ]
			ifNone: [ nil ].