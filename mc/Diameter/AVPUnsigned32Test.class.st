Class {
	#name : 'AVPUnsigned32Test',
	#superclass : 'AVPEncoderTestBase',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
AVPUnsigned32Test >> encoderClass [
	^AVPUnsigned32
]

{ #category : 'as yet unclassified' }
AVPUnsigned32Test >> roundtripData [
	^{
		{ #(16r00 16r00 16rFF 16rFE) asByteArray.
		  65534.
		}
	}
]
