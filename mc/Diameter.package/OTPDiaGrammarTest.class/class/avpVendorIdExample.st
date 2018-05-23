as yet unclassified
avpVendorIdExample
	^String streamContents: [:str |
		str
			nextPutAll: '@avp_vendor_id 1234'; lf;
			nextPutAll: 'Realm-Foo'; lf;
			nextPutAll: 'Other-Ident' ]