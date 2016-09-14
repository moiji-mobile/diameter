as yet unclassified
rfcProxyInfo
	^String streamContents: [:str |
		str
			nextPutAll: 'Proxy-Info ::= < AVP Header: 284 >'; lf;
			nextPutAll: ' { Proxy-Host }'; lf;
			nextPutAll: ' { Proxy-State }'; lf;
         nextPutAll: ' * [ AVP ]'; lf;
			yourself]