as yet unclassified
avp_type
	^super avp_type ==> [:p | AVPType new
										avpName: p first;
										avpCode: p second asInteger;
										avpBaseType: p third;
										avpFlagFromCharacter: p fourth first ]