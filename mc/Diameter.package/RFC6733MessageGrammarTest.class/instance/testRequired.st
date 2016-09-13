as yet unclassified
testRequired
	self parse: '{AVP}' rule: #required to: #(nil ${ 'AVP' $}) end: 5.
	self parse: '*{AVP}' rule: #required to: #(#(nil $* nil) ${ 'AVP' $}) end: 6.
	self parse: '*2{AVP}' rule: #required to: #(#(nil $* '2') ${ 'AVP' $}) end: 7.
	self parse: '1*3{AVP}' rule: #required to: #(#('1' $* '3') ${ 'AVP' $}) end: 8.

	"whitespace extension"
	self parse: ' * { AVP } ' rule: #required to: #(#(nil $* nil) ${ 'AVP' $}) end: 11.