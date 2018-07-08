adding
addAvpNamed: aString with: aBlock
	| type avp |
	"Append a new AVP to the end"
	type := self findAvpInstanceByName: aString.
	avp := type newHeader.
	aBlock cull: avp cull: type.
	self addAvp: avp.