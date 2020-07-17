prepare gsdevkit  image
prepareGsDevKitImage_loadApplicationCode
	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"

	"load application code"

	self timeStampedLog: 'Prepare gsdevkit - load GsDevKit application code'.

	"force configurations to be reloaded if needed"
	self removeExistingConfigurations.

	"now load application"

	self loadApplicationLoadSpecs.

	self log: '		load GsDevKit application code DONE (commit)'.