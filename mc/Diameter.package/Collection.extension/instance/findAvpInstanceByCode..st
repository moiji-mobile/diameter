*Diameter
findAvpInstanceByCode: aCode
	^self detect: [:each | each avpType avpCode = aCode ]