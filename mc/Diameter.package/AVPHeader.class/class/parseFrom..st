parsing
parseFrom: aStream
	^self basicNew
		avpCode: aStream uint32;
		avpFlags: aStream next;
		parseData: aStream.
