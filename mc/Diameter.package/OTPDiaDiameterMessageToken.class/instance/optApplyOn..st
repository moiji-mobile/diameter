as yet unclassified
optApplyOn: aModule
	aModule addMessage: (DiameterMessageType new
		messageName: messageName;
		diameterCode: diameterHeader diameterCode;
		requestBit: diameterHeader requestBit;
		proxyBit: diameterHeader proxyBit;
		errorBit: diameterHeader errorBit;
		applicationId: diameterHeader applicationId;
		avps: (avps collect: [:each | aModule buildAvp: each]);
		yourself)