as yet unclassified
buildFlags
	^
		(flagRequest asBit << 7) |
		(flagProxyable asBit << 6) |
		(flagError asBit << 5) |
		(flagRetransmit asBit << 4)