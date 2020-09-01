as yet unclassified
encode: aSocketAddress
	"TODO(zecke): Remove hardcoded IPv4 family string once Pharo has IPv6 support"
	^ (aSocketAddress size = 4)
		ifTrue: [ #[0 1] , aSocketAddress ]
		ifFalse: [ #[0 2], aSocketAddress ].