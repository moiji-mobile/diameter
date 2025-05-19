Class {
	#name : 'AVPCollection',
	#superclass : 'Object',
	#instVars : [
		'elements',
		'path'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'instance creation' }
AVPCollection class >> on: aPath with: someAVPs [
	^ self new
		initializeOn: aPath with: someAVPs;
		yourself
]

{ #category : 'accessing' }
AVPCollection >> / aName [
	^ elements
		detect: [ :avp | avp avpData avpType avpName = path ]
		ifFound: [ :element | element avpData / aName ]
		ifNone: [ self class on: aName with: #() ]
]

{ #category : 'initialization' }
AVPCollection >> initializeOn: aPath with: someAVPs [
	path := aPath.
	elements := someAVPs
]

{ #category : 'initialization' }
AVPCollection >> printElementsOn: aStream [
	"The original code used #skip:, but some streams do not support that,
	 and we don't really need it."

	aStream nextPut: $(.
	elements
		do: [ :element | aStream print: element ]
		separatedBy: [ aStream
				nextPut: $,;
				space ].
	aStream nextPut: $)
]

{ #category : 'initialization' }
AVPCollection >> printOn: aStream [
	super printOn: aStream.
	self printElementsOn: aStream.

]

{ #category : 'accessing' }
AVPCollection >> size [

	^ elements size
]

{ #category : 'accessing' }
AVPCollection >> value [

	^ elements 
]
