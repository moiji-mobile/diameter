as yet unclassified
decodeData: aByteArray type: aType 
	^self new
		avpType: aType;
		contents: (aByteArray longAt: 1 bigEndian: true);
		yourself.