as yet unclassified
s6aModule
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