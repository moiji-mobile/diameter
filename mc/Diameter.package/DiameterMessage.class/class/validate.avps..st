parsing
validate: descriptor avps: avps 
	descriptor do: [:type |
		type verifyAvps: avps].

	descriptor hasGenericAVP ifFalse: [
		avps isEmpty ifFalse: [
			^self error: 'Non parsed AVPs']].