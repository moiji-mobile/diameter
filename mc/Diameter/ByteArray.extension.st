Extension { #name : 'ByteArray' }

{ #category : '*diameter' }
ByteArray >> asAvpOctetString [
	^AVPOctetString with: self
]

{ #category : '*Diameter' }
ByteArray >> avpHeaders [
	| stream avps |
	stream := self readStream.
	avps := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ 
		| avp |
		avp := AVPHeader parseFrom: stream.
		avps add: avp ].
	^avps.
]

{ #category : '*Diameter' }
ByteArray >> encodedData [
	^self
]

{ #category : '*Diameter' }
ByteArray >> longlongAt: index bigEndian: aBool [
	"Return a 64bit integer quantity starting from the given byte index"
	| b0 b1 b2 b3 b4 b5 b6 w |
	aBool ifTrue:[
		b0 := self at: index.
		b1 := self at: index+1.
		b2 := self at: index+2.
		b3 := self at: index+3.
		b4 := self at: index+4.
		b5 := self at: index+5.
		b6 := self at: index+6.
		w := self at: index+7.
	] ifFalse:[
		w := self at: index.
		b6 := self at: index+1.
		b5 := self at: index+2.
		b4 := self at: index+3.
		b3 := self at: index+4.
		b2 := self at: index+5.
		b1 := self at: index+6.
		b0 := self at: index+7.
	].
	"TODO(zecke): Minimize LargeInteger arithmetic"
	w := (b6 bitShift: 8) + w.
	w := (b5 bitShift: 16) + w.
	w := (b4 bitShift: 24) + w.
	w := (b3 bitShift: 32) + w.
	w := (b2 bitShift: 40) + w.
	w := (b1 bitShift: 48) + w.
	w := ((b0 bitAnd: 16r7F) - (b0 bitAnd: 16r80) bitShift: 56) + w.
	^w
]

{ #category : '*Diameter' }
ByteArray >> longlongAt: index put: value bigEndian: aBool [
	"Store a 64bit integer quantity starting from the given byte index"
	| b0 b1 b2 b3 b4 b5 b6 b7 |
	b0 := value bitShift: -56.
	b0 := (b0 bitAnd: 16r7F) - (b0 bitAnd: 16r80).
	b0 < 0 ifTrue:[b0 := 256 + b0].
	b1 := (value bitShift: -48) bitAnd: 255.
	b2 := (value bitShift: -40) bitAnd: 255.
	b3 := (value bitShift: -32) bitAnd: 255.
	b4 := (value bitShift: -24) bitAnd: 255.
	b5 := (value bitShift: -16) bitAnd: 255.
	b6 := (value bitShift: -8) bitAnd: 255.
	b7 := value bitAnd: 255.
	aBool ifTrue:[
		self at: index put: b0.
		self at: index+1 put: b1.
		self at: index+2 put: b2.
		self at: index+3 put: b3.
		self at: index+4 put: b4.
		self at: index+5 put: b5.
		self at: index+6 put: b6.
		self at: index+7 put: b7.
	] ifFalse:[
		self at: index put: b7.
		self at: index+1 put: b6.
		self at: index+2 put: b5.
		self at: index+3 put: b4.
		self at: index+4 put: b3.
		self at: index+5 put: b2.
		self at: index+6 put: b1.
		self at: index+7 put: b0.
	].
	^value
]

{ #category : '*Diameter' }
ByteArray >> unsignedLongLongAt: index bigEndian: aBool [
	"Return a 64bit unsigned integer quantity starting from the given byte index"
	| b0 b1 b2 b3 b4 b5 b6 w |
	aBool ifTrue:[
		b0 := self at: index.
		b1 := self at: index+1.
		b2 := self at: index+2.
		b3 := self at: index+3.
		b4 := self at: index+4.
		b5 := self at: index+5.
		b6 := self at: index+6.
		w := self at: index+7.
	] ifFalse:[
		w := self at: index.
		b6 := self at: index+1.
		b5 := self at: index+2.
		b4 := self at: index+3.
		b3 := self at: index+4.
		b2 := self at: index+5.
		b1 := self at: index+6.
		b0 := self at: index+7.
	].
	"TODO(zecke): Minimize LargeInteger arithmetic"
	w := (b6 bitShift: 8) + w.
	w := (b5 bitShift: 16) + w.
	w := (b4 bitShift: 24) + w.
	w := (b3 bitShift: 32) + w.
	w := (b2 bitShift: 40) + w.
	w := (b1 bitShift: 48) + w.
	w := (b0 bitShift: 56) + w.
	^w
]

{ #category : '*Diameter' }
ByteArray >> unsignedLongLongAt: index put: value bigEndian: aBool [
	"Store a 64bit unsigned integer quantity starting from the given byte index"
	| b0 b1 b2 b3 b4 b5 b6 b7 |
	b0 := value bitShift: -56.
	b1 := (value bitShift: -48) bitAnd: 255.
	b2 := (value bitShift: -40) bitAnd: 255.
	b3 := (value bitShift: -32) bitAnd: 255.
	b4 := (value bitShift: -24) bitAnd: 255.
	b5 := (value bitShift: -16) bitAnd: 255.
	b6 := (value bitShift: -8) bitAnd: 255.
	b7 := value bitAnd: 255.
	aBool ifTrue:[
		self at: index put: b0.
		self at: index+1 put: b1.
		self at: index+2 put: b2.
		self at: index+3 put: b3.
		self at: index+4 put: b4.
		self at: index+5 put: b5.
		self at: index+6 put: b6.
		self at: index+7 put: b7.
	] ifFalse:[
		self at: index put: b7.
		self at: index+1 put: b6.
		self at: index+2 put: b5.
		self at: index+3 put: b4.
		self at: index+4 put: b3.
		self at: index+5 put: b2.
		self at: index+6 put: b1.
		self at: index+7 put: b0.
	].
	^value
]
