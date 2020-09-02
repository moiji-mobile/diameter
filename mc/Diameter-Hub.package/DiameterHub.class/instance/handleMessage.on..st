accessing
handleMessage: aDiameterNotification on: anIncomingConnection
	| msg |
	msg := aDiameterNotification diameterMessage. 
	"This drives the handling of a message."

	"Present the message as raw to quickly handle it."
	onPreRouting
		ifNotNil: [ :block | 
			(block cull: msg cull: anIncomingConnection)
				= DiameterHubVerdictDrop
				ifTrue: [ ^ self ] ].

	"Now use the diameter module to fully decode the message."
	diameterModule decode: msg.
	msg decodeAll.

	"Use a specific message handler by name."
	onHandle
		at: msg messageType messageName
		ifPresent: [ :handler | 
			(handler cull: msg cull: anIncomingConnection)
				= DiameterHubVerdictContinue
				ifTrue: [ ^ self ] ].

	"And now try the default handler."
	defaultHandler cull: msg cull: anIncomingConnection