accessing
avp
	^super avp ==> [:p | OTPDiaAVPToken new
									avpCode: (p first third asInteger);
									fixedAVPs: p second;
									requiredAVPs: p third;
									optionalAVPs: p fourth]