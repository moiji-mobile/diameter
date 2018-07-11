*Diameter
unsignedLongLongAt: index put: value bigEndian: aBool
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