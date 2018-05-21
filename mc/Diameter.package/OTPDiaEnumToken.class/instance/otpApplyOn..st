as yet unclassified
otpApplyOn: aModule
	| avpType |
	avpType := aModule avpTypeAt: avpTypeName.
	enumValues do: [:each |
		avpType addDefine: each first value: each second]