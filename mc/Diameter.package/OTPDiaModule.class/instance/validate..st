validation
validate: aDiameterMessage
	| descriptor avps |
	descriptor := self findDescriptor: aDiameterMessage commandCode request: aDiameterMessage isRequest.
	avps := aDiameterMessage avps copy.
	self class validate: descriptor avps avps: avps.