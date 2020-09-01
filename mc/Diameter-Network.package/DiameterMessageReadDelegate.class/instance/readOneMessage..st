as yet unclassified
readOneMessage: aSocket
	| msg |
	msg := DiameterMessage parseFrom: aSocket.
	announcer announce: (DiameterReadMessage on: msg)