as yet unclassified
hasGenericAVP
	^avps anySatisfy: [:each | each avpType avpCode isNil and: [ each avpType avpName = 'AVP' ] ]