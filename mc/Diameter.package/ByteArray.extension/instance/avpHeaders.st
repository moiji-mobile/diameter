*Diameter
avpHeaders
	| stream avps |
	stream := self readStream.
	avps := OrderedCollection new.
	[ stream atEnd ] whileFalse: [ 
		| avp |
		avp := AVPHeader parseFrom: stream.
		avps add: avp ].
	^avps.