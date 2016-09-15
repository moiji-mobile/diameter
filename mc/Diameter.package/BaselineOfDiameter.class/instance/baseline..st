as yet unclassified
baseline: spec
	<baseline>

	spec project: 'PetitParser' with: [
		spec
			className: #ConfigurationOfPetitParser;
			versionString: #stable;
			repository: 'http://smalltalkhub.com/mc/Moose/PetitParser/main';
			loads: #( 'Core' 'Tests' ) ].

	spec package: #Diameter with: [
		spec requires: #('PetitParser')].