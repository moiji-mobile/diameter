as yet unclassified
printOn: aStream
	aStream
		nextPutAll: '< ';
		nextPutAll: messageName;
		nextPutAll: ' ';
		nextPutAll: diameterCode displayString;
		nextPutAll: ' ';
		nextPutAll: self flagString;
		nextPutAll: '>'.