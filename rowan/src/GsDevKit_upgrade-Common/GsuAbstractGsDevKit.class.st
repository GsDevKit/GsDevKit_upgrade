Class {
	#name : 'GsuAbstractGsDevKit',
	#superclass : 'Object',
	#instVars : [
		'upgradeUserName',
		'upgradeSymbolDict',
		'upgradeSymbolDictName',
		'bootstrapPostLoadClassList',
		'bootstrapRepositoryDirectory',
		'bootstrapApplicationLoadSpecs',
		'bootstrapExistingConfigurationList',
		'skipLoadApplication'
	],
	#category : 'GsDevKit_upgrade-Common'
}

{ #category : 'accessing' }
GsuAbstractGsDevKit class >> gemstone_user [

	^ (System gemEnvironmentVariable: 'GEMSTONE_USER')
		ifNil: [ 'DataCurator' ]
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _currentUserGlobals [

	^ GsSession currentSession objectNamed: #UserGlobals
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _defaultBootstrapApplicationLoadSpecs [
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	self _todeLoaded
		ifTrue: [
			self log: '	load BaselineOfMetacello and BaselineOfTode (default)'.
			"first update Metacello and then update Tode"
			^	{
				{
					'Metacello'. 
					self _projectSpecForBaseline: 'BaselineOfMetacello'.
				}.
				{
					'Tode'. 
					self _projectSpecForBaseline: 'BaselineOfTode'.
				}.
			} ].
	self _glass1Loaded
		ifTrue: [
			self log: '	load BaselineOfMetacello and BaselineOfGLASS1 (default)'.
			"first update Metacello and then update GLASS1"
			^	{
				{
					'Metacello'. 
					self _projectSpecForBaseline: 'BaselineOfMetacello'.
				}.
				{
					'GLASS1'. 
					self _projectSpecForBaseline: 'BaselineOfGLASS1'.
				}.
			} ].
	self _gsDevKitLoaded
		ifTrue: [
			self log: '	load BaselineOfMetacello and BaselineOfGsDevKit (default)'.
			^	{	"assume that GsDevKit needs to be reloaded"
				{
					'Metacello'. 
					self _projectSpecForBaseline: 'BaselineOfMetacello'.
				}.
				 {
					'GsDevKit'. 
					self _projectSpecForBaseline: 'BaselineOfGsDevKit'.
				}.
			} ].
	self log: '	load ConfigurationOfGLASS'.
	^{}
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _defaultBootstrapPostLoadClassList [
	"formerly BootstrapApplicationPostloadClassList, list of classes that should not be initialized during bootstrap"

	^ { #SecureHashAlgorithm . #MCFileTreeFileDirectoryUtils  }
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _defaultBootstrapRepositoryDirectory [
	"formerly BootstrapRepositoryDirectory, location of Monticello bootstrap directory"

	^ GsPackageLibrary getMonticelloRepositoryDirectory
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _defaultConfigurationOfGLASS [
	"If the bootstrap project changes name or version, then this method needs to be re-implemented for the affected upgrade classes"

	^ {
			'GLASS'. 
			'1.0-beta.9.2.2'. 
			#('default'). 
			nil.	"nill - use bootstrapRepositoryDirectory"
		}.
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _deploy: aBlock [
	(self _globalNamed: #'GsDeployer')
	ifNil: [ 
		| oldAutoCommit oldAutoMigrate platformSupportClass |
		platformSupportClass := self _globalNamed: 'MCPlatformSupport'.
		oldAutoCommit := platformSupportClass autoCommit.
		oldAutoMigrate := platformSupportClass autoMigrate.
		platformSupportClass autoCommit: true.
		platformSupportClass autoMigrate: true.
		[ platformSupportClass commitOnAlmostOutOfMemoryDuring: aBlock ]
			ensure: [ 
				platformSupportClass autoCommit: oldAutoCommit.
				platformSupportClass autoMigrate: oldAutoMigrate ] ]
	ifNotNil: [ :deployerClass | deployerClass deploy: aBlock ]
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _gemstone_user [

	^ self class gemstone_user
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _glass1Loaded [
  ^ self _standardBaselineLoaded: 'BaselineOfGLASS1'
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _glassLoaded [
	"GLASS is loaded when neither tODE, GLASS1, nor GsDevKit is loaded"

	^ (self _todeLoaded or: [ self _glass1Loaded or: [ self _gsDevKitLoaded ] ]) not
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _globalNamed: aString [

	^ GsSession currentSession objectNamed: aString
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _gsDevKitLoaded [
  ^ self _standardBaselineLoaded: 'BaselineOfGsDevKit'
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _listUpgradeParameters [

	^ #( bootstrapPostLoadClassList bootstrapApplicationLoadSpecs )
]

{ #category : 'application loading' }
GsuAbstractGsDevKit >> _loadApplicationLoadSpecs: applicationLoadSpecs [

	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"
	applicationLoadSpecs do: [:loadSpec |
		loadSpec size = 4
			ifTrue: [
				"ConfigurationOf load spec"
				| path |
				path := (loadSpec at: 4) ifNil: [ self bootstrapRepositoryDirectory ].
				(self _globalNamed: 'Gofer') new 
					directory: ((self _globalNamed: 'ServerFileDirectory') on: path);
					package: 'ConfigurationOf', (loadSpec at: 1);
					load ] ].
	System commit.

	"Now load the entire configuration to pick up user application code and to ensure
		that the in-memory package state is correct"

	applicationLoadSpecs do: [:loadSpec | 
		loadSpec size = 1
			ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) projectSpec: nil loads: nil ]
			ifFalse: [
				loadSpec size = 2
					ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) projectSpec: (loadSpec at: 2) loads: nil ]
					ifFalse: [ 
						loadSpec size = 3
							ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) projectSpec: (loadSpec at: 2) loads: (loadSpec at: 3) ]
							ifFalse: [ 
								[
								| repoPath configurationClassName versionString loadList |
								configurationClassName := 'ConfigurationOf', (loadSpec at: 1).
								versionString := loadSpec at: 2.
								loadList := loadSpec at: 3.
								repoPath := (loadSpec at: 4) ifNil: [ self bootstrapRepositoryDirectory ].
								self log: '		', configurationClassName printString, ' version ', versionString printString , ' loads: ', loadList printString, ' from: ', repoPath printString.
								(self _globalNamed: 'GsDeployer') bulkMigrate: [ 
									| projectName |
									projectName := loadSpec at: 1.
									(self _globalNamed: 'Metacello') new
										configuration: projectName;
										version: versionString;
										repositoryOverrides: { 'server://', repoPath };
										onConflict: [ :ex :loaded :incoming | ex useIncoming ];
										load: loadList ] ]
											on: (self _globalNamed: 'MCPerformPostloadNotification')
											do: [:ex |
												(self bootstrapPostLoadClassList includes: ex postloadClass theNonMetaClass name)
													ifTrue: [ 
														self log: '			Skip ', ex postloadClass name asString, ' initialization.'.
														ex resume: false ]
													ifFalse: [ 
														self log: '			Perform ', ex postloadClass name asString, ' initialization.'.
														ex resume: true ] ] ] ] ] ].
	System commit.
]

{ #category : 'logging' }
GsuAbstractGsDevKit >> _logUpgradeParameters [

	self log: '	session methods ', (GsPackagePolicy enabled ifTrue: [ '(enabled)' ] ifFalse: [ '(disabled)' ]).
	self _singletonUpgradeParameters do: [:selectorSymbol |
		self log: '	', selectorSymbol asString, ' : ', (self perform: selectorSymbol) ].

	self _listUpgradeParameters do: [:selectorSymbol |
		self log: '	', selectorSymbol asString, ' : '.
		[ (self perform: selectorSymbol) 
			do: [:entry | self log: '		', entry printString ] 
		] on: Error do: [:ex  | self log: '			error extracting parameter ', ex description printString ] ]
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _projectSpecForBaseline: baselineClassName [
	"Have to extract project spec from regsitry without sending messages, because methods may need to be recompiled"

	"should only apply when doing bootstrap loads"

	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
		(self _globalNamed: 'MetacelloProjectRegistration')
			ifNotNil: [ :cls | 
				| registry baselineRegistry |
				registry := cls _classVars at: #Registry.
				baselineRegistry := registry instVarAt: (registry class allInstVarNames indexOf: #baselineRegistry).
				(baselineRegistry at: baselineClassName ifAbsent: [ ] )
					ifNotNil: [ :registration | 
						^ registration instVarAt: (registration class allInstVarNames indexOf: #baselineProjectSpec). ] ] ].
	^ nil "calculate project spec at load time"
]

{ #category : 'application loading' }
GsuAbstractGsDevKit >> _reloadProjectNamed: projectName projectSpec: projectSpecOrNilOrString loads: loads [
	| specs metacello projectSpec repoDescription loadList loadListString |
	loadList := {}.
	loads ifNotNil: [ loadList := loads ].
	projectSpecOrNilOrString
		ifNil: [
			specs := (self _globalNamed: 'Metacello') image
				baseline: [ :spec | spec name = projectName ];
				list.
			specs isEmpty
				ifFalse: [ 
					projectSpec := specs first.
					loads ifNil: [
						loadList := projectSpec loads.
						loadList ifNil: [ loadList := {}] ] ] ]
		ifNotNil: [ 
			(projectSpecOrNilOrString isKindOf: CharacterCollection)
				ifTrue: [ repoDescription :=  projectSpecOrNilOrString. ]
				ifFalse: [ 
					repoDescription := projectSpecOrNilOrString repositoryDescriptions first.
					loads ifNil: [ loadList := projectSpecOrNilOrString loads ifNil: [ {} ] ] ] ].
	loadListString := ''.
	loadList isEmpty 
		ifFalse:  [ loadListString := ' loads: ', loadList printString ].

	repoDescription
		ifNotNil: [
			self bannerLog: '		Reloading Project ', projectName, ' repository: ', repoDescription printString, loadListString.
			metacello := ((self _globalNamed: 'Metacello') new) 
				baseline: projectName;
				repository: repoDescription ]
		ifNil: [ 
			projectSpec notNil
				ifTrue: [
					self bannerLog: '		Reloading Project ', projectName printString, loadListString.
					metacello := ((self _globalNamed: 'Metacello') image) 
						baseline: projectName;
						yourself ]
				ifFalse: [ self error: 'Project spec not found for ', projectName printString ] ].
	System commit. "commit so that reload failure can be debugged"
	self
		_deploy: [
		metacello copy get.
		loadList isEmpty ifFalse:  [ metacello load: loadList ].
		metacello onConflict: [ :ex :loaded :incoming | ex useIncoming ].
		metacello load ].
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _resetMonticelloPackageRegistry [

	"unload the 2.x only packages"
	self log: '	unload 2.x only packages'.
	(self _globalNamed: 'PackageInfo') registerPackageName: 'GemStone-Exceptions'.
	((self _globalNamed: 'MCWorkingCopy') forPackage: ((self _globalNamed: 'MCPackage') new name: 'GemStone-Exceptions')) unload.

	"start with a fresh package registry"
	self log: '	reset Monticello package registry'.
	(self _globalNamed: 'MCWorkingCopy') atClassInstVar: #registry put: nil.
	((self _globalNamed: 'PackageOrganizer') default instVarAt: ((self _globalNamed: 'PackageOrganizer') allInstVarNames indexOfIdentical: #'packages')) removeKey: 'Monticello-Mocks' ifAbsent: [].
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _singletonUpgradeParameters [

	^ #( upgradeUserName upgradeSymbolDictName bootstrapRepositoryDirectory )
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _standardBaselineLoaded: baselineClassName [
	"Have to extract information from regsitry without sending messages, because methods may need to be recompiled"

	"see subclass implementation for message-based implementation"

	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
		(self _globalNamed: 'MetacelloProjectRegistration')
			ifNotNil: [ :cls | 
				| registry baselineRegistry |
				registry := cls _classVars at: #Registry.
				baselineRegistry := registry instVarAt: (registry class allInstVarNames indexOf: #baselineRegistry).
				(baselineRegistry at: baselineClassName ifAbsent: [ ] )
					ifNotNil: [ :registration | 
					^ (registration instVarAt:  (registration class allInstVarNames indexOf: #loadedInImage)) == true ] ] ].
	^ false
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _todeLoaded [
  ^ self _standardBaselineLoaded: 'BaselineOfTode'
]

{ #category : 'logging' }
GsuAbstractGsDevKit >> bannerLog: aString [

	self bannerLogDash.
	self log: aString.
	self bannerLogDash.
]

{ #category : 'logging' }
GsuAbstractGsDevKit >> bannerLogDash [

	self log: '--------------------'.
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapApplicationLoadSpecs [
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	^ bootstrapApplicationLoadSpecs
		ifNil: [ 
			"only set the default if the current user is the upgrade user"
			self upgradeUserName = System myUserProfile userId ifFalse: [ ^#() ].
			bootstrapApplicationLoadSpecs := self _defaultBootstrapApplicationLoadSpecs ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapApplicationLoadSpecs: loadSpecArray [
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	bootstrapApplicationLoadSpecs := loadSpecArray
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapExistingConfigurationList [
	"formerly BootstrapExistingConfigurationList, list of configuration names that should be removed"

	^ bootstrapExistingConfigurationList
		ifNil: [ bootstrapExistingConfigurationList := {} ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapExistingConfigurationList: configurationNames [
	"formerly BootstrapExistingConfigurationList, list of configuration names that should be removed"

	bootstrapExistingConfigurationList := configurationNames
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapPostLoadClassList [
	"formerly BootstrapApplicationPostloadClassList, list of classes that should not be initialized during bootstrap"

	^ bootstrapPostLoadClassList
		ifNil: [ bootstrapPostLoadClassList := self _defaultBootstrapPostLoadClassList ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapPostLoadClassList: aListOfClassNameSymbols [
	"formerly BootstrapApplicationPostloadClassList, list of application classes that should not be initialized during bootstrap"

	"make sure that the _default list are included ... they are required"

	bootstrapPostLoadClassList := ( aListOfClassNameSymbols, self _defaultBootstrapPostLoadClassList) asIdentitySet asArray
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapRepositoryDirectory [
	"formerly BootstrapRepositoryDirectory, location of Monticello bootstrap directory"

	^ bootstrapRepositoryDirectory
		ifNil: [ bootstrapRepositoryDirectory := self _defaultBootstrapRepositoryDirectory ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> bootstrapRepositoryDirectory: directoryPath [
	"formerly BootstrapRepositoryDirectory, location of Monticello bootstrap directory"

	bootstrapRepositoryDirectory := directoryPath
]

{ #category : 'application loading' }
GsuAbstractGsDevKit >> loadApplicationLoadSpecs [

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
]

{ #category : 'logging' }
GsuAbstractGsDevKit >> log: aString [

	GsFile gciLogServer: aString
]

{ #category : 'application loading' }
GsuAbstractGsDevKit >> removeExistingConfigurations [

	"Remove the known list of Metacello configuration classes (they have either had their methods removed or 
		may not be the write versoin of the package, either way they need to be reloaded."

	| count |

	self log: '	removing configuration classes'.

	ClassOrganizer clearCachedOrganizer.

	count := self bootstrapExistingConfigurationList size.
	self bootstrapExistingConfigurationList do: [:class | 
		self log: '		', class name.
		class removeFromSystem ].
	self log: '	done removing configuration classes (', count asString, ')'.

	"set the cache repository"
	(self _globalNamed: 'MCCacheRepository') 
		ifNotNil: [:mCCacheRepository | 
			mCCacheRepository setDefault: (self _globalNamed: 'MCDictionaryRepository') new ].
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> skipLoadApplication [

	^ skipLoadApplication ifNil: [ skipLoadApplication := false ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> skipLoadApplication: aBool [

	skipLoadApplication := aBool
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeSymbolDict [
	"Formerly known as BootstrapSymbolDictionary ... the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDict ifNil: [ upgradeSymbolDict:= (AllUsers userWithId: self upgradeUserName) symbolList objectNamed: self upgradeSymbolDictName ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeSymbolDictName [
	"Formerly known as BootstrapSymbolDictionaryName ... the name of the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDictName ifNil: [ #UserGlobals ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeSymbolDictName: aSymbol [
	"Formerly known as BootstrapSymbolDictionaryName ... the name of the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDictName := aSymbol
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeUserName [

	^ upgradeUserName ifNil: [ upgradeUserName := self _gemstone_user ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeUserName: aString [

	upgradeUserName := aString
]

{ #category : 'accessing' }
GsuAbstractGsDevKit >> upgradeUserProfile [

	^ (AllUsers userWithId: self upgradeUserName)
]
