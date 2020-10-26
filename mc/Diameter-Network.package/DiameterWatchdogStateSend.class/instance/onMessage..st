as yet unclassified
onMessage: aDiameterMessage
	"Go back to the original state now that we have received something."

	self changeState: DiameterWatchdogStateInitial