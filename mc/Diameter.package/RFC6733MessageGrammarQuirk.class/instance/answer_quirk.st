as yet unclassified
answer_quirk
	"Handle ERR [PXY] from OTP (RFC would be ERR [, PXY]) but both are wrong
	as the p-bit comes before the e-bit in the RFC..."
	^', ERR [PXY]' asParser