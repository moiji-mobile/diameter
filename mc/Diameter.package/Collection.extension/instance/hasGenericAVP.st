*Diameter
hasGenericAVP
	^self anySatisfy: [:each | each avpType avpCode isNil and: [ each avpType avpName = 'AVP' ] ]