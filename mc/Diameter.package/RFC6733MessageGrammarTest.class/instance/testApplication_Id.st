as yet unclassified
testApplication_Id
		self parse: '01234A' rule: #application_id to: '01234' end: 5.
		self parse: '01234A' rule: #application_id to: '01234' end: 5.
		self fail: 'ABC' rule: #application_id.