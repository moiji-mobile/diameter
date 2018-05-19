as yet unclassified
parseAvps: aReadStream
	avps := OrderedCollection new.
	[aReadStream atEnd] whileFalse: [
		avps add: (AVPHeader parseFrom: aReadStream).
	].