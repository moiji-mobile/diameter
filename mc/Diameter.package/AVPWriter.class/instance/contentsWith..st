as yet unclassified
contentsWith: aBlock
	| content |
	content := avpType newDefaultValue.
	aBlock value: content.
	avpHeader avpData: content