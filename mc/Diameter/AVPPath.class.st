Class {
	#name : 'AVPPath',
	#superclass : 'Object',
	#instVars : [
		'roots',
		'path'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'instance creation' }
AVPPath class >> on: someAVPs [
	^ self on: '.' with: someAVPs
]

{ #category : 'instance creation' }
AVPPath class >> on: aName with: someAVPs [
	^ self new
		initializeOn: aName with: someAVPs;
		yourself
]

{ #category : 'initialization' }
AVPPath >> / aName [
	^ AVPCollection
		on: aName
		with: (roots select: [ :avp | avp avpData avpType avpName = aName ])
]

{ #category : 'initialization' }
AVPPath >> initializeOn: aName with: someAVPs [
	path := aName.
	roots := someAVPs
]

{ #category : 'as yet unclassified' }
AVPPath >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPutAll: '(';
		nextPutAll: path displayString;
		space;
		nextPutAll: roots asArray displayString;
		nextPutAll: ')'
]
