initialization
printElementsOn: aStream
	"The original code used #skip:, but some streams do not support that,
	 and we don't really need it."

	aStream nextPut: $(.
	elements
		do: [ :element | aStream print: element ]
		separatedBy: [ aStream
				nextPut: $,;
				space ].
	aStream nextPut: $)