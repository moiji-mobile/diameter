as yet unclassified
qual
	^super qual ==> [:p | OTPDiaQualifierToken new
									min: p first;
									max: p third;
									many: p second ]