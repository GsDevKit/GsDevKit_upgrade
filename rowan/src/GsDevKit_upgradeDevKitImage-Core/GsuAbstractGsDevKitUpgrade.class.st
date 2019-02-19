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
		'upgradeSymbolDict'
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
			theDict := self symbolDictionary ifNil: [
				SymbolDictionary new
					name: symbolName;
					objectSecurityPolicy: symbolList objectSecurityPolicy;
					yourself ].
			size := System myUserProfile symbolList size.
			System myUserProfile insertDictionary: theDict at: size + 1 ].
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

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade class >> symbolDictionary [
	"Install classes in a separate symbol dictionary, so the cleasses can be easily installed/removed in/from an image"

	^ TheSymbolDictionary ifNil: [ TheSymbolDictionary :=	((AllUsers userWithId: 'SystemUser') objectNamed: #UserGlobals) at: self _globalName ifAbsent: [] ].
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade class >> symbolDictionary: aSymbolDictionary [
	"Install classes in a separate symbol dictionary, so the cleasses can be easily installed/removed in/from an image"

	((AllUsers userWithId: 'SystemUser') objectNamed: #UserGlobals) at: self _globalName put: aSymbolDictionary.
	TheSymbolDictionary:= aSymbolDictionary
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> upgradeUserName: aString sourceGemStoneRelease: sourceRelease [

	^ self 
		upgradeUserName: aString 
		upgradeSymbolDict: nil 
		sourceGemStoneRelease: sourceRelease
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> upgradeUserName: aString upgradeSymbolDict: aSymbolDict sourceGemStoneRelease: sourceRelease [

	^ self new
		upgradeUserName: aString;
		sourceGemStoneRelease: sourceRelease;
		upgradeSymbolDict: aSymbolDict;
		resolveForUpgrade
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _currentUserGlobals [

	^ GsSession currentSession objectNamed: #UserGlobals
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _defaultTargetRelease [

	self subclassResponsibility: #_defaultTargetRelease
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

{ #category : 'logging' }
GsuAbstractGsDevKitUpgrade >> bannerLog: aString [

	self log: '--------------------'.
	self log: aString.
	self log: '--------------------'.
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> gemstone_user [

	^ self class gemstone_user
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
GsuAbstractGsDevKitUpgrade >> prepareImage [
	"prepare image for upgrade"

	self prepareImageBanner.
	self log: 'Prepare image'.
	self sourceGemStoneRelease 
		prepareImage_pragmasFor: self;
		prepareImage_makeClassesObsolete: self;
		prepareImage_patches: self
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
	(symDict at: className ifAbsent: []) 
		ifNil: [ 
			self log: '	The class ' , className , ' NOT made obsolete for user ', self upgradeUserName, 
				', the class is not present in symbol dictionary ', symDict name printString ]
		ifNotNil: [:class |
			self log: '	Making class ' , className , ' (', class asOop printString, ') obsolete for user ', self upgradeUserName.

			assoc := symDict associationAt: className.
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
		compileMethod: self sourceGemStoneRelease prepareImage_pragmas_withPragmas_source 
		dictionaries: self upgradeUserPrifile symbolList 
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
		yourself
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

	self bannerLog: 'Starting standard GsDevKit upgrade: prepare image as ', System myUserProfile userId.
]

{ #category : 'prepare image' }
GsuAbstractGsDevKitUpgrade >> prepareImageUserBanner [

	self bannerLog: 'Starting standard GsDevKit upgrade: prepare image for user ', System myUserProfile userId.
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

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeSymbolDict [
	"Formerly known as BootstrapSymbolDictionary ... the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDict ifNil: [ upgradeSymbolDict:= (AllUsers userWithId: self upgradeUserName) symbolList objectNamed: #UserGlobals ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeSymbolDict: aSymbolDict [
	"Formerly known as BootstrapSymbolDictionary ... the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDict := aSymbolDict
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserName [

	^ upgradeUserName ifNil: [ upgradeUserName := self gemstone_user ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserName: aString [

	upgradeUserName := aString
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserPrifile [

	^ (AllUsers userWithId: self upgradeUserName)
]
