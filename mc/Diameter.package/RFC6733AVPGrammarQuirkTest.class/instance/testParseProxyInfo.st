as yet unclassified
testParseProxyInfo
	| res |
	res := self parse: self class rfcProxyInfo.
	self assert: res equals: #(nil 'Proxy-Info' nil '::=' #(#($< 'AVP Header:' '284' nil $>) #() #(#(nil ${ 'Proxy-Host' $}) #(nil ${ 'Proxy-State' $})) #(#(#(nil $* nil) $[ 'AVP' $])))).