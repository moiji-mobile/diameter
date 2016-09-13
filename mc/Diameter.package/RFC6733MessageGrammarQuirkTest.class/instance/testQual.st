as yet unclassified
testQual
	self parse: '*' rule: #qual to: #(nil $* nil) end: 1.
	self parse: '*10' rule: #qual to: #(nil $* '10') end: 3.

	"Test quirk"
	self parse: ' * ' rule: #qual to: #(nil $* nil) end: 3.
	self parse: ' 1*' rule: #qual to: #('1' $* nil) end: 3.