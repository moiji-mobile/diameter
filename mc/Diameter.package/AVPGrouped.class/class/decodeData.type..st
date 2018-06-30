as yet unclassified
decodeData: aByteArray type: aType 
	| stream parsedAvps |
	stream := aByteArray readStream.
	parsedAvps := OrderedCollection new.
	[ stream atEnd ] whileFalse: [
		parsedAvps add: (AVPHeader parseFrom: stream)].
	aType avps do: [:type |
		type parse: parsedAvps].
	^AVPGrouped new
		avpType: aType;
		contents: parsedAvps;
		yourself.