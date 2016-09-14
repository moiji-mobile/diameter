as yet unclassified
exampleMessages
	^String streamContents: [:str |
		str
			nextPutAll: '@messages'; lf;
			nextPutAll: '  '; lf;
			lf;
			nextPutAll: ' ;; Some comment'; lf;
			nextPutAll: '      DWR ::= < Diameter Header: 280, REQ >'; lf;
			nextPutAll: '              { Origin-Host }'; lf;
			nextPutAll: '              { Origin-Realm }'; lf;
			nextPutAll: '              [ Origin-State-Id ]'; lf;
			nextPutAll: '            * [ AVP ]'; lf;
			lf;
			lf;
			nextPutAll: '      DWA ::= < Diameter Header: 280 >'; lf;
			nextPutAll: '              { Result-Code }'; lf;
			nextPutAll: '              { Origin-Host }'; lf;
			nextPutAll: '              { Origin-Realm }'; lf;
			nextPutAll: '              [ Error-Message ]'; lf;
			nextPutAll: '              [ Failed-AVP ]'; lf;
			nextPutAll: '              [ Origin-State-Id ]'; lf;
			nextPutAll: '            * [ AVP ]'; lf]