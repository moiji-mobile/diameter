Class {
	#name : 'DiameterMessageReadDelegate',
	#superclass : 'OsmoMessageReadDelegate',
	#instVars : [
		'announcer'
	],
	#category : 'Diameter-Network',
	#package : 'Diameter-Network'
}

{ #category : 'initialization' }
DiameterMessageReadDelegate >> announcer [
	^announcer
]

{ #category : 'initialization' }
DiameterMessageReadDelegate >> initialize [
	super initialize.
	announcer := Announcer new.
]

{ #category : 'initialization' }
DiameterMessageReadDelegate >> nextPutMessage: aDiameterMessage [
	| encodedMessage |
	encodedMessage := aDiameterMessage asEncodedMessage.
	connection nextPut: encodedMessage.
]

{ #category : 'as yet unclassified' }
DiameterMessageReadDelegate >> readOneMessage: aSocket [
	| msg |
	msg := DiameterMessage parseFrom: aSocket.
	announcer announce: (DiameterReadMessage on: msg)
]
