as yet unclassified
avpTypeAt: aString
	^self avpTypeAt: aString ifAbsent: [NotFoundError signal: 'AVP Type not found'].