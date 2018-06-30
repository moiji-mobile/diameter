parsing
parseFrom: aReadStream
	| version length data |
	version := aReadStream next.
	length := aReadStream uint24.
	data := (aReadStream next: length - 4) readStream.
	^self basicNew
		diameterFlags: data next;
		commandCode: data uint24;
		applicationId: data uint32;
		hopByHopId: data uint32;
		endToEndId: data uint32;
		parseAvps: data.