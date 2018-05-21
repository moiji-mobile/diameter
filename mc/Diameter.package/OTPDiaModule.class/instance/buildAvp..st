as yet unclassified
buildAvp: aCollection 
	| avp |
	avp := self avpTypeAt: aCollection second.
	^AVPTypeInvocation new
		avpType: avp;
		min: aCollection first min;
		max: aCollection first max;
		many: aCollection first many;
		yourself