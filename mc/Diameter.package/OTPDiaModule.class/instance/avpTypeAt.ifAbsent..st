as yet unclassified
avpTypeAt: aString ifAbsent: aBlockClosure 
	avpTypes do: [:each |
		each avpName = aString ifTrue: [^each]].

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