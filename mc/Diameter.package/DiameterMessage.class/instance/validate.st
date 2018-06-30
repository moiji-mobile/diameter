as yet unclassified
validate
	| copiedAvps |
	"TODO(zecke): Check commandCode/applicationId/bits.."
	copiedAvps := avps copy.
	self class validate: messageType avps avps: copiedAvps.