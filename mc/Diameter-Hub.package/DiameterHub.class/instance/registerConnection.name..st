accessing
registerConnection: aConnection name: aName
	| conn |
	conn := DiameterHubConnection new
		networkConnection: aConnection;
		connectionName: aName;
		yourself.
	connections at: aName put: conn.
	conn diameterAnnouncer
		when: DiameterReadMessage
		do: [ :message | ModuleBoundary runSynchronous: [self handleMessage: message on: conn ] ]