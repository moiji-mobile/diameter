as yet unclassified
optional_application_id
	^super optional_application_id ==> [:p |
		p ifNil: [nil] ifNotNil: [p asInteger]]