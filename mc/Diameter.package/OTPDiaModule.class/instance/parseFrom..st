as yet unclassified
parseFrom: aReadStream 
	| diameterMessage |
	diameterMessage := DiameterMessage parseFrom: aReadStream.
	diameterMessage messageType: (self findMessageType: diameterMessage).
	^diameterMessage