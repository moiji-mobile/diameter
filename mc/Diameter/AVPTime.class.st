Class {
	#name : 'AVPTime',
	#superclass : 'AVPBaseType',
	#category : 'Diameter-Types',
	#package : 'Diameter',
	#tag : 'Types'
}

{ #category : 'as yet unclassified' }
AVPTime class >> decodeData: aByteArray type: aType [
	^self new
		contents: (DateAndTime fromSeconds: aByteArray asInteger - 31536000) asUTC;
		avpType: aType;
		yourself
]

{ #category : 'as yet unclassified' }
AVPTime class >> encode: aDateAndTime [ 
	^(aDateAndTime asUTC asSeconds + 31536000) asByteArrayOfSize: 4
]

{ #category : 'as yet unclassified' }
AVPTime class >> verify: aType [
	^true
]
