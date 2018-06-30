as yet unclassified
decodeData: aByteArray type: aType
	^self new
		contents: aByteArray asInteger;
		avpType: aType;
		yourself