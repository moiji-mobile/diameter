Trait {
	#name : 'AVPBuilderTrait',
	#category : 'Diameter-AVP-Base',
	#package : 'Diameter',
	#tag : 'AVP-Base'
}

{ #category : 'adding' }
AVPBuilderTrait >> addAvpNamed: aName value: aValue [
	self addAvpNamed: aName with: [ :aWriter | aWriter contents: aValue ]
]

{ #category : 'adding' }
AVPBuilderTrait >> addAvpNamed: aString with: aBlock [
	| type avp |
	"Append a new AVP to the end"
	type := self avpTypeAvps findAvpInstanceByName: aString.
	avp := type newHeader.
	aBlock value: (AVPWriter on: avp type: type).
	self addAvp: avp
]

{ #category : 'sorting' }
AVPBuilderTrait >> sortAvps [
	| dict |
	"Sort the AVPs to match the order of the definition. Build the AVP to
	index map and use it to sort it."
	dict := Dictionary new.
	self avpTypeAvps withIndexDo: [:value :idx |
		dict at: (value avpType avpCode) put: idx].

	self messageAvps sort: [:left :right | (dict at: left avpCode) < (dict at: right avpCode)].
]
