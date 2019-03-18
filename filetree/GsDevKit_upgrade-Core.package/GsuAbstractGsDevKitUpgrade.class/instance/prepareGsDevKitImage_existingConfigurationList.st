prepare gsdevkit  image
prepareGsDevKitImage_existingConfigurationList

	"Generate list of loaded configuration classes to be removed"

	self bootstrapExistingConfigurationList isEmpty ifFalse: [ "already set" ^ self ].
	self log: '	create existing configuration list (commit)'.

   self upgradeSymbolDict associationsDo: [:assoc |
	   assoc value isBehavior
		   ifTrue: [
			   (assoc key asString _findString: 'ConfigurationOf' startingAt: 1 ignoreCase: false) == 1 
				  ifTrue: [
					  self log: '		', assoc key asString.
					  self bootstrapExistingConfigurationList add: assoc value ] ] ].
	System commit.
	self log: '	existing configuration collected (', self bootstrapExistingConfigurationList size asString, ')'.