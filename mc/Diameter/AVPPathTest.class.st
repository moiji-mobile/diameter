"
Coverage fot the AVP querying feature
"
Class {
	#name : 'AVPPathTest',
	#superclass : 'TestCase',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'accessing' }
AVPPathTest class >> s6aParser [
	| module |
	module := OTPDiaModule new.
	OTPDiaParser new
		moduleSet:
			(Dictionary new
				at: 'ietf-avps' put: S6aLibrary specIetfAvps;
				at: '3gpp-avps' put: S6aLibrary spec3gppAvps;
				at: '3gpp2-avps' put: S6aLibrary spec3gpp2Avps;
				at: 'etsi-avps' put: S6aLibrary specEtsiAvps;
				yourself);
		parseModule: S6aLibrary specBaseRFC6733 on: module;
		parseModule: S6aLibrary specS6a on: module.
	^ module
]

{ #category : 'accessing' }
AVPPathTest class >> updateLocationAnswerSample [
	^ ByteArray
		readHexFrom:
			'010001704000013e0100002300476cc6ee07e32f00000107400000456d6d65322e6570632e6d6e633030362e6d63633236302e336770706e6574776f726b2e6f72673b303b313436323434303832363b3237363735313135320000000000010c4000000c000007d1000001154000000c000000010000010840000030686c726873732e6570632e6d6e633834302e6d63633331302e336770706e6574776f726b2e6f726700000128400000296570632e6d6e633834302e6d63633331302e336770706e6574776f726b2e6f726700000000000585c00000a0000028af00000586c0000094000028af0000058bc0000010000028af00000001000005a7c000001c000028afb6ac653f84a0a0cdbdd8059584cb0f30000005a8c0000014000028af2f71dd06cdd8f4c9000005a9c000001c000028af561871ca8668b9b9a61fd592699b1187000005aac000002c000028af7535b3127f09d9b701d437e3fdbccb67ee7e82dcadf00eb2d01999c4681ce10f'
]

{ #category : 'accessing' }
AVPPathTest class >> updateLocationRequestSample [
	^ ByteArray
		readHexFrom:
			'01000214c000013e0100002300476cc6ee07e32f00000107400000456d6d65322e6570632e6d6e633030362e6d63633236302e336770706e6574776f726b2e6f72673b303b313436323434303832363b32373637353131353200000000000104400000200000010a4000000c000028af000001024000000c01000023000001084000002e6d6d65322e6570632e6d6e633030362e6d63633236302e336770706e6574776f726b2e6f7267000000000128400000296570632e6d6e633030362e6d63633236302e336770706e6574776f726b2e6f72670000000000012540000030686c726873732e6570632e6d6e633834302e6d63633331302e336770706e6574776f726b2e6f72670000011b400000296570632e6d6e633834302e6d63633331302e336770706e6574776f726b2e6f726700000000000001400000173331303834303830303030323034320000000580c000002c000028af00000582c0000010000028af0000000100000584c0000010000028af000000010000057fc000000f000028af62f06000000001154000000c000000010000011a400000306b61746473722e6570632e6d6e633030362e6d63633236302e336770706e6574776f726b2e6f72670000011a4000001c647261616d733130312e6962617369732e6772780000011a4000001b6472616e6c30312e636f6d666f6e652e636f6d000000011a400000156665702d702d736374705f7568000000'
]

{ #category : 'tests' }
AVPPathTest >> testULAnswerQuerying [
	| message |
	message := DiameterMessage
		decode: self class updateLocationAnswerSample.
	self class s6aParser decode: message.
	message decodeAll.
	self
		assert: (message avpsPath / 'Auth-Session-State') value first value
		equals: 'NO_STATE_MAINTAINED'.
	self
		assert:
			(message avpsPath / 'Authentication-Info' / 'E-UTRAN-Vector' / 'AUTN')
				value first value
		equals: #[86 24 113 202 134 104 185 185 166 31 213 146 105 155 17 135]
]

{ #category : 'tests' }
AVPPathTest >> testULRNestedDecode [
	| message |
	message := DiameterMessage
		decode: self class updateLocationRequestSample.
	self class s6aParser decode: message.
	message decodeAll.
	self assert: (message avpsPath / 'Route-Record') size equals: 4.
	self
		assert: (message avpsPath / 'Route-Record') value first value
		equals: 'katdsr.epc.mnc006.mcc260.3gppnetwork.org'.
	self
		assert: (message avpsPath / 'User-Name') value first value
		equals: '310840800002042'.
	self
		assert: (message avpsPath / 'Visited-PLMN-Id') value first value
		equals: #[98 240 96]
]

{ #category : 'tests' }
AVPPathTest >> testULRequestQuerying [
	| message |
	message := DiameterMessage
		decode: self class updateLocationRequestSample.
	self class s6aParser decode: message.
	message decodeAll.
	self assert: (message avpsPath / 'Route-Record') size = 4.
	self
		assert:
			(message avpsPath / 'Route-Record') value first value
				= 'katdsr.epc.mnc006.mcc260.3gppnetwork.org'.
	self
		assert: (message avpsPath / 'User-Name') value first value
		equals: '310840800002042'.
	self
		assert: (message avpsPath / 'Visited-PLMN-Id') value first value
		equals: #[98 240 96].
	self
		assert:
			(message avpsPath / 'Requested-EUTRAN-Authentication-Info'
				/ 'Number-Of-Requested-Vectors') value first value
		equals: 1
]
