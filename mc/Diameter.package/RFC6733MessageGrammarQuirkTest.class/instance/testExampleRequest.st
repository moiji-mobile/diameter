as yet unclassified
testExampleRequest
	| res |
	res := self parse: self class exampleRequest.
	self assert: res equals: #(
		nil 'Example-Request' nil '::='
		#(
			#( #($< 'Diameter' 'Header' $:) '9999999' ', REQ' ', PXY' nil '' $>)
			#()
			#( #(nil ${ 'User-Name' $} ) #( #('1' $* nil) ${ 'Origin-Host' $} )
			   #( #( nil $* nil) $[ 'AVP' $]) )
		))