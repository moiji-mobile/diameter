as yet unclassified
mip6AgentInfo
	^String streamContents: [:stream |
		stream
			nextPutAll: 'MIP6-Agent-Info ::= <AVP Header: 486>'; lf;
			nextPutAll: '  * 2 [ MIP-Home-Agent-Address ]'; lf;
			nextPutAll: '      [ MIP-Home-Agent-Host ]'; lf;
			nextPutAll: '      [ MIP6-Home-Link-Prefix ]'; lf;
			nextPutAll: '  *   [ AVP ]'
	 ]