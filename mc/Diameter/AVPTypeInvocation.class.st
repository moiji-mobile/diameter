Class {
	#name : 'AVPTypeInvocation',
	#superclass : 'Object',
	#instVars : [
		'avpType',
		'min',
		'max',
		'many'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> avpType [
	^ avpType
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> avpType: anAVPType [ 
	avpType := anAVPType
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> convert: aCollection [ 
	self shouldBeImplemented.
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> findAvpIn: aCollection [
	^aCollection
		detect: [:each | each avpCode = avpType avpCode ]
			ifFound: [:each | avpType verify: each. each ]
			ifNone: [ nil ].
]

{ #category : 'printing' }
AVPTypeInvocation >> fixedRequiredOptional [
	self isOptional ifTrue: [  ^ #optional ].
	self isFixed ifTrue: [ ^ #fixed ].
	self isRequired ifTrue: [ ^ #required ].
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> isFixed [
	^false
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> isOptional [
	^false
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> isRequired [
	^false
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> many: aBoolean [ 
	many := aBoolean
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> max: anInteger [ 
	max := anInteger
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> min: aMinimum [ 
	min := aMinimum
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> newContents: anObject [ 
	^avpType newContents: anObject
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> newDefaultValue [
	^avpType newDefaultValue
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> newHeader [
	^avpType newHeader
]

{ #category : 'as yet unclassified' }
AVPTypeInvocation >> parse: avps [
	avps
		do: [ :each | 
			each avpCode = avpType avpCode
				ifTrue: [ each avpData: (avpType decodeData: each avpData type: self) ] ]
]

{ #category : 'printing' }
AVPTypeInvocation >> printOn: aStream [
	aStream
		nextPutAll: min displayString;
		nextPutAll: (many ifTrue: ['*'] ifFalse: ['-']).
	max ifNotNil: [ aStream nextPutAll: max displayString ].
	aStream nextPutAll: ' '.
	avpType printOn: aStream.
	aStream
		nextPutAll: ' ';
		nextPutAll: self fixedRequiredOptional
]
