tests
testSimpleAvpHeaderParsing
	| avp data |
	avp := AVPHeader parseFrom: self class avpOriginHost readStream.
	self assert: avp avpCode equals: 264.
	self deny: avp avpIsVendorSpecific.
	self assert: avp avpIsMandatory.
	self deny: avp avpIsProtected.
	self assert: avp avpData asString equals: 'u1sdp1b.oca.gp'.

	data := ByteArray streamContents: [:str |
		avp encodeOn: str].
	self assert: data equals: self class avpOriginHost.