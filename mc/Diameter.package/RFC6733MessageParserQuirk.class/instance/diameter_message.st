as yet unclassified
diameter_message
	^super diameter_message ==> [:p | OTPDiaDiameterMessageToken new
													diameterHeader: p first;
													fixedAVPs: p second;
													requiredAVPs: p third;
													optionalAVPs: p fourth]