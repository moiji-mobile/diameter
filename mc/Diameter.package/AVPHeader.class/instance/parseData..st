parsing
parseData: aReadStream
	| len fixedLength rest |
	fixedLength := 8.
	len := (aReadStream next: 3) asInteger.

	avpFlagVendor ifTrue: [
		fixedLength := fixedLength + 4.
		avpVendorId := (aReadStream next: 4) asInteger].

	avpData := aReadStream next: len - fixedLength.

	"Deal with padding to have it 32bit aligned.."
	rest := len \\ 4.
	rest = 0 ifFalse: [
		aReadStream next: 4 - rest].