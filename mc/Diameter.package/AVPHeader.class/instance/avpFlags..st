as yet unclassified
avpFlags: aFlag 
	avpFlagVendor := (aFlag bitAt: 8) == 1.
	avpFlagMandatory := (aFlag bitAt: 7) == 1.
	avpFlagProtected := (aFlag bitAt: 6) == 1.
	"ignore the reserved bits"