Class {
	#name : 'DiameterMessageType',
	#superclass : 'Object',
	#instVars : [
		'messageName',
		'diameterCode',
		'requestBit',
		'proxyBit',
		'errorBit',
		'applicationId',
		'avps'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
DiameterMessageType >> applicationId: anId [ 
	applicationId := anId
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> avps [
	^ avps
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> avps: aCollection [ 
	avps := aCollection
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> diameterCode [
	^ diameterCode
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> diameterCode: anInteger [ 
	diameterCode := anInteger
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> errorBit: aBoolean [
	errorBit := aBoolean
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> flagString [
	^String streamContents: [:str |
		requestBit ifTrue: [ str nextPutAll: ', REQ' ].
		proxyBit ifTrue: [ str nextPutAll: ', PXY' ].
		errorBit ifTrue: [ str nextPutAll: ', ERR' ]. ]
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> hasGenericAVP [
	^avps hasGenericAVP
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> isRequest [
	^requestBit
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> messageName [
	^ messageName
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> messageName: aString [ 
	messageName := aString
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> newMessage [
	^DiameterMessage new
		initializeMessage;
		messageType: self;
		flagRequest: requestBit;
		flagProxyable: proxyBit;
		applicationId: applicationId;
		commandCode: diameterCode;
		yourself.
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> printOn: aStream [
	aStream
		nextPutAll: '< ';
		nextPutAll: messageName;
		nextPutAll: ' ';
		nextPutAll: diameterCode displayString;
		nextPutAll: ' ';
		nextPutAll: self flagString;
		nextPutAll: '>'.
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> proxyBit: aBoolean [ 
	proxyBit := aBoolean
]

{ #category : 'as yet unclassified' }
DiameterMessageType >> requestBit: aBoolean [ 
	requestBit := aBoolean
]
