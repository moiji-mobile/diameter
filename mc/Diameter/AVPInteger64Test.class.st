Class {
	#name : 'AVPInteger64Test',
	#superclass : 'AVPEncoderTestBase',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
AVPInteger64Test >> encoderClass [
	^AVPInteger64
]

{ #category : 'as yet unclassified' }
AVPInteger64Test >> roundtripData [
	^{
		{ #(16r00 16r00 16r00 16r00 16r00 16r00 16rFF 16rFE) asByteArray.
		  65534.
		}.
	}
]
