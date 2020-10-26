as yet unclassified
startTimer: aTimeout
	timer ifNotNil: [:oldTimer | oldTimer cancel ].
	timer := TimerScheduler instance scheduleIn: aTimeout block: [ self onTimeout  ].