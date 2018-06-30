as yet unclassified
decodeData: aByteArray type: aType
	^self new
		contents: aByteArray utf8Decoded;
		avpType: aType;
		yourself