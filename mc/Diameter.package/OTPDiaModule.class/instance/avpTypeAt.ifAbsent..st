as yet unclassified
avpTypeAt: aString ifAbsent: aBlockClosure
	avpTypes detect: [:each | each avpName = aString ] ifFound: [:each | ^each ].

	aString = 'AVP' ifTrue: [
		^AVPType new
			avpBaseType: 'OctetString';
			avpName: 'AVP';
			yourself].

	"Go into the base directory"
	dependencies ifNotNil: [:modules |
		modules do: [:module |
			| type |
			type := module avpTypeAt: aString ifAbsent: [ ].
			type ifNotNil: [^type]]].

	^aBlockClosure value