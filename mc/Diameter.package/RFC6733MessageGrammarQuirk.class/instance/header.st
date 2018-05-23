as yet unclassified
header
	"
	Original:
	   header           = '<Diameter-Header:' command-id
                         [r-bit] [p-bit] [e-bit] [application-id]'>'
	Fixes:
		* < ___ Diameter__Header___:___'>
		* Spaces between the fields..
		* OTP has ERR [PXY] in the RFC it is ERR [, PXY] which would not be valid either
		but is meant as a place holder. So quirk around it. Also code as a general place
		holder for the request message."
	^('<Diameter-Header:' asParser /
			($< asParser trimSpaces, 'Diameter' asParser trimSpaces, 'Header' asParser trimSpaces,
				$: asParser)) trimSpaces,
		(command_id / 'code' asParser) trimSpaces,
		r_bit optional trimSpaces, p_bit optional trimSpaces, (e_bit optional trimSpaces),
		optional_application_id,
		$> asParser trimBlanks