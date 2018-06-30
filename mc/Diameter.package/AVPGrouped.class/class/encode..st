as yet unclassified
encode: avps 
	^ByteArray streamContents: [:str |
		avps do: [:avp |
			avp encodeOn: str ]].