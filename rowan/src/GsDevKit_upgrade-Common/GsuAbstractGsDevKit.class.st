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
		'bootstrapExistingConfigurationList'
	],
	#category : 'GsDevKit_upgrade-Common'
}

{ #category : 'accessing' }
GsuAbstractGsDevKit class >> gemstone_user [

	^ (System gemEnvironmentVariable: 'GEMSTONE_USER')
		ifNil: [ 'DataCurator' ]
]

{ #category : 'private' }
GsuAbstractGsDevKit >> _configurationOfGLASS_bootstrap [
	"When doing a bootstrap load, this version of the ConfigurationOfGLASS needs to be loaded before loading BaselineOf"

	^ {
			{
				'ConfigurationOfGLASS'. 
				'1.0-beta.9.2.2'. 
				#('default'). 
				nil.	"nill - use bootstrapRepositoryDirectory"
			}.
		}
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
			self log: '	load BaselineOfMetacello BaselineOfTode'.
			"first update Metacello and then update Tode"
			^ self _configurationOfGLASS_bootstrap, {
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
			self log: '	load BaselineOfMetacello BaselineOfGLASS1'.
			"first update Metacello and then update GLASS1"
			^ self _configurationOfGLASS_bootstrap, {
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
			self log: '	load BaselineOfGsDevKit'.
			^ self _configurationOfGLASS_bootstrap, {	"assume that GsDevKit needs to be reloaded"
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
	^{	"assume that GLASS needs to be reloaded"
		 {
				'ConfigurationOfGLASS'. 
				'1.0-beta.9.2.2'. 
				#('default'). 
				nil.	"nill - use bootstrapRepositoryDirectory"
		}.
	}
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

{ #category : 'logging' }
GsuAbstractGsDevKit >> _logUpgradeParameters [

	| enabled |
	 
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
GsuAbstractGsDevKit >> _reloadProjectNamed: projectName projectSpec: projectSpecOrNilOrString [
	| specs metacello projectSpec repoSpec repoDescription |

	projectSpecOrNilOrString
		ifNil: [
			specs := (self _globalNamed: 'Metacello') image
				baseline: [ :spec | spec name = projectName ];
				list.
			specs isEmpty
				ifFalse: [ projectSpec := specs first ] ]
		ifNotNil: [ 
			(projectSpecOrNilOrString isKindOf: CharacterCollection)
				ifTrue: [ repoDescription :=  projectSpecOrNilOrString. ]
				ifFalse: [ repoDescription := projectSpecOrNilOrString repositoryDescriptions first ] ].
	self bannerLogDash.
	self bannerLogDash.
	repoDescription
		ifNotNil: [
			metacello := ((self _globalNamed: 'Metacello') new) 
				baseline: projectName;
				repository: repoDescription ]
		ifNil: [ 
			projectSpec notNil
				ifTrue: [ 
					self log: '		Reloading Project ', projectName printString.
					self bannerLogDash.
					metacello := ((self _globalNamed: 'Metacello') image) 
						baseline: projectName;
						yourself ]
				ifFalse: [ self error: 'Project spec not found for ', projectName printString ] ].
	self
		_deploy: [ 
		metacello copy get.
		metacello copy load ].
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

	| glass1Upgraded |
	self log: '	loading bootstrap application load specs'.

	"unload the 2.x only packages"
	(self _globalNamed: 'PackageInfo') registerPackageName: 'GemStone-Exceptions'.
	((self _globalNamed: 'MCWorkingCopy') forPackage: ((self _globalNamed: 'MCPackage') new name: 'GemStone-Exceptions')) unload.

	"start with a fresh package registry"
	(self _globalNamed: 'MCWorkingCopy') atClassInstVar: #registry put: nil.
	((self _globalNamed: 'PackageOrganizer') default instVarAt: ((self _globalNamed: 'PackageOrganizer') allInstVarNames indexOfIdentical: #'packages')) removeKey: 'Monticello-Mocks' ifAbsent: [].

	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"
	glass1Upgraded := false.
	self bootstrapApplicationLoadSpecs do: [:loadSpec |
		loadSpec size > 2
			ifTrue: [
				| path |
				path := (loadSpec at: 4) ifNil: [ self bootstrapRepositoryDirectory ].
				(self _globalNamed: 'Gofer') new 
					directory: ((self _globalNamed: 'ServerFileDirectory') on: path);
					package: (loadSpec at: 1);
					load ] ].
	System commit.

	"Now load the entire configuration to pick up user application code and to ensure
		that the in-memory package state is correct"

	self bootstrapApplicationLoadSpecs do: [:loadSpec | 
		loadSpec size = 1
			ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) projectSpec: nil ]
			ifFalse: [
				loadSpec size = 2
					ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) projectSpec: (loadSpec at: 2) ]
					ifFalse: [ 
						[
						| repoPath configurationClassName versionString loadList |
						configurationClassName := loadSpec at: 1.
						versionString := loadSpec at: 2.
						loadList := loadSpec at: 3.
						repoPath := (loadSpec at: 4) ifNil: [ self bootstrapRepositoryDirectory ].
						self log: '		', configurationClassName printString, ' version ', versionString printString , ' loads: ', loadList printString, ' from: ', repoPath printString.
						(self _globalNamed: 'GsDeployer') bulkMigrate: [ 
							| projectName |
							projectName := (self _globalNamed: 'MetacelloScriptEngine') configurationProjectNameOf: configurationClassName asString.
							(self _globalNamed: 'Metacello') new
								configuration: projectName;
								version: versionString;
								repositoryOverrides: { 'server://', repoPath };
								load: loadList ] ]
									on: (self _globalNamed: 'MCPerformPostloadNotification')
									do: [:ex |
										(self bootstrapPostLoadClassList includes: ex postloadClass theNonMetaClass name)
											ifTrue: [ 
												self log: '			Skip ', ex postloadClass name asString, ' initialization.'.
												ex resume: false ]
											ifFalse: [ 
												self log: '			Perform ', ex postloadClass name asString, ' initialization.'.
												ex resume: true ] ] ] ] ].
	self bannerLogDash.
	self bannerLogDash.

	System commit.

	self log: '	done (commit)'.
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
