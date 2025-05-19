"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestDiameter',
	#superclass : 'PackageManifest',
	#category : 'Diameter-Grammar',
	#package : 'Diameter',
	#tag : 'Grammar'
}

{ #category : 'code-critics' }
ManifestDiameter class >> ruleRBInstanceVariableCapitalizationRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#RFC6733MessageGrammar)) #'2016-09-13T09:57:39.597504+02:00') )
]
