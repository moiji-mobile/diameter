RFC 6733 (diameter base) parser and toolkit

Parse Diameter AVP groups and messages and convert them to a
model. The model can be used to generate efficient C/C++ codec
code and a highly flexible Smalltalk toolkit.

## Installation

To install diameter on your Pharo image, execute the following script: 

```Smalltalk
Metacello new
	githubUser: 'moiji-mobile' project: 'diameter' commitish: 'master' path: 'mc';
	baseline: 'Diameter';
	load
```

To add diameter to your baseline:

```Smalltalk
spec
	baseline: 'Diameter'
	with: [ spec repository: 'github://moiji-mobile/diameter:master/mc' ]
```

Note you can replace the #master by another branch such as #development or a tag such as #v1.

## Smalltalk versions compatibility

| Version 	| Compatible Pharo versions    |
|-------------	|------------------------------|
| master       	| Pharo 80, 90, 10, 11, 12, 13 |