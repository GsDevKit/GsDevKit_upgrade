accessing
bootstrapApplicationLoadSpecs
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	^ bootstrapApplicationLoadSpecs
		ifNil: [ bootstrapApplicationLoadSpecs := self _defaultBootstrapApplicationLoadSpecs ]