Extension { #name : 'String' }

{ #category : '*diameter-parser' }
String >> asAvpDiameterIdentity [
	^AVPDiameterIdentity with: self.
]

{ #category : '*diameter' }
String >> asAvpEnumerated: anAvpType [
	^AVPEnumerated with: (anAvpType typeDefines at: self)
]

{ #category : '*Diameter' }
String >> asAvpUTF8String [
	^AVPUTF8String with: self
]
