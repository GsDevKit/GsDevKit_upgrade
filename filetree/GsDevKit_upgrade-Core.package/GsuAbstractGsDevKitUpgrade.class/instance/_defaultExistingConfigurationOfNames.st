private
_defaultExistingConfigurationOfNames
	"When bootstrapping all of the ConfigurationOfs present in image, should be removed"

	| configurationOfClassNames |
	configurationOfClassNames := {}.
	self upgradeSymbolDict associationsDo: [:assoc |
	   assoc value isBehavior
		   ifTrue: [
			   (assoc key asString _findString: 'ConfigurationOf' startingAt: 1 ignoreCase: false) == 1 
				  ifTrue: [ configurationOfClassNames add: assoc value ] ] ].
	^ configurationOfClassNames