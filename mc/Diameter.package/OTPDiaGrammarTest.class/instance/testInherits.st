tests
testInherits
	self
		parse: '@inherits abc_def'
		rule: #inherits
		to: #('@inherits' 'abc_def' #())
		end: 17.
	self
		parse: '@inherits abc_def Foo-1 Foo-2'
		rule: #inherits
		to: #('@inherits' 'abc_def' #('Foo-1' 'Foo-2'))
		end: 29.