as yet unclassified
optional
	"The avp-name in the 'optional' rule cannot
    evaluate to any AVP Name that is included
    in a fixed or required rule.  The AVP can
    appear anywhere in the message.

    NOTE:  '[' and ']' have a slightly different
    meaning than in ABNF.  These braces
    cannot be used to express optional fixed rules
    (such as an optional ICV at the end).  To do
    this, the convention is '0*1fixed'."
	^(qual optional, $[ asParser trimSpaces, avp_spec, $] asParser trimSpaces) trimBlanks