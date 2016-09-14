grammar
comment
	"Parse ;; until the end of a line"
	| cr lf |
	cr := Character cr.
	lf := Character lf.
	^';;' asParser,
		(PPPredicateObjectParser anyExceptAnyOf: {lf. cr}) star flatten,
		(lf asParser / cr asParser).  