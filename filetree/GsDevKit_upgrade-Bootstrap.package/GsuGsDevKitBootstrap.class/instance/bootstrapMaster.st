bootstrapping
bootstrapMaster
	"formerly $upgradeDir/bootstrapMaster30.topaz"

	| undef |
	self timeStampedLog: '	bootstrap master'.

	self logBootstrapParameters.

	undef := SymbolDictionary new.
	undef name: #UndefinedSymbols.
	self _currentUserGlobals at: #UndefinedSymbols put: undef.
	self _currentUserGlobals at: #UndefinedSymbolList put: (SymbolList with: undef).

	GsPackagePolicy current enable.

	"Patch for bug 44262"
	GsPackageLibrary 
	  installMonticelloPackagesHome: self upgradeSymbolDict
	  during: [:ignored |
		"put PositionableStream>>originalContents in session methods"
		(PositionableStream 
		  compileMethod: self _bootstrap_positionableStream_original_contents_patchSource 
		  dictionaries: GsCurrentSession currentSession symbolList 
		  category: '*squeak') ifNotNil: [:ar | self error: 'did not compile' ] ].

	"removing list of classes in GLASS1 packages, but not GLASS bootstrap packages ... classes will 
		be re-added and all methods will be recomplied that may have referenced these classes"
	#( 'GsFailedMethodCompilationDuringCopyMethodToNewClass' 'GsNonmigratingDeployer' )
		do: [:className |
			self _removeClassNamed: className ].

	"enable the GsPackages that were disabled during upgradeImage (this is 3.5.0 and beyond specific)"
	self upgradeUserProfile symbolList do:[:dict | | dName |
		dName := dict name ifNil:[ 'unnamed' ].
		(dict at: GsPackage globalName otherwise: nil) ifNotNil:[:pkg |
			pkg name == #SessionMethods 
				ifFalse:[
					pkg removeAllMethods .
					pkg enable .
					self log: '	', pkg name asString, ' enabled' ] ] ].

	System commit.

	self bootstrapGemStoneRelease bootstrapPackageFileNames do: [:bootstrapPackageFileName |
		GsPackageLibrary 
			loadMCZFile: bootstrapPackageFileName
			home: self upgradeSymbolDictName
			fromRepositoryPath: self bootstrapRepositoryDirectory ].

	self log: '	... done bootstrap master'.