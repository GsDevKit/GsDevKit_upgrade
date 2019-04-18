private
_reloadBootstrapPackages
	"(re)load the bootstraPackageFileNames for GLASS"

	| dir |
	self skipLoadApplication
		ifTrue: [ 
			self log: '	skip reloading bootstrap packages'.
			^ self ].
	self log: '	reloading bootstrap packages from ', self bootstrapRepositoryDirectory.
	dir := (self _globalNamed: 'ServerFileDirectory') on: self bootstrapRepositoryDirectory.
	self targetGemStoneRelease reloadBootstrapPackageFileNames do: [:bootstrapPackageFileName |
		| packageVersion |
		packageVersion := bootstrapPackageFileName copyFrom: 1 to: bootstrapPackageFileName size - '.mcz' size.
		self log: '			', packageVersion, '	', bootstrapPackageFileName .
		(self _globalNamed: 'Gofer') new 
			directory: dir;
			version: packageVersion;
			load ]