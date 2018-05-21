as yet unclassified
avpTypeFor: aString 
	^aString = 'Grouped'
		ifTrue: [ AVPGroupType ]
		ifFalse: [ AVPType ]