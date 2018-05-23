grammar
avp_vendor_id
	^super avp_vendor_id ==> [:p | OTPDiaAVPVendorToken new
												avpVendorId: p second asInteger;
												avpNames: p third]