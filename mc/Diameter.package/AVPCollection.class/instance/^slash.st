accessing
/ aName
	^ elements
		detect: [ :avp | avp avpData avpType avpName = path ]
		ifFound: [ :element | element avpData / aName ]
		ifNone: [ nil ]