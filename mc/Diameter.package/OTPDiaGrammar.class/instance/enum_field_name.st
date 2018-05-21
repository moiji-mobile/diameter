enum
enum_field_name
	^((ALPHA / $' asParser), (ALPHA / DIGIT / $- asParser / $_ asParser / $. asParser) star, $' asParser optional) flatten