accessing
required
	^super required ==> [:p |
		| qual |
		qual := self buildFixedQualifier: p first.
		{qual. p third } ]