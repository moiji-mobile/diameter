as yet unclassified
initializeMessage
	avps := OrderedCollection new.
	flagRequest := flagProxyable := flagError := flagRetransmit := false.
	hopByHopId := endToEndId := 0.