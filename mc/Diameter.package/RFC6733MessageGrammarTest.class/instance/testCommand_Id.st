as yet unclassified
testCommand_Id
		self parse: '01234A' rule: #command_id to: '01234' end: 5.
		self parse: '01234A' rule: #command_id to: '01234' end: 5.
		self fail: 'ABC' rule: #command_id.