private
_defaultExistingConfigurationOfNames
	" These two configurations are the only configurations that must be removed, before loading GLASS1 or GsDevKit or tODE"

	| default |
	default := { #ConfigurationOfGsMisc . #ConfigurationOfGsCore }.
false ifTrue: [ 	self _glassLoaded 
		ifTrue: [ 
			"if we are loading GLASS, the ConfigurationOfGLASS needs to be reloaded as well"
			default 
				add: #ConfigurationOfGLASS;
				add: #ConfigurationOfGsMonticello ] ].
	^ default