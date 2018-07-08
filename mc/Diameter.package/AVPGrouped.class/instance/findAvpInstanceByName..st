as yet unclassified
findAvpInstanceByName: aName
	^avpType avps  detect:  [:each | each avpType avpName = aName ]