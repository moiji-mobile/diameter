Class {
	#name : 'AVPHeaderTest',
	#superclass : 'TestCase',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
AVPHeaderTest class >> avpCCRequestNumber [
	^ByteArray readHexFrom: '0000019f6000000c00000000'
]

{ #category : 'as yet unclassified' }
AVPHeaderTest class >> avpEventTrigger [
	^ByteArray readHexFrom: '000003eec0000010000028af00000000'
]

{ #category : 'as yet unclassified' }
AVPHeaderTest class >> avpOriginHost [
	"AVP Code 264, AVP Flags 0x40, AVP Length 22, Padding two bytes"
	^ByteArray readHexFrom: '0000010840000016753173647031622e6f63612e67700000'
]

{ #category : 'tests' }
AVPHeaderTest >> testCCRequestNumberWithProtected [
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
]

{ #category : 'tests' }
AVPHeaderTest >> testEventTriggerAvpVendor [
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
]

{ #category : 'tests' }
AVPHeaderTest >> testSimpleAvpHeaderParsing [
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
]
