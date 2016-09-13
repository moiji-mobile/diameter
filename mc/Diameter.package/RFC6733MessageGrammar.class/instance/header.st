digits
header
	^'<Diameter-Header:' asParser, command_id, r_bit optional, p_bit optional, e_bit optional, application_id optional, $> asParser