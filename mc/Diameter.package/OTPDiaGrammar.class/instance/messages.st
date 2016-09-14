messages
messages
	"@message\n
	<blanks>
		<message1>
		<message2>
	"
	^'@messages' asParser trimBlanks trimSpaces,
		(comment / message) trimBlanks trimSpaces plus