validation
validate: aDiameterMessage
	| descriptor avps |
	descriptor := self findDescriptor: aDiameterMessage commandCode request: aDiameterMessage isRequest.
	avps := aDiameterMessage avps copy.
	descriptor avps do: [:type |
		type verifyAvps: avps].

	descriptor hasGenericAVP ifFalse: [
		avps empty ifFalse: [
			^self error: 'Non parsed AVPs']].