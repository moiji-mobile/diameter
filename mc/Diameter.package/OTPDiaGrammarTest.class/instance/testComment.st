tests
testComment
	self
		parse: ';;123', Character lf asString, 'long long long long long'
		rule: #comment
		to: {';;'. '123'. Character lf}
		end: 6.