as yet unclassified
testAvp_Spec
	self parse: 'Hello-World' rule: #avp_spec to: 'Hello-World' end: 11.
	self parse: 'AVP' rule: #avp_spec to: 'AVP' end: 3.
	self fail: '0Hello-World' rule: #avp_spec.