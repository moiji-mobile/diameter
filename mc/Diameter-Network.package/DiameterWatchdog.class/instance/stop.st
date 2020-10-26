accessing
stop
	stateMachine currentState ifNotNil: [:state | state cancel ].