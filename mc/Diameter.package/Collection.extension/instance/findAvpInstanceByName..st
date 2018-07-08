*Diameter
findAvpInstanceByName: aName
	^self detect: [:each | each avpType avpName = aName ]