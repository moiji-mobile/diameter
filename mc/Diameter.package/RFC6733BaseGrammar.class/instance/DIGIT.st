RFC5234
DIGIT
	"RFC5234
	A range of alternative numeric values can be specified compactly,
   using a dash ('-') to indicate the range of alternative values.
   Hence:
         DIGIT       =  %x30-39
   is equivalent to:
DIGIT = '0'/'1'/'2'/'3'/'4'/'5'/'6'/ '7' / '8' / '9'"
	^#digit asParser