as yet unclassified
newHeader
	^AVPHeader new
		avpCode: avpCode;
		avpFlagProtected: false;
		avpFlagMandatory: flagMandatory;
		avpFlagVendor: vendorId notNil;
		avpVendorId: vendorId;
		yourself.