as yet unclassified
sectName
	^'@name' asParser trimSpaces, (#word asParser / $- asParser / $_ asParser) star flatten