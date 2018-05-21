as yet unclassified
avpTypeAt: aString 
	avpTypes do: [:each |
		each avpName = aString ifTrue: [^each]].

	aString = 'AVP' ifTrue: [
		^AVPType new
			avpBaseType: 'OctetString';
			avpName: 'AVP';
			yourself].

	^NotFoundError signal: 'AVP Type not found'