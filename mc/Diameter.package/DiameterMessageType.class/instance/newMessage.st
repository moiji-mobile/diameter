as yet unclassified
newMessage
	^DiameterMessage new
		initializeMessage;
		messageType: self;
		flagRequest: requestBit;
		flagProxyable: proxyBit;
		applicationId: applicationId;
		commandCode: diameterCode;
		yourself.