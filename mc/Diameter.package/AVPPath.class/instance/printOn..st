as yet unclassified
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: path displayString, ' ', roots asArray displayString;
		nextPutAll: ')'