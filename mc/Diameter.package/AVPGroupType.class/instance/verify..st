as yet unclassified
verify: avpHeader
	| parsedAvps |
	parsedAvps := avpHeader avpData avpHeaders.
	OTPDiaModule validate: avps avps: parsedAvps.
