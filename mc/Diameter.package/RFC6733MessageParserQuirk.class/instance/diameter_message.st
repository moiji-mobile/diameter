as yet unclassified
diameter_message
	^super diameter_message ==> [:p | OTPDiaDiameterMessageToken new
													diameterHeader: p first;
													avps: p second, p third]