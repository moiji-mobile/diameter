as yet unclassified
exampleEnum
	^String streamContents: [:str |
		str
			nextPutAll: '@enum Disconnect-Cause'; lf;
			lf;
			nextPutAll: '  '; lf;
			nextPutAll: ' ;; bla bla comment'; lf;
			nextPutAll: '   REBOOTING                      0'; lf;
			nextPutAll: '   BUSY                           1'; lf;
			nextPutAll: '   DO_NOT_WANT_TO_TALK_TO_YOU     2'; lf]