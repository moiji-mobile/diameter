as yet unclassified
onEnter
	"Last chance for the connection"

	stateMachine actions sendWatchdogRequest.
		self scheduleWatchdogTimer