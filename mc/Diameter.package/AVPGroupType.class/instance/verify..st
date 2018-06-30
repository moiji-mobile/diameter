as yet unclassified
verify: avpHeader
	| parsedAvps |
	parsedAvps := avpHeader avpData avpHeaders.
	DiameterMessage validate: avps avps: parsedAvps.
