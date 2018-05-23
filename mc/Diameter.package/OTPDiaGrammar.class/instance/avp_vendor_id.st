grammar
avp_vendor_id
	"@avp_vendor 1234567\n
	<blanks>
		<avp1>
		<avp2>
	"
	^'@avp_vendor_id' asParser trimSpaces, #digit asParser plus flatten trimSpaces trimBlanks,
		(comment / diameter_name) trimBlanks trimSpaces star