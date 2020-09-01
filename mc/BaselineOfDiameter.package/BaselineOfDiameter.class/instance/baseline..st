as yet unclassified
baseline: spec
	<baseline>
	spec
		baseline: 'PetitParser'
		with: [ spec
				repository: 'github://moosetechnology/PetitParser:v2.2.0/src';
				loads: #('Core' 'Tests') ].
	spec
		baseline: 'OsmoNetwork'
		with: [ spec repository: 'github://moiji-mobile/osmocom-network:v9/source' ].
	spec package: #Diameter with: [ spec requires: #('PetitParser') ].
	spec
		package: #'Diameter-Network'
		with: [ spec requires: #('OsmoNetwork') ].
	spec
		group: 'default' with: #('Diameter');
		group: 'network' with: #('default' 'Diameter-Network');
		group: 'all' with: #('default' 'network')