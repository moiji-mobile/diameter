as yet unclassified
fixed
	"Not invokved by anyone... during parsing"
	^super fixed ==> [:p |
		| qual |
		qual := self buildFixedQualifier: p first.
		{qual. p third} ]