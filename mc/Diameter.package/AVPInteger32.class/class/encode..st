converting
encode: anInteger 
	^(ByteArray new: 4)
		longAt: 1 put: anInteger bigEndian: true; 
		yourself