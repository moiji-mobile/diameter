as yet unclassified
exampleRequest
	^String streamContents: [:str |
		str
			nextPutAll: 'Example-Request ::= < Diameter Header: 9999999, REQ, PXY >'; lf;
			nextPutAll: ' { User-Name }'; lf;
			nextPutAll: ' 1* { Origin-Host }'; lf;
         nextPutAll: ' * [ AVP ] '; lf].