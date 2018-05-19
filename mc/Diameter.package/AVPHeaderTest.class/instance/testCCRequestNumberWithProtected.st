tests
testCCRequestNumberWithProtected
	| avp data |
	avp := AVPHeader parseFrom: self class avpCCRequestNumber readStream.
	self assert: avp avpCode equals: 415.
	self deny: avp avpIsVendorSpecific.
	self assert: avp avpIsMandatory.
	self assert: avp avpIsProtected.
	self assert: avp avpData equals: #[0 0 0 0].

	data := ByteArray streamContents: [:str |
		avp encodeOn: str].
	self assert: data equals: self class avpCCRequestNumber.