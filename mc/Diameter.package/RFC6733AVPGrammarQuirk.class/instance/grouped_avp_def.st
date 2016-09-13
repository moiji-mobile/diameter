as yet unclassified
grouped_avp_def
	"They forgot the <> at some points.."
	^$< asParser optional trimSpaces, name trimSpaces, $> asParser optional trimSpaces, '::=' asParser trimSpaces, avp