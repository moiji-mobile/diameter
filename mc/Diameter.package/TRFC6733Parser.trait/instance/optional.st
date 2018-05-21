operators
optional
	^super optional ==> [:p |
		| qual |
		qual := self buildOptionalQualifier: p first.
		{qual. p third} ]