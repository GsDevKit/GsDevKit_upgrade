"
I am the abstract upgrade driver for upgading GsDevKit/GLASS repositories.

I am invoked after the repository has undergone the standard 
`$GEMSTONE/bin/upgradeIage` step.

I am invoked by the `$GEMSTONE/upgrade/upgradeSeasideImage script.

There are three basic phases of thed GsDevKit/GLASS upgrade process:
	1. prepare image for upgrade.
	2. bootstrap the correct version of the GsDevKit/GLASS classes for the target
		 GemStone version.
	3. install application code

### Prepare image for upgrade
### Bootsrap GsDevKit/GLASS support classes
### Install application
 
"
Class {
	#name : 'GsuAbstractGsDevKitUpgrade',
	#superclass : 'GsuAbstractGsDevKit',
	#instVars : [
		'sourceGemStoneRelease',
		'targetGemStoneRelease',
		'methodsWithPragmas'
	],
	#classVars : [
		'TheSymbolDictionary'
	],
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade class >> _calculateUpgradeClass [
	| imageVersion |
	imageVersion := ImageVersion at: #'gsVersion'.
	(imageVersion beginsWith: '3.5')
		ifTrue: [ ^ GsuGsDevKit_3_5_x_Upgrade ].
	(imageVersion beginsWith: '3.6')
		ifTrue: [ ^ GsuGsDevKit_3_6_x_Upgrade ].
	(imageVersion beginsWith: '3.7')
		ifTrue: [ ^ GsuGsDevKit_3_7_x_Upgrade ].
	self error: 'Image version ' , imageVersion printString , ' not supported'
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade class >> _calculateUpgradedVersion [
	| upgradedVersionInt |
	upgradedVersionInt := self _upgradedVersionInt.
	upgradedVersionInt = 37
		ifTrue: [ ^ GsuGemStone_3_7_x_Release new ].
	upgradedVersionInt = 36
		ifTrue: [ ^ GsuGemStone_3_6_x_Release new ].
	upgradedVersionInt = 35
		ifTrue: [ ^ GsuGemStone_3_5_x_Release new ].
	upgradedVersionInt = 34
		ifTrue: [ ^ GsuGemStone_3_4_x_Release new ].
	upgradedVersionInt = 33
		ifTrue: [ ^ GsuGemStone_3_3_x_Release new ].
	upgradedVersionInt = 32
		ifTrue: [ ^ GsuGemStone_3_2_x_Release new ].
	self
		error:
			'Upgrades from GemStone versions earlier than 3.2.0'
				, ' are not currently supported (upgradedVersionInt: '
				, upgradedVersionInt printString , ').'
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade class >> _globalName [

	^ #GsDevKit_Upgrade_Cache
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade class >> _installSymDictInSymbolList [
	| dictName symbolName session symbolList |

	dictName := 'GsDevKit_SymDict'.
	symbolName := dictName asSymbol.
	session := GsCurrentSession currentSession.
	symbolList := session symbolList.
	symbolList
		detect: [ :each | (each at: symbolName ifAbsent: [ nil ]) == each ]
		ifNone: [ 
			| theDict size |
			theDict := self _symbolDictionary ifNil: [
				SymbolDictionary new
					name: symbolName;
					objectSecurityPolicy: symbolList objectSecurityPolicy;
					yourself ].
			size := System myUserProfile symbolList size.
			System myUserProfile insertDictionary: theDict at: size + 1 ].
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade class >> _symbolDictionary [
	"Install classes in a separate symbol dictionary, so the cleasses can be easily installed/removed in/from an image"

	^ TheSymbolDictionary ifNil: [ TheSymbolDictionary :=	((AllUsers userWithId: 'SystemUser') objectNamed: #UserGlobals) at: self _globalName ifAbsent: [] ].
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade class >> _symbolDictionary: aSymbolDictionary [
	"Install classes in a separate symbol dictionary, so the cleasses can be easily installed/removed in/from an image"

	((AllUsers userWithId: 'SystemUser') objectNamed: #UserGlobals) at: self _globalName put: aSymbolDictionary.
	TheSymbolDictionary:= aSymbolDictionary
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade class >> _upgradedVersionInt [
	"return a 2 digit SmallInteger that represents the GemStone version being upgraded from"

	| ofs hist |
	(hist := Globals at: #'DbfHistory' otherwise: nil)
		ifNil: [ ^ GsPackagePolicy _originVersion ].
	ofs := hist
		_findLastString: 'upgrade to GemStone'
		startingAt: hist size
		ignoreCase: true.
	ofs > 0
		ifTrue: [ 
			"Trim off the last upgrade version so we can get the previous."
			hist := hist copyFrom: 1 to: ofs - 1 ].
	ofs == 0
		ifTrue: [ 
			(ImageVersion at: #'gsVersion' otherwise: nil)
				ifNotNil: [ :iVer | 
					ofs := 1.
					hist := '  v' , iVer , '  ' ] ].
	ofs ~~ 0
		ifTrue: [ 
			#(37 36 35 34 33 32)
				do: [ :ver | 
					| num vStr |
					num := ScaledDecimal numerator: ver denominator: 10 scale: 1.
					vStr := 'v' , num asString , '.'.
					(hist
						matchPattern:
							{$*.
							vStr.
							$*})
						ifTrue: [ ^ ver ].
					vStr := ' ' , num asString , '.'.
					(hist
						matchPattern:
							{$*.
							vStr.
							$*})
						ifTrue: [ ^ ver ] ] ].
	^ GsPackagePolicy _originVersion
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> sourceGemStoneRelease: sourceRelease [

	^ self new
		upgradeUserName: self gemstone_user;
		sourceGemStoneRelease: sourceRelease;
		resolveForUpgrade
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> upgradeUserName: aString [

	^ self
		upgradeUserName: aString 
		upgradeSymbolDictName: nil
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> upgradeUserName: aString sourceGemStoneRelease: sourceRelease [

	^ self 
		upgradeUserName: aString 
		upgradeSymbolDictName: nil 
		sourceGemStoneRelease: sourceRelease
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> upgradeUserName: aString upgradeSymbolDictName: aSymbol [ 

	^ self _calculateUpgradeClass
		upgradeUserName: aString 
		upgradeSymbolDictName: aSymbol 
		sourceGemStoneRelease: self _calculateUpgradedVersion
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> upgradeUserName: aString upgradeSymbolDictName: aSymbol sourceGemStoneRelease: sourceRelease [

	^ (self new
			upgradeUserName: aString;
			upgradeSymbolDictName: aSymbol;
			yourself)
				sourceGemStoneRelease: sourceRelease;
				resolveForUpgrade
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _bootstrapRelease [

	self subclassResponsibility: #_bootstrapRelease
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _defaultExistingConfigurationOfNames [
	"When bootstrapping all of the ConfigurationOfs present in image, should be removed"

	| configurationOfClassNames |
	configurationOfClassNames := {}.
	self upgradeSymbolDict associationsDo: [:assoc |
	   assoc value isBehavior
		   ifTrue: [
			   (((assoc key asString _findString: 'ConfigurationOf' startingAt: 1 ignoreCase: false) == 1 ) 
				or: [ (assoc key asString _findString: 'BaselineOf' startingAt: 1 ignoreCase: false) == 1 ])
				  ifTrue: [ configurationOfClassNames add: assoc key ] ] ].
	^ configurationOfClassNames
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _defaultTargetRelease [

	self subclassResponsibility: #_defaultTargetRelease
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _prepareGsDevKitImage_validate_session_methods [
	"return list of session methos that need recompilation"

	| methodsNeedingRecompilation |
	methodsNeedingRecompilation := {}.
	System myUserProfile symbolList
		do: [ :dict | 
			| dName |
			dName := dict name ifNil: [ 'unnamed' ].
			(dict at: GsPackage globalName otherwise: nil)
				ifNotNil: [ :pkg | 
					pkg sessionMethods keysAndValuesDo: [ :class :ar | 
						| methodDict |
						methodDict := ar at: 1.
						methodDict values
							do: [ :meth | 
								meth needsRecompile
									ifTrue: [ methodsNeedingRecompilation add: meth ] ] ] ] ].
	^ methodsNeedingRecompilation
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _prepareGsDevKitImage_validate_user_methods [
	"return list of methos in upgrade symbol dictionary that need recompilation"

	| methodsNeedingRecompilation |
	methodsNeedingRecompilation := {}.
	self upgradeSymbolDict valuesDo: [:global |
		global isBehavior
			ifTrue: [ 
				(global persistentMethodDictForEnv: 0) 
					ifNotNil: [:methodDict | methodDict values do: [:meth |
						meth needsRecompile
							ifTrue: [ methodsNeedingRecompilation add: meth ] ] ].
				(global class persistentMethodDictForEnv: 0) 
					ifNotNil: [:methodDict | methodDict values do: [:meth |
						meth needsRecompile
							ifTrue: [ methodsNeedingRecompilation add: meth ] ] ] ] ].
	^ methodsNeedingRecompilation
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _prepareImage_behavior_compileMethod_Category_patchSource [

	^  'compileMethod: source category: cat
  | errorString |
  [ 
  self
    compileMethod: source
    category: cat
    using: GsSession currentSession symbolList ]
    onException: CompileError
    do: [ :ex | 
      errorString := GsNMethod
        _sourceWithErrors: ex errorDetails
        fromString: ex sourceString ].
  errorString
    ifNotNil: [ 
      self
        error:
          ''Compile error in Class: '' , self name printString , '' method: '' , errorString.	"if user continues from the error, we return the errorString"
      ^ errorString ].
  ^ nil	"return nil to indicate no errors"'
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _prepareImage_class_bug46217_patchSource [

	^  'removeFromSystem
  "Bug 46217 - during bootstrap don''t remove any classes.
    during initial bootstrap no classes will be removed
    during upgrade unexpected classes should not be removed during the
      bootstrap operation"'
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _prepareImage_mcgemstoneplatform_bug46217_patchSource [

	^'removeClassFromSystem: aClass

  ((GsSession currentSession objectNamed: #UserGlobals) 
      at: #''GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS'' ifAbsent: [ false ]) 
    ifTrue: [
      "Bug 46217 - during bootstrap don''t remove any classes.
        during initial bootstrap no classes will be removed
        during upgrade unexpected classes should not be removed during the
          bootstrap operation" ]
    ifFalse: [
	| ar |
	aClass subclasses isEmpty not ifTrue: [ ^self error: ''class has subclasses'' ].
	ar := System myUserProfile dictionaryAndSymbolOf: aClass.
	ar ifNil: [ ^self error: ''class not found in current user profile'' ].
	(ar at: 1) removeKey: (ar at: 2) ]'
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _prepareImage_pragmas_withPragmas_source [
	"3.3.x source for Pragma>>withPragmasIn:do: ... needed to extract pragmas from the 3.3.x prgama data structures"

	^'withPragmasIn: aClass do: aBlock
(aClass methodDictForEnv: 0) keysAndValuesDo: [ :selector :method | 
	| pragmas methodPragmaDict eDict selSym |
	selSym := Symbol _existingWithAll: selector.
  selSym ifNil: [ ^ #() ].
	pragmas := GsPackagePolicy currentOrNil
		ifNotNil: [ :pp | pp pragmasForMethod: selSym in: aClass ].
	pragmas ifNotNil: [ ^ pragmas ].
	(eDict := self extraDict) ifNil: [ ^ #() ].
	(methodPragmaDict := eDict at: self pragmaDictName otherwise: nil)
		ifNil: [ ^ #() ].
  ^ methodPragmaDict at: selSym otherwise: #() ]'
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _prepareImage_user_class_bug46059_patchSource [

	^ 'removeFromSystem
| ar |
  ar := System myUserProfile dictionaryAndSymbolOf: self.
  ar ifNotNil: [ (ar at: 1) removeKey: (ar at: 2) ].'
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _reloadBootstrapPackages [
	"(re)load the bootstraPackageFileNames for GLASS"

	"reload can only be done when no method recompilation is required"

	"noop"

	self log: '		_reloadBootstrapPackages noop'
]

{ #category : 'debugging' }
GsuAbstractGsDevKitUpgrade >> _upgradeClassOops [
	"answer a dictionary whose keys are class names and whose values are the oop of the named class."

	"
		(UserGlobals at: #GsDevKit_Image_Upgrade) _upgradeClassOops
	or
		(((AllUsers userWithId: 'SystemUser') 
		objectNamed: #UserGlobals) 
			at: #'GsDevKit_Image_Upgrade') _upgradeClassOops
	"

	| dict |
	dict := Dictionary new.
	self class _symbolDictionary keysAndValuesDo: [:className :class |
		dict at: className put: class asOop ].
	^dict
]

{ #category : 'bootstrapping' }
GsuAbstractGsDevKitUpgrade >> bootstrapGsDevkit [

	"install GLASS from scratch"

	"used to create extent0.seaside.dbf"

	^ (GsuGsDevKitBootstrap
		upgradeUserName: self upgradeUserName
			upgradeSymbolDictName: self upgradeSymbolDictName
			bootstrapGemStoneRelease: self _bootstrapRelease)
		bootstrapPostLoadClassList: self bootstrapPostLoadClassList;
		bootstrapRepositoryDirectory: self bootstrapRepositoryDirectory;
		bootstrapApplicationLoadSpecs: bootstrapApplicationLoadSpecs; 
		bootstrapExistingConfigurationList: self bootstrapExistingConfigurationList;
		bootstrapGsDevkit;
		yourself
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> buildString [

	" 
		Standard -	method recompilation not required
		Bootstrap -	method recompilation required 
	"

	^ 'Bootstrap'
]

{ #category : 'logging' }
GsuAbstractGsDevKitUpgrade >> logUpgradeParameters [
	self timeStampedLog: 'Upgrade parameters'.

	self bannerLogDash.

	self
		log:
			'Upgrading from ' , self sourceGemStoneRelease printString , ' to '
				, self printString.

	self _logUpgradeParameters.

	self bannerLogDash
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> major [

	^ 3
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> methodsWithPragmas [

	^ methodsWithPragmas ifNil: [ methodsWithPragmas := {} ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> minor [

	self subclassResponsibiity: #minor
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> patch [

	self subclassResponsibiity: #patch
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage [
	"formerly done by $GEMSTONE/upgrade/prepareSeasideImage"

	"
		1. prepareImage
		2. prepareImage_pragma_user
		3. prepareImage_pragma_systemuser
		4. prepareImage_user
		5. prepareGsDevKitImage.
	"

	"run as gsdevkit user"

	self prepareGsDevKitImageBanner.
	self log: 'Prepare gsdevkit image'.
	self updateDBFHistoryStartUpgrade.
	self sourceGemStoneRelease
		prepareGsDevKitImage_patch45952: self;
		prepareGsDevKitImage_existingConfigurationList: self;
		prepareGsDevKitImage_enableSessionMethods: self;
		prepareGsDevKitImage_clearMonticelloCaches: self;
		prepareGsDevKitImage_removeAllMethods: self;
		prepareGsDevKitImage_patch46217: self;
		prepareGsDevKitImage_patch_compileMethodCategory: self;
		prepareGsDevKitImage_recompilePragmaMethods: self;
		prepareGsDevKitImage_patch49622: self;
		prepareGsDevKitImage_patch__optionsForDefinition: self;
		prepareGsDevKitImage_removeObsoleteClasses: self;
		prepareGsDevKitImage_bootstrapGsDevkit: self;
		prepareGsDevKitImage_resetExistingGlobalState: self;
		prepareGsDevKitImage_cleanSessionMethodMetaData: self;
		yourself.
	self updateDBFHistoryFinishUpgrade.
	System commit.
	self sourceGemStoneRelease
		prepareGsDevKitImage_loadApplicationCode: self;
		prepareGsDevKitImage_validation: self;
		yourself.
	self log: '	finished gsdevkit image (commit)'.
	self prepareGsDevKitImageDoneBanner
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_bootstrapGsDevkit [

	"install GLASS from scratch"

	self timeStampedLog: 'Prepare gsdevkit - bootstrap GLASS1'.

	self upgradeGlass1
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_bug46217_patch [

	"Bug 46217 - during bootstrap don''t remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"

	self timeStampedLog: 'Prepare gsdevkit - patch 46217'.

	GsPackageLibrary 
	  installMonticelloPackagesHome: self upgradeSymbolDict
	  during: [:globals | 
		(Class
		  compileMethod: self _prepareImage_class_bug46217_patchSource
		dictionaries: GsCurrentSession currentSession symbolList
		category: '*change-notification') ifNotNil: [:ar | self error: 'did not compile' ].
	  ].

	System commit.

	self log: '	46217 patched (commit)'.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_bug49622_patch [
	"Bug 49622 - starting in 3.7.0 ReadByteStream an optimized version of ReadStream should be used 
		in GLASS applications instead of AnsiReadStream in subclasses of SequenceableCollection"

	"noop for pre-3.7.0 upgrades"
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_cleanSessionMethodMetaData [
	"remove all instances of GsMethod from session method packages"

	"noop"
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_clearMetacelloCaches [

	"GLASS needs to have the caches cleared, since stale repository entries can cause trouble"

	"Metacello caches used in calculating default values for application load specs, so cache
		application load specs before clearing the Metacello cache"

	self timeStampedLog: 'Prepare gsdevkit - clear Metacello caches'.

	self bootstrapApplicationLoadSpecs.
	(self _globalNamed: #MetacelloProjectRegistration)
	  ifNotNil: [:cl | cl _classVars at: #Registry put: nil ].
	System commit.

	self log: '	Metacello caches cleared (commit)'.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_clearMonticelloCaches [

	" clear caches - those that are unneeded or create problem during initial bootstrap load"

	self timeStampedLog: 'Prepare gsdevkit - clear Monticello caches'.

	"MCDefinition clearInstances"
	(self _globalNamed: 'MCDefinition') _classVars at: #Instances put: nil.
	"MCMethodDefinition shutdown"
	(self _globalNamed: 'MCMethodDefinition') _classVars at: #Definitions put: nil.
	"MethodVersionHistory reset"
	self _currentUserGlobals removeKey: #MethodVersionHistory_UniqueInstance ifAbsent: [].
	"clear out PackageOrganizer default class instance variable"
	(self _globalNamed: 'PackageOrganizer') atClassInstVar: #default put: nil.
	"clear out McCacheRepository default class instance variable"
	(self _globalNamed: 'MCCacheRepository') atClassInstVar: #default put: nil.
	"wipe out the working copy registry ... will be redefined later"
	(self _globalNamed: 'MCPackageManager') atClassInstVar: #registry put: nil.
	(self _globalNamed: 'MCWorkingCopy') atClassInstVar: #registry put: nil.
	"wipe out the default MCRepositoryGroup"
	(self _globalNamed: 'MCRepositoryGroup') atClassInstVar: #default put: nil.

	System commit.

	self log: '	Monticello caches cleared (commit)'.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_enableSessionMethods [

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
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_existingConfigurationList [

	"Generate list of loaded configuration classes to be removed only the #_defaultExistingConfigurationOfNames need be removed,
		since they will be used during loading of GLASS, GLASS1, GsDevKit, and tODE"

	self bootstrapExistingConfigurationList isEmpty ifFalse: [ "already set" ^ self ].
	self timeStampedLog: '	create existing configuration list (commit)'.

   self _defaultExistingConfigurationOfNames
		do: [:className |
			(self upgradeSymbolDict at: className ifAbsent: [])
				ifNotNil: [:configurationOfClass |
				   configurationOfClass isBehavior
					   ifTrue: [
								  self log: '		', className asString.
								  self bootstrapExistingConfigurationList add: configurationOfClass ] ] ].
	System commit.
	self log: '	existing configuration collected (', self bootstrapExistingConfigurationList size asString, ')'.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_loadApplicationCode [
	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"

	"load application code"

	self timeStampedLog: 'Prepare gsdevkit - load GsDevKit application code'.

	"force configurations to be reloaded if needed"
	self removeExistingConfigurations.

	"now load application"

	self loadApplicationLoadSpecs.

	self log: '		load GsDevKit application code DONE (commit)'.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_patch__optionsForDefinition [
	"_optionsForDefinition replaced by _optionsStringForDefinition in 3.6. Not used during upgrade until 3.7.0 upgrade. See _moveClassNamed:toNewSuperclassNamed:"

	"noop until 3.7.0"
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_patch_compileMethodCategory [
	"patch only needed suring standard upgrade ..."

	"noop"
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_patch45952 [

	"bug 45952 ... image/bootstrapMaster.topaz for 3.1.0.6 ignored BootstrapSymbolDictionaryName"

	| ug |
	ug := self _currentUserGlobals.
	self upgradeSymbolDict == ug 
		ifTrue: [ 
			"not exposed to bug"
			^ self ].
	self upgradeSymbolDict size > 1
		ifTrue: [
			"not exposed to bug"
			^ self ].
	self 
		timeStampedLog: '	BootstrapSymbolDictionary ignored during initial bootstrap of GLASS into non-UserGlobals SymbolDictionary.';
		log: '	Transferring Behaviors from UserGlobals to ', self upgradeSymbolDictName printString;
		log: '		BEFORE upgrading seaside image.'.
	ug keys
	  do: [ :key | 
		| assoc |
		assoc := ug associationAt: key.
		assoc value isBehavior
		  ifTrue: [ 
			self upgradeSymbolDict addAssociation: assoc.
			ug removeAssociation: assoc ].
		self log: '	', key asString.
		System commit ].
	self log: '--- (commit)'
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_recompilePragmaMethods [

	"Sice all methods are removed for bootstrapping, not necessary to do this step"
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_removeAllMethods [

	"remove all methods in GsDevKit user classes"

	self timeStampedLog: 'Prepare gsdevkit - remove all methods'.

	self upgradeSymbolDict valuesDo: [:global |
		global isBehavior
			ifTrue: [ 
				global removeAllMethods.
				global class removeAllMethods ] ].

	System commit.

	self log: '	methods removed (commit)'.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_removeObsoleteClasses [
	"opportunity to remove classes from GsDevKit image, what may be present in Globals"

	"noop until 3.7.0"
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_resetExistingGlobalState [

	"Reset and/or initialize any classes that may have invalid state carried over"

	"noop for bootstrap (default)"
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_validation [
	"verify that all methods visible to this user have been recompiled."

	| sessionMethodsNeedCompilation methodsNeedCompilation |
	self timeStampedLog: 'Prepare gsdevkit - validation'.

	System commit.

	sessionMethodsNeedCompilation := self _prepareGsDevKitImage_validate_session_methods.
	methodsNeedCompilation := self _prepareGsDevKitImage_validate_user_methods.
	
	sessionMethodsNeedCompilation isEmpty
		ifFalse: [
			self log: '	session methods that need recompilation:'.
			sessionMethodsNeedCompilation do: [:meth | self log: ' 	', meth printString ] ].

	methodsNeedCompilation isEmpty
		ifFalse: [
			self log: '	methods that need recompilation:'.
			methodsNeedCompilation do: [:meth | self log: ' 	', meth printString ] ].

	(sessionMethodsNeedCompilation isEmpty and: [ methodsNeedCompilation isEmpty ])
		ifFalse: [].

	self log: '	done with validation'
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImageBanner [

	self bannerLog: 'Starting ', self buildString, ' GsDevKit upgrade: prepare gsdevkit image as ', System myUserProfile userId.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImageDoneBanner [

	self bannerLog: 'Finished ', self buildString, ' GsDevKit upgrade: prepare gsdevkit image as ', System myUserProfile userId.
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareImage [
	"prepare image for upgrade"

	"
		1. prepareImage
		2. prepareImage_pragma_user
		3. prepareImage_pragma_systemuser
		4. prepareImage_user
		5. prepareGsDevKitImage.
	"

	"run as system user"

	self prepareImageBanner.
	self log: 'Prepare image'.
	self sourceGemStoneRelease 
		prepareImage_pragmasFor: self;
		prepareImage_makeClassesObsolete: self;
		prepareImage_patches: self.
	self prepareImageDoneBanner.
]

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImage_bug46217_patch [

	"patch needed: 3.2.0 thru 3.2.15, and 3.3.0 - should be run as SystemUser"

	| package symbolDict class theSymbolList |
	self timeStampedLog: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	package := GsPackageLibrary packageNamed: #'Monticello_Globals'.
	symbolDict := package symbolDict.
	class := symbolDict at: #'MCGemStonePlatform'.
	theSymbolList := GsCurrentSession currentSession symbolList.
	(class
		compileMethod: self _prepareImage_mcgemstoneplatform_bug46217_patchSource 
		dictionaries: theSymbolList
		category:  'patch bug 46217') ifNotNil: [:ar | self error: 'did not compile' ].
]

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImage_makeClassObsolete: className in: symDict [
	| assoc |
	(symDict at: className asSymbol ifAbsent: []) 
		ifNil: [ 
			self log: '	The class ' , className , ' NOT made obsolete for user ', self upgradeUserName, 
				', the class is not present in symbol dictionary ', symDict name printString ]
		ifNotNil: [:class |
			self log: '	Making class ' , className , ' (', class asOop printString, ') obsolete for user ', self upgradeUserName.

			assoc := symDict associationAt: className asSymbol.
			class _makeClassObsolete: symDict.
			symDict removeKey: class name.
			(Globals at: #ObsoleteClasses) addAssociation: assoc.

			self log: '	Class ',  className , ' removed from symbolDictionary: ', symDict name printString. ]
]

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImage_patches [
	"noop by default"
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareImage_pragma_systemuser [
	"make old pragma class obsolete"

	"
		1. prepareImage
		2. prepareImage_pragma_user
		3. prepareImage_pragma_systemuser
		4. prepareImage_user
		5. prepareGsDevKitImage.
	"

	"run as system user"

	"Part 2: make pragma class obsolete"

	self prepareImagePragmaSystemUserBanner.
	self log: 'Prepare image system user pragma'.
	self sourceGemStoneRelease 
		prepareImage_systemuserPragmaFor: self;
		yourself.
	self prepareImagePragmaSystemUserDoneBanner.
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareImage_pragma_user [
	"prepare pragmas for upgrade"

	"
		1. prepareImage
		2. prepareImage_pragma_user
		3. prepareImage_pragma_systemuser
		4. prepareImage_user
		5. prepareGsDevKitImage.
	"

	"run as gsdevkit user"

	"Part 1: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	self prepareImagePragmaUserBanner.
	self log: 'Prepare image user pragma'.
	self sourceGemStoneRelease 
		prepareImage_userPragmaFor: self;
		yourself.
	self prepareImagePragmaUserDoneBanner.
]

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImage_pragmas [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"For 3.2.x, all methods need to be recompiled ... pragma data structures should be destroyed 
		before all methods reloaded"

	"For 3.3.x we'll need to recompile all methods that have pragmas, so that new structure is used"

	"Part 1: set the stage for pragma upgrade"

	| pragmaClass |

	"need to make sure that this method is used so that we can extract pragmas from old structures"
	self timeStampedLog: '	Installing ...Pragma>>withPragmasIn:do:'.
	(pragmaClass := self upgradeSymbolDict at: #Pragma ifAbsent: [])
		ifNil: [ ^ self log: '	No Pragma class found in ', self upgradeSymbolDict name asString, ' symbol dictionary' ].
	self log: '	Old pragma class ', pragmaClass name printString, '[', pragmaClass asOop printString, '] -- will be made obsolete'.
	(pragmaClass class
		compileMethod: self _prepareImage_pragmas_withPragmas_source 
		dictionaries: self upgradeUserProfile symbolList 
		category: 'Updatting the Method Dictionary -- during upgrade') ifNotNil: [:ar | self error: 'did not compile' ].
]

{ #category : 'prepare image pragma user' }
GsuAbstractGsDevKitUpgrade >> prepareImage_pragmas_user [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"For 3.2.x, all methods need to be recompiled ... pragma data structures should be destroyed 
		before all methods reloaded"

	"For 3.3.x we'll need to recompile all methods that have pragmas, so that new structure is used"

	"Part 2: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	| pragmaClass oldPackagePolicyEnabled |

	(pragmaClass := self upgradeSymbolDict at: #Pragma ifAbsent: [])
		ifNil: [ ^ self log: '	No Pragma class found in ', self upgradeSymbolDict name asString, ' symbol dictionary' ].
	self log: '	Finding all methods with pragmas for later recompile(', GsPackagePolicy current enabled printString, ')'.
	self log: '	Old pragma class ', pragmaClass name printString, '[', pragmaClass asOop printString, '] -- will be made obsolete'.

	"need to make sure that this method is used so that we can extract pragmas from old structures"
	self log: '	Installing ...oldPragma>>'.
	(pragmaClass class
		compileMethod: self _prepareImage_pragmas_withPragmas_source 
		dictionaries: self upgradeUserProfile symbolList 
		category: 'Updatting the Method Dictionary -- during upgrade') ifNotNil: [:ar | self error: 'did not compile' ].

	oldPackagePolicyEnabled := GsPackagePolicy current instVarAt: 1.
	self log: '	GsPackagePolicy currently ', (oldPackagePolicyEnabled ifTrue: [ 'enabled.'] ifFalse: ['disabled.']).
	GsPackagePolicy current instVarAt: 1 put: true.

	self log: '	Finding methods with pragmas for user: ', self upgradeUserName printString.
	self log: '		Pragma ', (self _globalNamed: 'Pragma') asOop printString.
	self log: '		System myUserProfile: ', System myUserProfile userId.
	(((ClassOrganizer newWithRoot: Object forUserId: self upgradeUserName) allSubclassesOf: Object), { Object })
		do: [ :cls | 
		  {cls.
		  (cls class)}
			do: [ :beh | 
				| methodDict |
				methodDict :=  beh _fullMethodDictEnv0.
			  methodDict keys
				do: [ :sel | 
				  (methodDict at: sel otherwise: nil)
					ifNotNil: [ :meth | 
					  (beh _pragmasForMethod: meth) isEmpty
						ifFalse: [ 
							self methodsWithPragmas add: meth.
							self log: '		', beh name asString, (beh isMeta ifTrue: [' class'] ifFalse: ['']), '>>', sel printString ] ] ] ] ].

	GsPackagePolicy current instVarAt: 1 put: oldPackagePolicyEnabled.

	self log: '	... finished finding methods with pragmas'
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareImage_user [
	"prepare image for upgrade"

	"
		1. prepareImage
		2. prepareImage_pragma_user
		3. prepareImage_pragma_systemuser
		4. prepareImage_user
		5. prepareGsDevKitImage.
	"

	"run as gsdevkit user"

	self prepareImageUserBanner.
	self log: 'Prepare image user'.
	self sourceGemStoneRelease 
		prepareImage_userPatches: self;
		prepareImage_user_clear_subscriptions: self;
		yourself.
	self prepareImageUserDoneBanner.
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImage_user_36x_fundamentals [
	"patches needed to load GLASS for 3.6.x and later"

	"noop for versions earlier than 3.6.x"
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImage_user_bug46059 [

	"until bug is fixed - should be run as SystemUser"

	self timeStampedLog: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	GsPackageLibrary 
		installMonticelloPackagesHome: self upgradeSymbolDict
		during: [:globals | 
			(Class
			compileMethod: self _prepareImage_user_class_bug46059_patchSource
			dictionaries: GsCurrentSession currentSession symbolList
			category: '*change-notification') ifNotNil: [:ar | self error: 'did not compile' ]. ].
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImage_user_bug46217 [
	"patch needed: 3.2.0 thru 3.2.15, and 3.3.0 - run as GsDevKit user"

	self log: '	set GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS global true (bug 46217)'.
	self _currentUserGlobals at: #'GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS' put: true.
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImage_user_clear_subscriptions [
	"need to clear subscriptions during bootstrap upgrade, because class initialization 
		methods are unconditionally fired, creating extra subscriptions for all subscribed classes."

	"bootstrap is the default upgrade path"

	| cls |
	self log: '	SystemLoginNotification Subscriptions cleared'.
	cls := self _globalNamed: 'SystemLoginNotification'.
	(cls _classVars at: #'Subscriptions') removeAll: (cls _classVars at: #'Subscriptions').
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImage_user_patch_35x_Metacello [
	"noop"
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImage_user_removeSessionMethods [
	"Remove all session methods as they must be recompiled during loading ... must be done before GsPackagePolicy is enabled"

	self log: '		removing session methods'.
    System myUserProfile symbolList do:[:dict |
		| dName |
		dName := dict name ifNil:[ 'unnamed' ].
		(dict at: GsPackage globalName otherwise: nil) 
			ifNotNil:[:pkg |
				"SessionMethods rebuilt during upgradeImage"
				pkg name == #SessionMethods
					ifFalse:[ 
						pkg removeAllMethods .
						self log: '			', dName, ' GsPackage oop: [', pkg asOop asString, '] session methods removed all' ] ] ]
]

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImageBanner [

	self bannerLogDash.
	self timeStampedLog:  'Starting ', self buildString, ' GsDevKit upgrade: prepare image as ', System myUserProfile userId.
	self log:  '	Upgrading ', self sourceGemStoneRelease printString, ' to ', self printString.
	self bannerLogDash.
	self logUpgradeParameters
]

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImageDoneBanner [

	self bannerLogDash.
	self timeStampedLog:  'Finished ', self buildString, ' GsDevKit upgrade: prepare image as ', System myUserProfile userId.
	self bannerLogDash.
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImagePragmaSystemUserBanner [

	self bannerLog: 'Starting ', self buildString, ' GsDevKit pragma upgrade (part 2): prepare image pragma system user as ', System myUserProfile userId.
	self logUpgradeParameters
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImagePragmaSystemUserDoneBanner [

	self bannerLog: 'Finished ', self buildString, ' GsDevKit pragma upgrade (part 2): prepare image pragma system user as ', System myUserProfile userId.
]

{ #category : 'prepare image pragma user' }
GsuAbstractGsDevKitUpgrade >> prepareImagePragmaUserBanner [

	self bannerLog: 'Starting ', self buildString, ' GsDevKit pragma upgrade (part 1): prepare image pragma user as ', System myUserProfile userId.
	self logUpgradeParameters
]

{ #category : 'prepare image pragma user' }
GsuAbstractGsDevKitUpgrade >> prepareImagePragmaUserDoneBanner [

	self bannerLog: 'Finished ', self buildString, ' GsDevKit pragma upgrade (part 1): prepare image pragma user as ', System myUserProfile userId.
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImageUser_patches [
	"noop"
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImageUserBanner [
	self
		bannerLog:
			'Starting ' , self buildString , ' GsDevKit upgrade: prepare image as user '
				, System myUserProfile userId.
	self logUpgradeParameters
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImageUserDoneBanner [

	self bannerLog: 'Finished ', self buildString, ' GsDevKit upgrade: prepare image as user ', System myUserProfile userId.
]

{ #category : 'printing' }
GsuAbstractGsDevKitUpgrade >> printOn: aStream [

	aStream 
		nextPutAll: self class name asString;
		nextPutAll: ' v', self major printString, '.', self minor printString, '.', self patch printString;
		yourself
]

{ #category : 'initialization' }
GsuAbstractGsDevKitUpgrade >> resolveForUpgrade [
	"determine which concrete upgrade class to use, base on source GemStone version"
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> sourceGemStoneRelease [

	^ sourceGemStoneRelease
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> sourceGemStoneRelease: aGsuGemStoneRelease [

	sourceGemStoneRelease := aGsuGemStoneRelease
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> targetGemStoneRelease [

	^ targetGemStoneRelease 
		ifNil: [ targetGemStoneRelease := self _defaultTargetRelease ]
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> updateDBFHistoryFinishUpgrade [

	| curHist |

	curHist := ((GsCurrentSession currentSession objectNamed: self upgradeSymbolDictName) at: #DbfSeasideHistory ifAbsent: ['']).
	(GsCurrentSession currentSession objectNamed: self upgradeSymbolDictName) 
		at: #DbfSeasideHistory 
		put: curHist, 'image upgrade for GsDevKit completed at ', DateTime now asString, Character lf .

	self log: '	update dbf history for upgrade finish'.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> updateDBFHistoryStartUpgrade [

	| history imageRelease |
	imageRelease := ImageVersion at: #gsRelease.
	history := String new.
	history addAll: ((GsCurrentSession currentSession objectNamed: self upgradeSymbolDictName) at: #DbfSeasideHistory ifAbsent: ['']).
	history addAll: 'Begin image upgrade for GsDevKit image ', imageRelease, '.'.
	history add: Character lf.
	(GsCurrentSession currentSession objectNamed:self upgradeSymbolDictName) at: #DbfSeasideHistory put: history.
	self log: '	update dbf history for upgrade start'.
]

{ #category : 'bootstrapping' }
GsuAbstractGsDevKitUpgrade >> upgradeGlass [

	"install GLASS from scratch"

	self bootstrapGsDevkit upgradeGlass
]

{ #category : 'bootstrapping' }
GsuAbstractGsDevKitUpgrade >> upgradeGlass1 [

	"install GLASS1 from scratch"

	self bootstrapGsDevkit upgradeGlass1
]
