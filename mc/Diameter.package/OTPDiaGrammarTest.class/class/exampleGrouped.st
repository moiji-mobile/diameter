as yet unclassified
exampleGrouped
	^String streamContents: [:str |
		str
			nextPutAll: '@grouped'; lf;
			lf;
			nextPutAll: ' ;; comment'; lf;
			nextPutAll: '      Proxy-Info ::= < AVP Header: 284 >'; lf;
			nextPutAll: '                     { Proxy-Host }'; lf;
			nextPutAll: '                     { Proxy-State }'; lf;
			nextPutAll: '                   * [ AVP ]'; lf;
			lf;
			nextPutAll: '      Failed-AVP ::= < AVP Header: 279 >'; lf;
			nextPutAll: '                  1* {AVP}'; lf;
			lf;
			yourself]