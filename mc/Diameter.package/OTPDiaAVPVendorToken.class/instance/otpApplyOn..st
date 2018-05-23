as yet unclassified
otpApplyOn: aModule 
	avpNames do: [:each |
		| avp |
		avp := aModule avpTypeAt: each.
		avp vendorId: avpVendorId]