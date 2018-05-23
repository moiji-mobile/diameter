as yet unclassified
testAvp_Vendor_id

	self
		parse: self class avpVendorIdExample
		rule: #avp_vendor_id
		to: #('@avp_vendor_id' '1234' #('Realm-Foo' 'Other-Ident'))
		end: 41.

	self
		parse: self class avpVendorIdTabExample
		rule: #avp_vendor_id
		to: #('@avp_vendor_id' '1234' #('Realm-Foo' 'Other-Ident'))
		end: 42.
