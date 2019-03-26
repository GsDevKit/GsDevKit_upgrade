bootstrapping
bootstrapGlass

	"bootstrrap GLASS 1.0-beta.9.2.2' "

	self log: '	bootstrap GLASS 1.0-beta.9.2.2'.

	"force configurations to be reloaded if needed"
	self removeExistingConfigurations.

	self _resetMonticelloPackageRegistry.

	"install the default version of GLASS"
	self log: '	install GLASS 1.0-beta.9.2.2'.
	self _loadApplicationLoadSpecs: { self _defaultConfigurationOfGLASS }.
	self bannerLogDash.
	self bannerLogDash.

	self log: '	... bootstrapped GLASS 1.0-beta.9.2.2'.