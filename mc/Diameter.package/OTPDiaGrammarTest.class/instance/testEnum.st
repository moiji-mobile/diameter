as yet unclassified
testEnum
	self
		parse: self class exampleEnum
		rule: #enum
		to: {'@enum'. 'Disconnect-Cause'. {{';;'. ' bla bla comment'. Character lf}. #('REBOOTING' '0'). #('BUSY' '1'). #('DO_NOT_WANT_TO_TALK_TO_YOU' '2')}}
		end: 155.