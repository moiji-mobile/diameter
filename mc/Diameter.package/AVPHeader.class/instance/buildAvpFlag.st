as yet unclassified
buildAvpFlag
	^ (avpFlagVendor asBit bitShift: 7) |
	  (avpFlagMandatory asBit bitShift: 6) |
	  (avpFlagProtected asBit bitShift: 5)