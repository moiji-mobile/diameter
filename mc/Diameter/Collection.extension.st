Extension { #name : 'Collection' }

{ #category : '*Diameter' }
Collection >> asAvpGrouped [
	^AVPGrouped with: self.
]

{ #category : '*Diameter' }
Collection >> findAvpInstanceByCode: aCode [
	^self detect: [:each | each avpType avpCode = aCode ]
]

{ #category : '*Diameter' }
Collection >> findAvpInstanceByName: aName [
	^self detect: [:each | each avpType avpName = aName ]
]

{ #category : '*Diameter' }
Collection >> hasGenericAVP [
	^self anySatisfy: [:each | each avpType avpCode isNil and: [ each avpType avpName = 'AVP' ] ]
]

{ #category : '*diameter-parser' }
Collection >> otpApplyOn: aModule [ 
	self do: [:each | each optApplyOn: aModule ]
]
