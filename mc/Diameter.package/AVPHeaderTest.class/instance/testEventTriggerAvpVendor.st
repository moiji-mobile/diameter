tests
testEventTriggerAvpVendor
	| avp data |
	avp := AVPHeader parseFrom: self class avpEventTrigger readStream.
	self assert: avp avpCode equals: 1006.
	self assert: avp avpIsVendorSpecific.
	self assert: avp avpIsMandatory.
	self deny: avp avpIsProtected.
	self assert: avp avpVendorId equals: 10415.
	self assert: avp avpData equals: #[0 0 0 0].

	data := ByteArray streamContents: [:str |
		avp encodeOn: str].
	self assert: data equals: self class avpEventTrigger.