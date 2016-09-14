enum
enum

	^('@enum' asParser / '@define' asParser) trimSpaces, diameter_name trimSpaces trimBlanks,
		(comment / enum_field) trimBlanks trimSpaces plus
	