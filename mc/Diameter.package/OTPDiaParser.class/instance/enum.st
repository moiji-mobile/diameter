enum
enum
	"define or enumm"
	^super enum ==> [:p | OTPDiaEnumToken new
									typeAsString: p first;
									avpTypeName: p second;
									enumValues: (p third reject: #isNil) ]