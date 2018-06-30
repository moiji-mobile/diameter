as yet unclassified
optApplyOn: aModule
	| avpType |
	avpType := aModule avpTypeAt: avpName.
	avpType avpBaseType = AVPGrouped ifFalse: [
		^self error: 'Base type should be grouped. Inconsistent'].
	avpType avpCode = avps avpCode ifFalse: [
		^self error: 'AVP code not consistent'].
	avpType
		avps: (avps avps collect: [:each | aModule buildAvp: each]).