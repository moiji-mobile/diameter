Class {
	#name : 'OTPDiaAVPVendorToken',
	#superclass : 'Object',
	#instVars : [
		'avpVendorId',
		'avpNames'
	],
	#category : 'Diameter-Parser-Token',
	#package : 'Diameter',
	#tag : 'Parser-Token'
}

{ #category : 'as yet unclassified' }
OTPDiaAVPVendorToken >> avpNames: aCollection [ 
	avpNames := aCollection
]

{ #category : 'as yet unclassified' }
OTPDiaAVPVendorToken >> avpVendorId: aString [ 
	avpVendorId := aString
]

{ #category : 'as yet unclassified' }
OTPDiaAVPVendorToken >> otpApplyOn: aModule [ 
	avpNames do: [:each |
		| avp |
		avp := aModule avpTypeAt: each.
		avp vendorId: avpVendorId]
]
