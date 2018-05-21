as yet unclassified
avpFlagString
	^String streamContents: [:str |
		str nextPut: (flagMandatory
							ifTrue: [ $M ]
							ifFalse: [
								flagVendor
									ifTrue: [ $V ]
									ifFalse: [ $-  ] ])]