Class {
	#name : 'OTPDiaVendorToken',
	#superclass : 'Object',
	#instVars : [
		'vendorId',
		'vendorName'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaVendorToken >> otpApplyOn: aModule [ 
	aModule
		vendorId: vendorId;
		vendorName: vendorName
]

{ #category : 'as yet unclassified' }
OTPDiaVendorToken >> vendorId: aNumber [
	vendorId := aNumber 
]

{ #category : 'as yet unclassified' }
OTPDiaVendorToken >> vendorName: aString [ 
	vendorName := aString
]
