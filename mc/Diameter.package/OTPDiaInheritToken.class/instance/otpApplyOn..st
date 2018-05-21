as yet unclassified
otpApplyOn: aModule
	| module |
	module := OTPDiaModule new.
	parsed do: [:each | each otpApplyOn: module ].
	aModule addDependency: module named: moduleName.