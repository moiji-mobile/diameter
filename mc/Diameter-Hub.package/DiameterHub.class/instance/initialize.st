accessing
initialize
	super initialize.
	connections := SmallDictionary new.
	onHandle := SmallDictionary new.
	defaultHandler := [ "do nothing" ]