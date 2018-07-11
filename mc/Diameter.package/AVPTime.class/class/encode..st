as yet unclassified
encode: aDateAndTime 
	^(aDateAndTime asUTC asSeconds + 31536000) asByteArrayOfSize: 4