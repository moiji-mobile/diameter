as yet unclassified
printOn: aStream
	aStream
		nextPutAll: '<AVP ';
		nextPutAll: avpName;
		nextPutAll: ' ';
		nextPutAll: avpCode displayString;
		nextPutAll: ' ';
		nextPutAll: avpBaseType displayString;
		nextPutAll: ' ';
		nextPutAll: self avpFlagString;
		nextPutAll: '>'