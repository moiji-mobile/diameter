as yet unclassified
onExit
	"The state is left"
	timer ifNotNil: [:oldTimer | oldTimer cancel ].

	