as yet unclassified
exampleMessage
	^String streamContents: [:str |
		str
			nextPutAll: 'DPR ::= < Diameter Header: 282, REQ >'; lf;
         nextPutAll: ' { Origin-Host }'; lf;
         nextPutAll: ' { Origin-Realm }'; lf;
         nextPutAll: '{ Disconnect-Cause }'; lf;
         nextPutAll: ' * [ AVP ]'; lf]