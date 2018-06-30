as yet unclassified
avp_type
	^super avp_type ==> [:p |
		(self avpTypeFor: p third) new
										avpName: p first;
										avpCode: p second asInteger;
										avpBaseType: (self avpBaseTypeFor: p third);
										avpFlagFromCharacter: p fourth first ]