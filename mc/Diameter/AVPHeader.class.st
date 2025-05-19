"
I represent the ""4.1.  AVP Header"" DIAMETER RFC 6733

       0                   1                   2                   3
       0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
      |                           AVP Code                            |
      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
      |V M P r r r r r|                  AVP Length                   |
      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
      |                        Vendor-ID (opt)                        |
      +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
      |    Data ...
      +-+-+-+-+-+-+-+-+
"
Class {
	#name : 'AVPHeader',
	#superclass : 'Object',
	#instVars : [
		'avpCode',
		'avpFlagVendor',
		'avpFlagMandatory',
		'avpFlagProtected',
		'avpVendorId',
		'avpData'
	],
	#category : 'Diameter-AVP-Base',
	#package : 'Diameter',
	#tag : 'AVP-Base'
}

{ #category : 'parsing' }
AVPHeader class >> parseFrom: aStream [
	^self basicNew
		avpCode: aStream uint32;
		avpFlags: aStream next;
		parseData: aStream.

]

{ #category : 'as yet unclassified' }
AVPHeader >> avpCode [
	^ avpCode
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpCode: anInteger [ 
	avpCode := anInteger
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpData [
	^ avpData
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpData: anAVPType [ 
	avpData := anAVPType
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpFlagMandatory: aBoolean [ 
	avpFlagMandatory := aBoolean
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpFlagProtected: aBoolean [ 
	avpFlagProtected := aBoolean
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpFlagVendor: aBoolean [ 
	avpFlagVendor := aBoolean
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpFlags: aFlag [ 
	avpFlagVendor := (aFlag bitAt: 8) == 1.
	avpFlagMandatory := (aFlag bitAt: 7) == 1.
	avpFlagProtected := (aFlag bitAt: 6) == 1.
	"ignore the reserved bits"
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpIsMandatory [
	^avpFlagMandatory
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpIsProtected [
	^avpFlagProtected
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpIsVendorSpecific [
	^avpFlagVendor
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpVendorId [
	^ avpVendorId
]

{ #category : 'as yet unclassified' }
AVPHeader >> avpVendorId: aVendorId [ 
	avpVendorId := aVendorId
]

{ #category : 'as yet unclassified' }
AVPHeader >> buildAvpFlag [
	^ (avpFlagVendor asBit bitShift: 7) |
	  (avpFlagMandatory asBit bitShift: 6) |
	  (avpFlagProtected asBit bitShift: 5)
]

{ #category : 'as yet unclassified' }
AVPHeader >> encodeOn: aWriteStream [
	| len rest encoded |
	encoded := avpData encodedData.
	aWriteStream
		nextPutInteger32: avpCode;
		nextPut: (self buildAvpFlag).

	"Length is different and better have only one comparison"
	avpFlagVendor
		ifTrue: [
			len := 8 + 4 + encoded size.
			aWriteStream
				nextPutInteger24: len;
				nextPutInteger32: avpVendorId]
		ifFalse: [
			len := 8 + encoded size.
			aWriteStream
				nextPutInteger24: len].

	aWriteStream nextPutAll: encoded.

	"Write padding"
	rest := len \\ 4.
	rest = 0 ifFalse: [
		aWriteStream nextPutAll: (ByteArray new: 4 - rest)].
]

{ #category : 'parsing' }
AVPHeader >> parseData: aReadStream [
	| len fixedLength rest |
	fixedLength := 8.
	len := aReadStream uint24.

	avpFlagVendor ifTrue: [
		fixedLength := fixedLength + 4.
		avpVendorId := aReadStream uint32].

	avpData := aReadStream next: len - fixedLength.

	"Deal with padding to have it 32bit aligned.."
	rest := len \\ 4.
	rest = 0 ifFalse: [
		aReadStream next: 4 - rest].
]

{ #category : 'printing' }
AVPHeader >> printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: ' ';
		nextPutAll: avpCode displayString
]

{ #category : 'as yet unclassified' }
AVPHeader >> value [
	^ avpData value
]
