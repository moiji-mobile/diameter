as yet unclassified
printOn: aStream
	aStream
		nextPutAll: '<AVP ';
		nextPutAll: avpName;
		nextPutAll: ' ';
		nextPutAll: avpCode displayString;
		nextPutAll: ' ';
		nextPutAll: avpBaseType;
		nextPutAll: ' ';
		nextPutAll: self avpFlagString;
		nextPutAll: '>'