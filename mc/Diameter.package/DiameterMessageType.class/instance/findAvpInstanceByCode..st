AVP API
findAvpInstanceByCode: aCode
	^avps detect:  [:each | each avpType avpCode = aCode ]