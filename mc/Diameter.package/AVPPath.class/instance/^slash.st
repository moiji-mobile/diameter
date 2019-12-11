initialization
/ aName
	^ AVPCollection
		on: aName
		with: (roots select: [ :avp | avp avpData avpType avpName = aName ])