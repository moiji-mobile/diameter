as yet unclassified
encode: anInteger 
	^(ByteArray new: 4)
		unsignedLongAt: 1 put: anInteger bigEndian: true;
		yourself