parsing
parseFrom: aReadStream
	| version length data |
	version := aReadStream next.
	length := (aReadStream next: 3) asInteger.
	data := (aReadStream next: length - 4) readStream.
	^self basicNew
		diameterFlags: data next;
		commandCode: (data next: 3) asInteger;
		applicationId: (data next: 4) asInteger;
		hopByHopId: (data next: 4) asInteger;
		endToEndId: (data next: 4) asInteger;
		parseAvps: data.