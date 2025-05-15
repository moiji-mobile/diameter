tests
testExampleAvp
	| res |
	res := self parse: self class exampleAvp.
	self assert: res equals: #(nil 'Example-AVP' nil '::=' #(#($< 'AVP Header:' '999999' nil $>) #() #(#(nil ${ 'Origin-Host' $}) #(#('1' $* nil) ${ 'Session-Id' $}) #(#(nil $* nil) $[ 'AVP' $])))).
