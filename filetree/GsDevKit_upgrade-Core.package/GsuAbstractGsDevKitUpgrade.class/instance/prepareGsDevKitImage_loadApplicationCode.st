prepare gsdevkit  image
prepareGsDevKitImage_loadApplicationCode
	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"

	"load application code"

	self log: 'Prepare gsdevkit - load GsDevKit application code'.

	"force configurations to be reloaded if needed"
	self removeExistingConfigurations.

	"now load application"


self log: '	prepareGsDevKitImage_loadApplicationCode'.
	self loadApplicationLoadSpecs.

self log: '	prepareGsDevKitImage_loadApplicationCode'