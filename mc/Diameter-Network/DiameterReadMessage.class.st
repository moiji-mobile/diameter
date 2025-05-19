Class {
	#name : 'DiameterReadMessage',
	#superclass : 'Announcement',
	#instVars : [
		'diameterMessage'
	],
	#category : 'Diameter-Network',
	#package : 'Diameter-Network'
}

{ #category : 'instance creation' }
DiameterReadMessage class >> on: aDiameterMessage [
	^self new
		diameterMessage: aDiameterMessage;
		yourself
]

{ #category : 'accessing' }
DiameterReadMessage >> diameterMessage: anObject [
	diameterMessage := anObject
]
