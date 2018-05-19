as yet unclassified
diameterFlags: anInteger 
	flagRequest := (anInteger bitAt: 8) == 1.
	flagProxyable := (anInteger bitAt: 7) == 1.
	flagError := (anInteger bitAt: 6) == 1.
	flagRetransmit := (anInteger bitAt: 5) == 1.