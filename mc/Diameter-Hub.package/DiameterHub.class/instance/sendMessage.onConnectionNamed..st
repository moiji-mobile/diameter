accessing
sendMessage: aDiameterMessage onConnectionNamed: aName
	(connections at: aName) diameterNextPut: aDiameterMessage.