as yet unclassified
exampleAvpType
	^String streamContents: [:str |
		str
			nextPutAll: '@avp_types'; lf;
			lf;
			nextPutAll: '  ;; comment'; lf;
   			nextPutAll: '  Acct-Interim-Interval             85    Unsigned32    M'; lf;
   			nextPutAll: '	Accounting-Realtime-Required     483    Enumerated    M'; lf;
			yourself]