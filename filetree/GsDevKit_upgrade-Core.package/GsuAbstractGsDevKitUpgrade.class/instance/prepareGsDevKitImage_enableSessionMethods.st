prepare gsdevkit  image
prepareGsDevKitImage_enableSessionMethods

	| policy package targetSymbolDictionary |
	package := GsPackageLibrary createPackageNamed: #SessionMethods.
	GsPackageLibrary installPackage: package.
	policy := GsPackagePolicy current.
	targetSymbolDictionary := GsCurrentSession currentSession objectNamed:  self upgradeSymbolDictName.
	(targetSymbolDictionary isKindOf: SymbolDictionary)
	   ifFalse: [ self  error: self upgradeSymbolDictName, ' must be the name of a SymbolDictionary' ].
	policy homeSymbolDict:  targetSymbolDictionary.
	policy externalSymbolList: Array new.

	System commit.

	GsPackagePolicy current refreshSessionMethodDictionary. "no persistent state modified"

	self log: '	session methods enabled (commit)'.