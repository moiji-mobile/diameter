as yet unclassified
command_def
	"Orig:
		command-def      = '<' command-name '>' '::=' diameter-message
	Fixes:
		* Allow spaces between <abc>__::=__
		* Make < > optional around the command name
		* Swallow anything at the end..
	"
	^$< asParser optional, command_name, $> asParser optional,
		'::=' asParser trimSpaces,
		diameter_message