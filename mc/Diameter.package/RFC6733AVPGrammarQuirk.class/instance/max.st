digits
max
	"Be able to parse a >>#qual like * 3"
	^(#space asParser star, digits) flatten trimSpaces