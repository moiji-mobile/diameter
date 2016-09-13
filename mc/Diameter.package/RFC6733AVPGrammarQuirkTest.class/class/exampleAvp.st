as yet unclassified
exampleAvp
	^String streamContents: [:str |
		str
			nextPutAll: 'Example-AVP  ::= < AVP Header: 999999 >'; lf;
         nextPutAll: '  { Origin-Host }'; lf;
         nextPutAll: '1*{ Session-Id }'; lf;
         nextPutAll: ' *[ AVP ]'; lf;
			yourself]