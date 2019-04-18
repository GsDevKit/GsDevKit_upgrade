application loading
loadApplicationLoadSpecs

	"unload the 2.x only packages"
	(self _globalNamed: 'PackageInfo') registerPackageName: 'GemStone-Exceptions'.
	((self _globalNamed: 'MCWorkingCopy') forPackage: ((self _globalNamed: 'MCPackage') new name: 'GemStone-Exceptions')) unload.

	"start with a fresh package registry"
	(self _globalNamed: 'MCWorkingCopy') atClassInstVar: #registry put: nil.
	((self _globalNamed: 'PackageOrganizer') default instVarAt: ((self _globalNamed: 'PackageOrganizer') allInstVarNames indexOfIdentical: #'packages')) removeKey: 'Monticello-Mocks' ifAbsent: [].

	self bootstrapApplicationLoadSpecs isEmpty
		ifTrue: [
			"(re)load the bootstraPackageFileNames for GLASS"
			self _reloadBootstrapPackages ]
		ifFalse:  [
			"force configurations to be reloaded if needed"
			self removeExistingConfigurations.
			self skipLoadApplication
				ifTrue: [ self log: '	skip loading of bootstrapApplicationLoadSpecs' ]
				ifFalse: [ 
					"load each of the projects listed in boolStrapApplicationLoadSpecs"
					self _loadApplicationLoadSpecs: self bootstrapApplicationLoadSpecs ] ].

	"Now load the entire configuration to pick up user application code and to ensure
		that the in-memory package state is correct"

	self bannerLogDash.
	self bannerLogDash.

	System commit.