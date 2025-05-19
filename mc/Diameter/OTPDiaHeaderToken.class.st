Class {
	#name : 'OTPDiaHeaderToken',
	#superclass : 'Object',
	#instVars : [
		'diameterCode',
		'request',
		'proxy',
		'errorBit',
		'applicationId'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> applicationId [
	^ applicationId
]

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> applicationId: anId [ 
	applicationId := anId
]

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> diameterCode [
	^ diameterCode
]

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> diameterCode: anInteger [ 
	diameterCode := anInteger
]

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> errorBit [
	^ errorBit
]

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> errorBit: aBoolean [ 
	errorBit := aBoolean
]

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> proxy: aBoolean [ 
	proxy := aBoolean
]

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> proxyBit [
	^proxy
]

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> request: aBoolean [ 
	request := aBoolean
]

{ #category : 'as yet unclassified' }
OTPDiaHeaderToken >> requestBit [
	^request
]
