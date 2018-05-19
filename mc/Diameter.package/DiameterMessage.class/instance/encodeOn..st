as yet unclassified
encodeOn: aWriteStream 
	| encodedAvps |
	encodedAvps := ByteArray streamContents: [:str |
		avps do: [:each | each encodeOn: str ] ].

	aWriteStream
		nextPut: 16r01;
		nextPutInteger24: 20 + encodedAvps size;
		nextPut: self buildFlags;
		nextPutInteger24: commandCode;
		nextPutInteger32: applicationId;
		nextPutInteger32: hopByHopId;
		nextPutInteger32: endToEndId;
		nextPutAll: encodedAvps.