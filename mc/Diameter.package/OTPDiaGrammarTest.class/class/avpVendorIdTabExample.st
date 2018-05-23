as yet unclassified
avpVendorIdTabExample
	^String streamContents: [:str |
		str
			nextPutAll: '@avp_vendor_id'; nextPutAll: Character tab asString; nextPutAll: ' 1234'; lf;
			nextPutAll: 'Realm-Foo'; lf;
			nextPutAll: 'Other-Ident' ]