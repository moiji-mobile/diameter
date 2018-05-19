as yet unclassified
header
	^super header ==> [:p | OTPDiaHeaderToken new
										diameterCode: p second asInteger;
										request: p third isNil not;
										proxy: p fourth isNil not;
										errorBit: (p at: 5) isNil not;
										applicationId: (p at: 6)]