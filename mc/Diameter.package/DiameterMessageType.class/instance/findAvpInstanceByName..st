AVP API
findAvpInstanceByName: aName
	^avps detect:  [:each | each avpType avpName = aName ]