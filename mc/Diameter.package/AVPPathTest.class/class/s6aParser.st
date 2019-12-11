accessing
s6aParser
	^ OTPDiaParser new
		moduleSet:
			(Dictionary new
				at: 'ietf-avps' put: 'src/diameter/contrib/specs/ietf-avps.dia';
				at: '3gpp-avps' put: 'src/diameter/contrib/specs/3gpp-avps.dia';
				at: '3gpp2-avps' put: 'src/diameter/contrib/specs/3gpp2-avps.dia';
				at: 'etsi-avps' put: 'src/diameter/contrib/specs/etsi-avps.dia';
				yourself);
		parseModule: 'src/diameter/contrib/specs/S6a.dia' asFileReference contents