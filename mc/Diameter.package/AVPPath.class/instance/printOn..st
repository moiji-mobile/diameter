as yet unclassified
printOn: aStream
	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: path displayString;
		space;
		nextPutAll: roots asArray displayString;
		nextPutAll: ')'