as yet unclassified
decode: aDiameterMessage 
	aDiameterMessage messageType: (self findMessageType: aDiameterMessage).
	^aDiameterMessage