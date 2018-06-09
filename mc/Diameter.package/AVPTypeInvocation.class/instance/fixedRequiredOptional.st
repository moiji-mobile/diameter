printing
fixedRequiredOptional
	self isOptional ifTrue: [  ^ #optional ].
	self isFixed ifTrue: [ ^ #fixed ].
	self isRequired ifTrue: [ ^ #required ].