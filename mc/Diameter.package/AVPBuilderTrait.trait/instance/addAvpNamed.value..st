adding
addAvpNamed: aName value: aValue 
	self addAvpNamed: aName with: [:avp | avp avpData: aValue ]