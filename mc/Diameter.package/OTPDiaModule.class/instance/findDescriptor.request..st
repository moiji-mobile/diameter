as yet unclassified
findDescriptor: aCommandCode request: isRequest
	^messages
		detect: [:each |
			((each isRequest = isRequest) and: [(each diameterCode = aCommandCode)])]
		ifNone: [NotFound signal: 'Command with code does not exist: ', aCommandCode displayString].