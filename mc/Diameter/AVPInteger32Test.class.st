Class {
	#name : 'AVPInteger32Test',
	#superclass : 'AVPEncoderTestBase',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
AVPInteger32Test >> encoderClass [
	^AVPInteger32
]

{ #category : 'as yet unclassified' }
AVPInteger32Test >> roundtripData [
	^{
		{ #(16r00 16r00 16rFF 16rFE) asByteArray.
		  65534.
		}
	}
]
