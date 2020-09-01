parsing
parseModule: aStream on: aModule
	(self parse: aStream) do: [ :each | each otpApplyOn: aModule ].