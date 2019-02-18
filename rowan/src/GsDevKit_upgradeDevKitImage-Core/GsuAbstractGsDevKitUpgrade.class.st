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
		'targetGemStoneRelease'
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

	^ self new
		upgradeUserName: aString;
		sourceGemStoneRelease: sourceRelease;
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

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareImage [
	"prepare image for upgrade"

	self prepareImageBanner.
	self log: '	Prepare image'
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareImage_pragmas [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	| methodsWithPragmas |
	methodsWithPragmas := {}.
	GsFile gciLogServer: 'Finding all methods with pragmas for later recompile(', GsPackagePolicy current enabled printString, ')'.
	UserGlobals at: #BootstrapMethodsNeedingRecompile put: methodsWithPragmas.
	(self seasideSymbolDictionary at: #Pragma ifAbsent: [])
		ifNil: [ GsFile gciLogServer: 'No Pragma class found in ', self seasideSymbolDictionary name asString, ' symbol dictionary' ]
		ifNotNil: [ :seasidePragmaClass |
			seasidePragmaClass class
					compileMethod: 'withPragmasIn: aClass do: aBlock
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
		dictionaries: self seasideUser symbolList 
		category: 'Updatting the Method Dictionary'. 
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
						methodsWithPragmas add: meth.
						GsFile gciLogServer: '	', beh name asString, (beh isMeta ifTrue: [' class'] ifFalse: ['']), '>>', sel printString ] ] ] ] ] ].
	GsFile gciLogServer: '... finished finding methods with pragmas'
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

	sourceGemStoneRelease := aGsuGemStoneRelease.
	sourceGemStoneRelease upgradeInstance: self
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> targetGemStoneRelease [

	^ targetGemStoneRelease 
		ifNil: [ 
			targetGemStoneRelease := 
				(self _defaultTargetRelease)
					upgradeInstance: self; 
					yourself ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserName [

	^ upgradeUserName ifNil: [ upgradeUserName := self gemstone_user ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserName: aString [

	upgradeUserName := aString
]
