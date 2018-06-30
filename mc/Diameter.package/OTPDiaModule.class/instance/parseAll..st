validation
parseAll: aDiameterMessage
	| descriptor avps |
	descriptor := self findDescriptor: aDiameterMessage commandCode request: aDiameterMessage isRequest.
	avps := aDiameterMessage avps.
	descriptor avps do: [:type |
		type parse: avps].