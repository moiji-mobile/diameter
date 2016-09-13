as yet unclassified
header
	^$< asParser trimSpaces, ('AVP-Header:' asParser / 'AVP Header:' asParser) trimSpaces, avpcode, vendor optional, $> asParser