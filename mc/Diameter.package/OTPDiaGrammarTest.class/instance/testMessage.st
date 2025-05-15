tests
testMessage
	self
		parse: self class exampleMessage
		rule: #message
		to: #(nil 'DPR' nil '::=' #(#(#($< 'Diameter' 'Header' $:) '282' ', REQ' nil nil nil $>) #() #(#(nil ${ 'Origin-Host' $}) #(nil ${ 'Origin-Realm' $}) #(nil ${ 'Disconnect-Cause' $}) #(#(nil $* nil) $[ 'AVP' $]))))
		end: 105.
		