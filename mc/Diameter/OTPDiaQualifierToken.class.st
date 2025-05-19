Class {
	#name : 'OTPDiaQualifierToken',
	#superclass : 'Object',
	#instVars : [
		'min',
		'max',
		'many'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
OTPDiaQualifierToken >> many [
	^ many
]

{ #category : 'as yet unclassified' }
OTPDiaQualifierToken >> many: aCharacterOrNil [
	many := aCharacterOrNil isNil not
]

{ #category : 'as yet unclassified' }
OTPDiaQualifierToken >> max [
	^ max
]

{ #category : 'as yet unclassified' }
OTPDiaQualifierToken >> max: aMaximumOrNull [ 
	max := aMaximumOrNull
]

{ #category : 'as yet unclassified' }
OTPDiaQualifierToken >> min [
	^ min ifNil: [ 0 ]
]

{ #category : 'as yet unclassified' }
OTPDiaQualifierToken >> min: aMinimumOrNull [ 
	min := aMinimumOrNull
]
