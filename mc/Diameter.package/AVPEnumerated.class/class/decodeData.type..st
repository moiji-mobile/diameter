as yet unclassified
decodeData: aByteArray type: aType
	^ self new
		contents: (aType typeDefines keyAtValue: aByteArray asInteger);
		avpType: aType;
		yourself