prepare gsdevkit  image
prepareGsDevKitImage_loadApplicationCode
	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"

	"load application code"

	self timeStampedLog: 'Prepare gsdevkit - load GsDevKit application code'.

	"now load application"

	self loadApplicationLoadSpecs.

	self _reloadExistingConfigurations.

	self log: '		load GsDevKit application code DONE (commit)'.