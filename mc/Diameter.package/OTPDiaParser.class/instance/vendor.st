as yet unclassified
vendor
	^super vendor ==> [:p | OTPDiaVendorToken new 
										vendorId: p second asInteger;
										vendorName: p third ]