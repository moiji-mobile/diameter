as yet unclassified
decodeData: aByteArray type: aType 
	^self new
		avpType: aType;
		contents: (aByteArray longlongAt: 1 bigEndian: true);
		yourself.