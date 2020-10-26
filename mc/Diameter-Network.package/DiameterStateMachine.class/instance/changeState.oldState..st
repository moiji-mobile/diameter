as yet unclassified
changeState: aStateClass oldState: anOldState
	currentState
		ifNotNil: [ :oldState | 
			anOldState == oldState
				ifTrue: [ anOldState onExit ] ].
	currentState := aStateClass on: self.
	currentState onEnter