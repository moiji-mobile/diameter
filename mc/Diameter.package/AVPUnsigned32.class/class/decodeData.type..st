as yet unclassified
decodeData: aByteArray type: aType 
	^self new
		avpType: aType;
		contents: (aByteArray nbUInt32AtOffset: 0);
		yourself.