inherits
inherits
	"@inherits module_name Optional-Avp-Name Optional-Avp-Name"
	^'@inherits' asParser trimSpaces,
		(#word asParser / $- asParser / $_ asParser) star flatten trimSpaces,
		diameter_name flatten trimSpaces star 