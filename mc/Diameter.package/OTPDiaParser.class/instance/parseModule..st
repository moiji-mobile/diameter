parsing
parseModule: aStream
	| module |
	module := OTPDiaModule new.
	(self parse: aStream) do: [:each | each otpApplyOn: module ].
	^module.