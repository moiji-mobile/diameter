as yet unclassified
buildOptionalQualifier: aQualifier
	aQualifier ifNil: [
		^OTPDiaQualifierToken new
			min: 0; max: 1; many: nil].
	aQualifier min = 0 ifFalse: [
		^self error: 'Minimum must be 0'].
	^aQualifier