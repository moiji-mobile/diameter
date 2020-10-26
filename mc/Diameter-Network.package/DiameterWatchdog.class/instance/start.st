accessing
start
	stateMachine := DiameterStateMachine withActions: self andOptions: self.
	stateMachine changeState: DiameterWatchdogStateInitial. 