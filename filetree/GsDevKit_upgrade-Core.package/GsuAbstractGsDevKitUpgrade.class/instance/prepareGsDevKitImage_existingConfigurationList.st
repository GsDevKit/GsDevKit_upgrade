prepare gsdevkit  image
prepareGsDevKitImage_existingConfigurationList

	"Generate list of loaded configuration classes to be removed only the #_defaultExistingConfigurationOfNames need be removed,
		since they will be used during loading of GLASS, GLASS1, GsDevKit, and tODE"

	self bootstrapExistingConfigurationList isEmpty ifFalse: [ "already set" ^ self ].
	self timeStampedLog: '	create existing configuration list (commit)'.

   self _defaultExistingConfigurationOfNames
		do: [:className |
			(self upgradeSymbolDict at: className ifAbsent: [])
				ifNotNil: [:configurationOfClass |
				   configurationOfClass isBehavior
					   ifTrue: [
								  self log: '		', className asString.
								  self bootstrapExistingConfigurationList add: configurationOfClass ] ] ].
	System commit.
	self log: '	existing configuration collected (', self bootstrapExistingConfigurationList size asString, ')'.