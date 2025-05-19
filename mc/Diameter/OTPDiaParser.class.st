Class {
	#name : 'OTPDiaParser',
	#superclass : 'OTPDiaGrammar',
	#instVars : [
		'moduleSet'
	],
	#category : 'Diameter-Parser',
	#package : 'Diameter',
	#tag : 'Parser'
}

{ #category : 'accessing' }
OTPDiaParser class >> ignoredNames [
	"Answer a collection of instance-variables that should not be automatically initialized with productions, but that are used internal to the composite parser."

	^ super ignoredNames, #(#moduleSet)

]

{ #category : 'as yet unclassified' }
OTPDiaParser >> avpBaseTypeFor: aString [ 
	aString = 'UTF8String' ifTrue: [
		^AVPUTF8String].
	aString = 'OctetString' ifTrue: [
		^AVPOctetString].
	aString = 'Unsigned32' ifTrue: [
		^AVPUnsigned32].
	aString = 'Unsigned64' ifTrue: [
		^AVPUnsigned64].
	aString = 'Integer32' ifTrue: [
		^AVPInteger32].
	aString = 'Integer64' ifTrue: [
		^AVPInteger64].
	aString = 'Enumerated' ifTrue: [
		^AVPEnumerated].
	aString = 'Time' ifTrue: [
		^AVPTime].
	aString = 'Address' ifTrue: [ 
		^AVPAddress].
	aString = 'Grouped' ifTrue: [
		^AVPGrouped].
	(#('DiameterIdentity' 'DiamIdent') includes: aString) ifTrue: [
		^AVPDiameterIdentity].
	(#('DiameterURI' 'DiamURI') includes: aString) ifTrue: [
		^AVPDiameterURI].
	aString = 'IPFilterRule' ifTrue: [
		^AVPIPFilterRule].
	aString = 'QoSFilterRule' ifTrue: [
		^AVPQoSFilterRule].
	^self error: 'Unknown type ', aString
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> avpGrammarClass [
	^RFC6733AVPParserQuirk
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> avpTypeFor: aString [ 
	^aString = 'Grouped'
		ifTrue: [ AVPGroupType ]
		ifFalse: [ AVPType ]
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> avp_type [
	^super avp_type ==> [:p |
		(self avpTypeFor: p third) new
										avpName: p first;
										avpCode: p second asInteger;
										avpBaseType: (self avpBaseTypeFor: p third);
										avpFlagFromCharacter: p fourth first ]
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> avp_types [
	^super avp_types ==> [:p | p second reject: #isNil ]
]

{ #category : 'grammar' }
OTPDiaParser >> avp_vendor_id [
	^super avp_vendor_id ==> [:p | OTPDiaAVPVendorToken new
												avpVendorId: p second asInteger;
												avpNames: p third]
]

{ #category : 'enum' }
OTPDiaParser >> base_10_id [
	^super base_10_id ==> [:p | p asInteger ]
]

{ #category : 'enum' }
OTPDiaParser >> base_16_id [
	^super base_16_id ==> [:p | Number readFrom: p base: 16 ]
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> blank [
	^super blank ==> [:e | ]
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> comment [
	^super comment ==> [:e | ]
]

{ #category : 'enum' }
OTPDiaParser >> enum [
	"define or enumm"
	^super enum ==> [:p | OTPDiaEnumToken new
									typeAsString: p first;
									avpTypeName: p second;
									enumValues: (p third reject: #isNil) ]
]

{ #category : 'grammar' }
OTPDiaParser >> grouped [
	^super grouped ==> [:p | p second reject: #isNil ]
]

{ #category : 'id' }
OTPDiaParser >> id [
	^super id ==> [:p | OTPDiaIdToken new id: p second asInteger ]
]

{ #category : 'inherits' }
OTPDiaParser >> inherits [
	^ super inherits
		==> [ :p | 
			self flag: #todo.	"Handle p third as a type filter. Not sure how that works"
			OTPDiaInheritToken new
				moduleName: p second;
				parsed: (self parse: (moduleSet at: p second) contents) ]
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> messageGrammarClass [
	^RFC6733MessageParserQuirk
]

{ #category : 'messages' }
OTPDiaParser >> messages [
	^super messages ==> [:p | p second reject: #isNil ]
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> moduleSet: aCollection [ 
	moduleSet := aCollection
]

{ #category : 'parsing' }
OTPDiaParser >> parseModule: aStream [
	| module |
	module := OTPDiaModule new.
	(self parse: aStream) do: [:each | each otpApplyOn: module ].
	^module.
]

{ #category : 'parsing' }
OTPDiaParser >> parseModule: aStream on: aModule [
	(self parse: aStream) do: [ :each | each otpApplyOn: aModule ].
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> prefix [
	^super prefix ==> [:p | ]
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> sectName [
	^super sectName ==> [:name | OTPDiaSectNameToken new name: name second]
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> start [
	^super start ==> [:p | p reject: #isNil ]
]

{ #category : 'as yet unclassified' }
OTPDiaParser >> vendor [
	^super vendor ==> [:p | OTPDiaVendorToken new 
										vendorId: p second asInteger;
										vendorName: p third ]
]
