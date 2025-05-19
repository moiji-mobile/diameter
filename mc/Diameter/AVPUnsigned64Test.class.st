Class {
	#name : 'AVPUnsigned64Test',
	#superclass : 'AVPEncoderTestBase',
	#category : 'Diameter-Tests',
	#package : 'Diameter',
	#tag : 'Tests'
}

{ #category : 'as yet unclassified' }
AVPUnsigned64Test >> encoderClass [
	^AVPUnsigned64
]

{ #category : 'as yet unclassified' }
AVPUnsigned64Test >> roundtripData [
	^{
		{ #(16r00 16r00 16r00 16r00 16r00 16r00 16rFF 16rFE) asByteArray.
		  65534.
		}.
		{ #(16r5A 16rBD 16rDB 16rF9 16r13 16r37 16rF7 16r31) asByteArray.
		  6538624096827602737.
		}.
	}
]
