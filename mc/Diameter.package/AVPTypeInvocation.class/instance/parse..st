as yet unclassified
parse: avps
	avps
		do: [ :each | 
			each avpCode = avpType avpCode
				ifTrue: [ each avpData: (avpType decodeData: each avpData type: self) ] ]