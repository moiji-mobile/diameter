as yet unclassified
optApplyOn: aModule
	aModule addMessage: (DiameterMessageType new
		messageName: messageName;
		diameterCode: diameterHeader diameterCode;
		requestBit: diameterHeader requestBit;
		proxyBit: diameterHeader proxyBit;
		errorBit: diameterHeader errorBit;
		applicationId: diameterHeader applicationId;
		fixedAVPs: (fixedAVPs collect: [:each | aModule buildAvp: each]);
		requiredAVPs: (requiredAVPs collect: [:each | aModule buildAvp: each]);
		optionalAVPs: (optionalAVPs collect: [:each | aModule buildAvp: each]);
		yourself)