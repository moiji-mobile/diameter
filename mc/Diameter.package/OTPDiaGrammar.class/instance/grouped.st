grammar
grouped
	"@grouped\n
	<blanks>
		<message1>
		<message2>
	"
	^'@grouped' asParser trimBlanks trimSpaces,
		(comment / group) trimBlanks trimSpaces plus