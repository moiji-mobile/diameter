as yet unclassified
encode: anInteger 
	^(ByteArray new: 4)
		nbUInt32AtOffset: 0 put: anInteger;
		yourself