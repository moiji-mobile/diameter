printing
printOn: aStream
	aStream
		nextPutAll: min displayString;
		nextPutAll: (many ifTrue: ['*'] ifFalse: ['-']).
	max ifNotNil: [ aStream nextPutAll: max displayString ].
	aStream nextPutAll: ' '.
	avpType printOn: aStream.
	aStream
		nextPutAll: ' ';
		nextPutAll: self fixedRequiredOptional