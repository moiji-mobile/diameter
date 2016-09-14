messages
message
	"Parse the RFC6733 message here.. make a subclass be able to use
	the upcoming RFC6733MessageParserQuirk.."
	self flag: #todo.
	^RFC6733MessageGrammarQuirk new productionAt: #command_def