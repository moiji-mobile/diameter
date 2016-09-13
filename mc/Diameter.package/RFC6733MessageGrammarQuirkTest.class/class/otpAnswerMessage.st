as yet unclassified
otpAnswerMessage
	^String streamContents: [:str |
		str
			nextPutAll: 'answer-message ::= < Diameter Header: code, ERR [PXY] >'; lf;
			nextPutAll: '0*1 < Session-Id >'; lf;
         nextPutAll: '{ Origin-Host }'; lf;
         nextPutAll: '{ Origin-Realm }'; lf;
         nextPutAll: '{ Result-Code }'; lf;
         nextPutAll: '[ Origin-State-Id ]'; lf;
         nextPutAll: '[ Error-Message ]'; lf;
         nextPutAll: '[ Error-Reporting-Host ]'; lf;
         nextPutAll: '[ Failed-AVP ]'; lf;
         nextPutAll: '[ Experimental-Result ]'; lf;
         nextPutAll: '* [ Proxy-Info ]'; lf;
         nextPutAll: '* [ AVP ]'; lf;
			yourself
	]