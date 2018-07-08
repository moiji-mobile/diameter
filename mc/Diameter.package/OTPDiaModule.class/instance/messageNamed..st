as yet unclassified
messageNamed: aName
	^messages detect: [:each | each messageName = aName ]