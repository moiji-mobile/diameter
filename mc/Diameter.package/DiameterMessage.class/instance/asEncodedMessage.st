as yet unclassified
asEncodedMessage
	^ByteArray streamContents: [:str | self encodeOn: str ]