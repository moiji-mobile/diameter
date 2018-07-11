*Diameter
unsignedLongLongAt: index bigEndian: aBool
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