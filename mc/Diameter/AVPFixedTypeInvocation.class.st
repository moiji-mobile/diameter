Class {
	#name : 'AVPFixedTypeInvocation',
	#superclass : 'AVPTypeInvocation',
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'as yet unclassified' }
AVPFixedTypeInvocation >> isFixed [
	^true
]

{ #category : 'as yet unclassified' }
AVPFixedTypeInvocation >> verifyAvps: avps [
	| items |
	items := max - min + 1.
	[ items > 0 ] whileTrue: [
		avps ifEmpty: [
			self error: 'Fixed avp missing: ', avpType avpName].
		avps first avpCode = avpType avpCode ifFalse: [
			self error: 'Fixed avp code not present', avpType avpName].
		avpType verify: avps first.
		items := items - 1.
		avps removeFirst.
	].

]
