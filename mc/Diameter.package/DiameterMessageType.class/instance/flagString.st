as yet unclassified
flagString
	^String streamContents: [:str |
		requestBit ifTrue: [ str nextPutAll: ', REQ' ].
		proxyBit ifTrue: [ str nextPutAll: ', PXY' ].
		errorBit ifTrue: [ str nextPutAll: ', ERR' ]. ]