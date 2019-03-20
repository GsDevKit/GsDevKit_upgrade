private
_defaultConfigurationOfGLASS
	"If the bootstrap project changes name or version, then this method needs to be re-implemented for the affected upgrade classes"

	^ {
			'GLASS'. 
			'1.0-beta.9.2.2'. 
			#('default'). 
			nil.	"nill - use bootstrapRepositoryDirectory"
		}.