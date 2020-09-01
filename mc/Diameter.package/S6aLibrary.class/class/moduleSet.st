as yet unclassified
moduleSet
	| memFs |
	memFs := FileSystem memory.
	memFs root / 'ietf-avps.dia'
		writeStreamDo: [ :str | str nextPutAll: self specIetfAvps ].
	memFs root / '3gpp-avps.dia'
		writeStreamDo: [ :str | str nextPutAll: self spec3gppAvps ].
	memFs root / '3gpp2-avps.dia'
		writeStreamDo: [ :str | str nextPutAll: self spec3gpp2Avps ].
	memFs root / 'etsi-avps.dia'
		writeStreamDo: [ :str | str nextPutAll: self specEtsiAvps ].
	memFs root / 'base_rfc6733.dia'
		writeStreamDo: [ :str | str nextPutAll: self specBaseRFC6733 ].
	^ Dictionary new
		at: 'ietf-avps' put: memFs root / 'ietf-avps.dia';
		at: '3gpp-avps' put: memFs root / '3gpp-avps.dia';
		at: '3gpp2-avps' put: memFs root / '3gpp2-avps.dia';
		at: 'etsi-avps' put: memFs root / 'etsi-avps.dia';
		yourself