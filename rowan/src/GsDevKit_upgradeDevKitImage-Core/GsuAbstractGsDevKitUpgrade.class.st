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
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

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
GsuAbstractGsDevKitUpgrade >> _defaultTargetRelease [

	self subclassResponsibility: #_defaultTargetRelease
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
		prepareImage_makeClassesObsolete: self
]

{ #category : 'phases' }
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

{ #category : 'phases' }
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
GsuAbstractGsDevKitUpgrade >> prepareImageBanner [

	self bannerLog: 'Starting standard GsDevKit upgrade'.
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
