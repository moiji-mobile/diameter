as yet unclassified
findDescriptor: aCommandCode request: isRequest
	messages do: [:each |
		((each isRequest = isRequest) and: [(each diameterCode = aCommandCode)]) ifTrue: [
			^each]].
	^NotFound signal: 'Command with code does not exist: ', aCommandCode displayString