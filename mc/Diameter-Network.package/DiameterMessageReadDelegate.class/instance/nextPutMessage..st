initialization
nextPutMessage: aDiameterMessage
	| encodedMessage |
	encodedMessage := aDiameterMessage asEncodedMessage.
	connection nextPut: encodedMessage.