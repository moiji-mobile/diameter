adding
addAvpNamed: aName value: aValue
	self addAvpNamed: aName with: [ :aWriter | aWriter contents: aValue ]