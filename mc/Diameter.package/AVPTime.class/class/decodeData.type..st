as yet unclassified
decodeData: aByteArray type: aType
	^self new
		contents: (DateAndTime fromSeconds: aByteArray asInteger - 31536000) asUTC;
		avpType: aType;
		yourself