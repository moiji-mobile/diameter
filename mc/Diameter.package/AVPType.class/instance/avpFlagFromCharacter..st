as yet unclassified
avpFlagFromCharacter: aCharacter 
	aCharacter = $- ifTrue: [ ^self ].
	aCharacter = $M ifTrue: [ ^self beMandatory ].
	aCharacter = $V ifTrue: [ ^self beVendor ].
	^self error: 'Unknown avp info flag'