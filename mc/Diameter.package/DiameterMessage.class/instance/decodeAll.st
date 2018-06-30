as yet unclassified
decodeAll
	"Extract all encoded ByteArray's to their native types"
	messageType avps do: [:type |
		type parse: avps].