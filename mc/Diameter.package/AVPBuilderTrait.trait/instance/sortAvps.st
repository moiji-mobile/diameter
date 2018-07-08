sorting
sortAvps
	| dict |
	"Sort the AVPs to match the order of the definition. Build the AVP to
	index map and use it to sort it."
	dict := Dictionary new.
	self avpTypeAvps withIndexDo: [:value :idx |
		dict at: (value avpType avpCode) put: idx].

	self messageAvps sort: [:left :right | (dict at: left avpCode) < (dict at: right avpCode)].