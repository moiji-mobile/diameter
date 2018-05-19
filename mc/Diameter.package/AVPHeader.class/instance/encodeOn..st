as yet unclassified
encodeOn: aWriteStream
	| len rest |
	aWriteStream
		nextPutInteger32: avpCode;
		nextPut: (self buildAvpFlag).

	"Length is different and better have only one comparison"
	avpFlagVendor
		ifTrue: [
			len := 8 + 4 + avpData size.
			aWriteStream
				nextPutInteger24: len;
				nextPutInteger32: avpVendorId]
		ifFalse: [
			len := 8 + avpData size.
			aWriteStream
				nextPutInteger24: len].

	aWriteStream nextPutAll: avpData.	

	"Write padding"
	rest := len \\ 4.
	rest = 0 ifFalse: [
		aWriteStream nextPutAll: (ByteArray new: 4 - rest)].