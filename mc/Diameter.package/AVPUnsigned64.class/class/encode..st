converting
encode: anInteger 
	^(ByteArray new: 8)
		unsignedLongLongAt: 1 put: anInteger bigEndian: true;
		yourself