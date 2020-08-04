as yet unclassified
baseline: spec
	<baseline>

	spec baseline: 'PetitParser' with: [
		spec
			repository: 'github://moosetechnology/PetitParser:v2.2.0/src';
			loads: #( 'Core' 'Tests' ) ].

	spec package: #Diameter with: [
		spec requires: #('PetitParser')].