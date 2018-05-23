as yet unclassified
testMessages
	self
		parse: self class exampleMessages
		rule: #messages
		to: {'@messages'. {{';;'. ' Some comment'. Character lf}. #(nil 'DWR' nil '::=' #(#(#($< 'Diameter' 'Header' $:) '280' ', REQ' nil nil nil $>) #() #(#(nil ${ 'Origin-Host' $}) #(nil ${ 'Origin-Realm' $}) #(nil $[ 'Origin-State-Id' $]) #(#(nil $* nil) $[ 'AVP' $])))). #(nil 'DWA' nil '::=' #(#(#($< 'Diameter' 'Header' $:) '280' nil nil nil nil $>) #() #(#(nil ${ 'Result-Code' $}) #(nil ${ 'Origin-Host' $}) #(nil ${ 'Origin-Realm' $}) #(nil $[ 'Error-Message' $]) #(nil $[ 'Failed-AVP' $]) #(nil $[ 'Origin-State-Id' $]) #(#(nil $* nil) $[ 'AVP' $]))))}}
		end: 441.
		