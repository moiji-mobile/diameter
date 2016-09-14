as yet unclassified
testAvp_Types
	self
		parse: self class exampleAvpType
		rule: #avp_types
		to: {'@avp_types'. {
			{';;'. ' comment'. Character lf}.
			#('Acct-Interim-Interval' '85' 'Unsigned32' $M).
			#('Accounting-Realtime-Required' '483' 'Enumerated' $M)}}
		end: 140.