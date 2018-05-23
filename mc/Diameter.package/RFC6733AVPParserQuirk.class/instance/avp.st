accessing
avp
	^super avp ==> [:p | OTPDiaAVPToken new
									avpCode: (p first third asInteger);
									avps: p second, p third]