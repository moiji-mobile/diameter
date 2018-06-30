as yet unclassified
avpBaseTypeFor: aString 
	aString = 'UTF8String' ifTrue: [
		^AVPUTF8String].
	aString = 'OctetString' ifTrue: [
		^AVPOctetString].
	aString = 'Unsigned32' ifTrue: [
		^AVPUnsigned32].
	aString = 'Unsigned64' ifTrue: [
		^AVPUnsigned64].
	aString = 'Integer32' ifTrue: [
		^AVPInteger32].
	aString = 'Integer64' ifTrue: [
		^AVPInteger64].
	aString = 'Enumerated' ifTrue: [
		^AVPEnumerated].
	aString = 'Time' ifTrue: [
		^AVPTime].
	aString = 'Address' ifTrue: [ 
		^AVPAddress].
	aString = 'Grouped' ifTrue: [
		^AVPGrouped].
	(#('DiameterIdentity' 'DiamIdent') includes: aString) ifTrue: [
		^AVPDiameterIdentity].
	(#('DiameterURI' 'DiamURI') includes: aString) ifTrue: [
		^AVPDiameterURI].
	aString = 'IPFilterRule' ifTrue: [
		^AVPIPFilterRule].
	aString = 'QoSFilterRule' ifTrue: [
		^AVPQoSFilterRule].
	^self error: 'Unknown type ', aString