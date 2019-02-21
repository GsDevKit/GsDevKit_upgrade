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
	#superclass : 'Object',
	#instVars : [
		'upgradeUserName',
		'sourceGemStoneRelease',
		'targetGemStoneRelease',
		'methodsWithPragmas',
		'upgradeUserSymbolDict',
		'upgradeSymbolDict',
		'upgradeSymbolDictName',
		'bootstrapPostLoadClassList'
	],
	#classVars : [
		'TheSymbolDictionary'
	],
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade class >> _globalName [

	^ #GsDevKit_Upgrade_Cache
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade class >> _installSymDictInSymbolList [
	| dictName symbolName session symbolList |

	dictName := 'GsDevKit_DymDict'.
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

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade class >> gemstone_user [

	^ (System gemEnvironmentVariable: 'GEMSTONE_USER')
		ifNil: [ 'DataCurator' ]
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> sourceGemStoneRelease: sourceRelease [

	^ self new
		upgradeUserName: self gemstone_user;
		sourceGemStoneRelease: sourceRelease;
		resolveForUpgrade
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> upgradeUserName: aString sourceGemStoneRelease: sourceRelease [

	^ self 
		upgradeUserName: aString 
		upgradeSymbolDictName: nil 
		sourceGemStoneRelease: sourceRelease
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> upgradeUserName: aString upgradeSymbolDictName: aSymbol sourceGemStoneRelease: sourceRelease [

	^ self new
		upgradeUserName: aString;
		sourceGemStoneRelease: sourceRelease;
		upgradeSymbolDictName: aSymbol;
		resolveForUpgrade
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _currentUserGlobals [

	^ GsSession currentSession objectNamed: #UserGlobals
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _defaultBootstrapPostLoadClassList [
	"formerly BootstrapApplicationPostloadClassList, list of classes that should not be initialized during bootstrap"

	^ #( #SecureHashAlgorithm #MCFileTreeFileDirectoryUtils )
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _defaultTargetRelease [

	self subclassResponsibility: #_defaultTargetRelease
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _gemstone_user [

	^ self class gemstone_user
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _globalNamed: aString [

	^ GsSession currentSession objectNamed: aString
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
GsuAbstractGsDevKitUpgrade >> _prepareImage_user_class_bug46o59_patchSource [

	^ 'removeFromSystem
| ar |
  ar := System myUserProfile dictionaryAndSymbolOf: self.
  ar ifNotNil: [ (ar at: 1) removeKey: (ar at: 2) ].'
]

{ #category : 'logging' }
GsuAbstractGsDevKitUpgrade >> bannerLog: aString [

	self log: '--------------------'.
	self log: aString.
	self log: '--------------------'.
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> bootstrapPostLoadClassList [
	"formerly BootstrapApplicationPostloadClassList, list of classes that should not be initialized during bootstrap"

	^ bootstrapPostLoadClassList
		ifNotNil: [ bootstrapPostLoadClassList := (bootstrapPostLoadClassList, self _defaultBootstrapPostLoadClassList) asIdentitySet asArray ]
		ifNil: [ bootstrapPostLoadClassList := self _defaultBootstrapPostLoadClassList ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> bootstrapPostLoadClassList: aListOfClassNameSymbols [
	"formerly BootstrapApplicationPostloadClassList, list of application classes that should not be initialized during bootstrap"

	bootstrapPostLoadClassList := aListOfClassNameSymbols
]

{ #category : 'logging' }
GsuAbstractGsDevKitUpgrade >> endBannerLog [

	self log: '--------------------'.
]

{ #category : 'logging' }
GsuAbstractGsDevKitUpgrade >> log: aString [

	GsFile gciLogServer: aString
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> methodsWithPragmas [

	^ methodsWithPragmas ifNil: [ methodsWithPragmas := {} ]
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage [
	"formerly done by $GEMSTONE/upgrade/prepareSeasideImage"

	self prepareGsDevKitImageBanner.
	self log: 'Prepare gsdevkit image'.
	self updateDBFHistoryStartUpgrade.
	self sourceGemStoneRelease
		prepareGsDevKitImage_enableSessionMethods: self;
		prepareGsDevKitImage_clearMonticelloCaches: self;
		yourself.
	self endBannerLog
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_clearMonticelloCaches [

	" clear caches - those that are unneeded or create problem during initial bootstrap load"

	self log: 'Prepare gsdevkit - clear Monticello caches'.

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
	"Wipe out the Metacello registry ... if it exists"
	(GsCurrentSession currentSession symbolList objectNamed: #MetacelloProjectRegistration)
	  ifNotNil: [:cl | cl _classVars at: #Registry put: nil ].

	self log: '	Monticello caches cleared'.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImage_enableSessionMethods [

	| policy package targetSymbolDictionary |
	package := GsPackageLibrary createPackageNamed: #SessionMethods.
	GsPackageLibrary installPackage: package.
	policy := GsPackagePolicy current.
	targetSymbolDictionary := GsCurrentSession currentSession objectNamed:  self upgradeSymbolDictName.
	(targetSymbolDictionary isKindOf: SymbolDictionary)
	   ifFalse: [nil error: self upgradeSymbolDict, ' must be the name of a SymbolDictionary'].
	policy homeSymbolDict:  targetSymbolDictionary.
	policy externalSymbolList: Array new.

	System commit.

	GsPackagePolicy current refreshSessionMethodDictionary. "no persistent state modified"

	self log: '	session methods enambled (commit)'.
]

{ #category : 'prepare gsdevkit  image' }
GsuAbstractGsDevKitUpgrade >> prepareGsDevKitImageBanner [

	self bannerLog: 'Starting Bootstrap GsDevKit upgrade: prepare gsdevkit image as ', System myUserProfile userId.
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareImage [
	"prepare image for upgrade"

	self prepareImageBanner.
	self log: 'Prepare image'.
	self sourceGemStoneRelease 
		prepareImage_pragmasFor: self;
		prepareImage_makeClassesObsolete: self;
		prepareImage_patches: self.
	self endBannerLog
]

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImage_bug46217_patch [

	"patch needed: 3.2.0 thru 3.2.15, and 3.3.0 - should be run as SystemUser"

	| package symbolDict class theSymbolList |
	self log: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	package := GsPackageLibrary packageNamed: #'Monticello_Globals'.
	symbolDict := package symbolDict.
	class := symbolDict at: #'MCGemStonePlatform'.
	theSymbolList := GsCurrentSession currentSession symbolList.
	class
		compileMethod: self _prepareImage_mcgemstoneplatform_bug46217_patchSource 
		dictionaries: theSymbolList
		category:  'patch bug 46217'
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

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImage_pragmas [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"For 3.2.x, all methods need to be recompiled ... pragma data structures should be destroyed 
		before all methods reloaded"

	"For 3.3.x we'll need to recompile all methods that have pragmas, so that new structure is used"

	| pragmaClass oldPackagePolicyEnabled |

	(pragmaClass := self upgradeSymbolDict at: #Pragma ifAbsent: [])
		ifNil: [ ^ self log: '	No Pragma class found in ', self upgradeSymbolDict name asString, ' symbol dictionary' ].
	self log: '	Finding all methods with pragmas for later recompile(', GsPackagePolicy current enabled printString, ')'.
	self log: '	Old pragma class ', pragmaClass name printString, '[', pragmaClass asOop printString, '] -- will be made obsolete'.

	"need to make sure that this method is used so that we can extract pragmas from old structures"
	self log: 'Installing ...oldPragma>>'.
	pragmaClass class
		compileMethod: self _prepareImage_pragmas_withPragmas_source 
		dictionaries: self upgradeUserProfile symbolList 
		category: 'Updatting the Method Dictionary -- during upgrade'. 

	oldPackagePolicyEnabled := GsPackagePolicy current instVarAt: 1.
	self log: '	GsPackagePolicy currently ', (oldPackagePolicyEnabled ifTrue: [ 'enabled.'] ifFalse: ['disabled.']).
	GsPackagePolicy current instVarAt: 1 put: true.

	Object allSubclasses
	do: [ :cls | 
	  {cls.
	  (cls class)}
		do: [ :beh | 
		  beh allSelectors
			do: [ :sel | 
			  (beh compiledMethodAt: sel otherwise: nil)
				ifNotNil: [ :meth | 
				  (beh _pragmasForMethod: meth) isEmpty
					ifFalse: [ 
						self methodsWithPragmas add: meth.
						self log: '	', beh name asString, (beh isMeta ifTrue: [' class'] ifFalse: ['']), '>>', sel printString ] ] ] ] ].
	GsPackagePolicy current instVarAt: 1 put: oldPackagePolicyEnabled.
	self log: '	... finished finding methods with pragmas'
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareImage_user [
	"prepare image for upgrade"

	self prepareImageUserBanner.
	self log: 'Prepare image user'.
	self sourceGemStoneRelease 
		prepareImage_userPatches: self;
		prepareImage_user_clear_subscriptions: self;
		yourself.
	self endBannerLog
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImage_user_bug46059 [

	"until bug is fixed - should be run as SystemUser"

	| package symbolDict class theSymbolList |
	self log: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	GsPackageLibrary 
		installMonticelloPackagesHome: (GsCurrentSession currentSession objectNamed: #'UserGlobals') 
		during: [:globals | 
			Class
			compileMethod: self _prepareImage_user_class_bug46o59_patchSource
			dictionaries: GsCurrentSession currentSession symbolList
			category: '*change-notification' ].
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

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImageBanner [

	self bannerLog: 'Starting Bootstrap GsDevKit upgrade: prepare image as ', System myUserProfile userId.
]

{ #category : 'prepare image user' }
GsuAbstractGsDevKitUpgrade >> prepareImageUserBanner [

	self bannerLog: 'Starting Bootstrap GsDevKit upgrade: prepare image for user ', System myUserProfile userId.
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

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeSymbolDict [
	"Formerly known as BootstrapSymbolDictionary ... the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDict ifNil: [ upgradeSymbolDict:= (AllUsers userWithId: self upgradeUserName) symbolList objectNamed: self upgradeSymbolDictName ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeSymbolDictName [
	"Formerly known as BootstrapSymbolDictionaryName ... the name of the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDictName ifNil: [ #UserGlobals ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeSymbolDictName: aSymbol [
	"Formerly known as BootstrapSymbolDictionaryName ... the name of the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDictName := aSymbol
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserName [

	^ upgradeUserName ifNil: [ upgradeUserName := self _gemstone_user ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserName: aString [

	upgradeUserName := aString
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserProfile [

	^ (AllUsers userWithId: self upgradeUserName)
]
