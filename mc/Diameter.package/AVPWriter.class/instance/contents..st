as yet unclassified
contents: anObject
	| content |
	content := avpType newContents: anObject.
	avpHeader avpData: content.