tests
testMIP6AgentInfo
	| res |
	res := self parse: self class mip6AgentInfo.
	self assert: res equals: #(nil 'MIP6-Agent-Info' nil '::=' #(#($< 'AVP Header:' '486' nil $>) #() #(#(#(nil $* '2') $[ 'MIP-Home-Agent-Address' $]) #(nil $[ 'MIP-Home-Agent-Host' $]) #(nil $[ 'MIP6-Home-Link-Prefix' $]) #(#(nil $* nil) $[ 'AVP' $])))).