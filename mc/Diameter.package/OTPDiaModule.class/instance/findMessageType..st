as yet unclassified
findMessageType: aDiameterMessage 
	^self findDescriptor: aDiameterMessage commandCode request: aDiameterMessage isRequest.