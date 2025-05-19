"
I represent the RFC6733 grammar for messages with some minor tweaks.  My children can either further specialize or parse real world messages
"
Class {
	#name : 'RFC6733MessageGrammar',
	#superclass : 'RFC6733BaseGrammar',
	#instVars : [
		'command_def',
		'r_bit',
		'p_bit',
		'e_bit',
		'application_id',
		'command_id',
		'command_name',
		'diameter_message',
		'header'
	],
	#category : 'Diameter-Grammar',
	#package : 'Diameter',
	#tag : 'Grammar'
}

{ #category : 'digits' }
RFC6733MessageGrammar >> application_id [
	^digits
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammar >> avp_name [
	"The string 'AVP' stands for *any* arbitrary AVP
    Name, not otherwise listed in that Command Code
    definition.  The inclusion of this string
    is recommended for all CCFs to allow for
    extensibility."
	^avp_spec / 'AVP' asParser
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammar >> command_def [
	^$< asParser,  command_name, $> asParser, '::=' asParser,  diameter_message
]

{ #category : 'digits' }
RFC6733MessageGrammar >> command_id [
	"The Command Code assigned to the command"
	^digits
]

{ #category : 'digits' }
RFC6733MessageGrammar >> command_name [
	^diameter_name
]

{ #category : 'digits' }
RFC6733MessageGrammar >> diameter_message [
	^header, fixed star, required star, optional star
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammar >> e_bit [
	"If present, the 'E' bit in the Command
    Flags is set, indicating that the answer
    message contains a Result-Code AVP in
    the ""protocol error"" class."
	^', ERR' asParser
]

{ #category : 'digits' }
RFC6733MessageGrammar >> header [
	^'<Diameter-Header:' asParser, command_id, r_bit optional, p_bit optional, e_bit optional, application_id optional, $> asParser
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammar >> p_bit [
	"If present, the 'P' bit in the Command
    Flags is set, indicating that the message
    is proxiable."
	^', PXY' asParser
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammar >> r_bit [
	"If present, the 'R' bit in the Command
    Flags is set, indicating that the message
    is a request as opposed to an answer."
	^ ', REQ' asParser
]

{ #category : 'as yet unclassified' }
RFC6733MessageGrammar >> start [
	^command_def end
]
