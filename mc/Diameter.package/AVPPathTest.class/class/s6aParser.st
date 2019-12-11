accessing
s6aParser
	^ OTPDiaParser new
		moduleSet:
			(Dictionary new
				at: 'ietf-avps' put: 'contrib/specs/ietf-avps.dia';
				at: '3gpp-avps' put: 'contrib/specs/3gpp-avps.dia';
				at: '3gpp2-avps' put: 'contrib/specs/3gpp2-avps.dia';
				at: 'etsi-avps' put: 'contrib/specs/etsi-avps.dia';
				yourself);
		parseModule: 'contrib/specs/S6a.dia' asFileReference contents