enum
enum_field_name
	^((ALPHA / DIGIT / $' asParser), (ALPHA / DIGIT / $- asParser / $_ asParser / $. asParser / $: asParser / $( asParser / $) asParser / $, asParser) star, $' asParser optional) flatten