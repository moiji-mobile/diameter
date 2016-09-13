as yet unclassified
required
	"The AVP MUST be present and can appear
    anywhere in the message."
	^(qual optional, ${ asParser trimSpaces, avp_spec, $} asParser trimSpaces) trimBlanks