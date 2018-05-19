parsing
parseFrom: aStream
	^self basicNew
		avpCode: (aStream next: 4) asInteger;
		avpFlags: (aStream next: 1) asInteger;
		parseData: aStream.
