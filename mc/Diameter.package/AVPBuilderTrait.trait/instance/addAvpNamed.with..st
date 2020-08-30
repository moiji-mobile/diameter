adding
addAvpNamed: aString with: aBlock
	| type avp |
	"Append a new AVP to the end"
	type := self avpTypeAvps findAvpInstanceByName: aString.
	avp := type newHeader.
	aBlock value: (AVPWriter on: avp type: type).
	self addAvp: avp