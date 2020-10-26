accessing
watchDogTimeout: aDuration
	aDuration < 6 asSeconds
		ifTrue: [ ^ self error: 'RFC sets a minimum duration' ].
	watchDogTimeout := aDuration