as yet unclassified
buildFixedQualifier: aQualifier
	aQualifier ifNil: [
		^OTPDiaQualifierToken new
			min: 1; max: 1; many: nil].
	^aQualifier