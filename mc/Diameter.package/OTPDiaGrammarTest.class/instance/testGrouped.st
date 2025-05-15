tests
testGrouped
	self
		parse: self class exampleGrouped
		rule: #grouped
		to: {'@grouped'. {{';;'. ' comment'. Character lf}. #(nil 'Proxy-Info' nil '::=' #(#($< 'AVP Header:' '284' nil $>) #() #(#(nil ${ 'Proxy-Host' $}) #(nil ${ 'Proxy-State' $}) #(#(nil $* nil) $[ 'AVP' $])))). #(nil 'Failed-AVP' nil '::=' #(#($< 'AVP Header:' '279' nil $>) #() #(#(#('1' $* nil) ${ 'AVP' $}))))}}
		end: 235.
		