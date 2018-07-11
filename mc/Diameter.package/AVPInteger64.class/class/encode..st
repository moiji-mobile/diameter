converting
encode: anInteger 
	^(ByteArray new: 8)
		longlongAt: 1 put: anInteger bigEndian: true; 
		yourself