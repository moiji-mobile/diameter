avp_types
avp_types
	"@avp_types\n
	<blanks>
		<type1>
		<type2>
	"
	^'@avp_types' asParser trimBlanks trimSpaces,
		(comment / avp_type) trimBlanks trimSpaces plus