accessing
bootstrapApplicationLoadSpecs
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	^ bootstrapApplicationLoadSpecs
		ifNil: [ 
			"only set the default if the current user is the upgrade user"
			self upgradeUserName = System myUserProfile userId ifFalse: [ ^#() ].
			bootstrapApplicationLoadSpecs := self _defaultBootstrapApplicationLoadSpecs ]