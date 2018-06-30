as yet unclassified
verifyAvps: avps
	| items |
	items := max - min + 1.
	[ items > 0 ] whileTrue: [
		avps first avpCode = avpType avpCode ifFalse: [
			self error: 'Fixed avp code not present'].
		avpType verify: avps first.
		items := items - 1.
		avps removeFirst.
	].
