as yet unclassified
qual
	"See ABNF conventions, RFC 5234, Section 4.
    The absence of any qualifier depends on
    whether it precedes a fixed, required, or
    optional rule.  If a fixed or required rule has
    no qualifier, then exactly one such AVP MUST
    be present.  If an optional rule has no
    qualifier, then 0 or 1 such AVP may be
    present.  If an optional rule has a qualifier,
    then the value of min MUST be 0 if present."
	^(min optional, $* asParser, max optional) trimSpaces