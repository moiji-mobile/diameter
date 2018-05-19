accessing
grouped_avp_def
	^super grouped_avp_def ==> [:p | OTPDiaAVPGroupToken new
												avpName: p second;
												avps: p fifth ]