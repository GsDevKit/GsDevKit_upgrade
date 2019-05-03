Class {
	#name : 'GsuGsDevKit_3_4_x_StdUpgrade',
	#superclass : 'GsuGsDevKit_3_5_x_StdUpgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_4_x_StdUpgrade >> prepareGsDevKitImage_bug46217_patch [

	"Bug 46217 - during bootstrap don''t remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"

	self log: 'Prepare gsdevkit - patch 46217'.

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
GsuGsDevKit_3_4_x_StdUpgrade >> prepareGsDevKitImage_user_patches [

	"Needed for installing GsdevKit/GLASS - pre-load patch of a method needed to install user code"

	"noop"
]

{ #category : 'prepare image pragma user' }
GsuGsDevKit_3_4_x_StdUpgrade >> prepareImage_pragmas_user [
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
					  (beh pragmasForMethod: sel) isEmpty
						ifFalse: [ 
							self methodsWithPragmas add: meth.
							self log: '		', beh name asString, (beh isMeta ifTrue: [' class'] ifFalse: ['']), '>>', sel printString ] ] ] ] ].

	GsPackagePolicy current instVarAt: 1 put: oldPackagePolicyEnabled.

	self log: '	... finished finding methods with pragmas'
]

{ #category : 'application loading' }
GsuGsDevKit_3_4_x_StdUpgrade >> removeExistingConfigurations [

	"Remove the known list of Metacello configuration classes (they have either had their methods removed or 
		may not be the write versoin of the package, either way they need to be reloaded."

	| count |

	self log: '	removing configuration classes'.

	ClassOrganizer clearCachedOrganizer.

	count := self bootstrapExistingConfigurationList size.
	self bootstrapExistingConfigurationList do: [:class | 
		| ar |
		self log: '		', class name.
		ar := System myUserProfile dictionaryAndSymbolOf: class.
		ar ifNotNil: [ (ar at: 1) removeKey: (ar at: 2) ] ].
	self log: '	done removing configuration classes (', count asString, ')'.

	"set the cache repository"
	(self _globalNamed: 'MCCacheRepository') 
		ifNotNil: [:mCCacheRepository | 
			mCCacheRepository setDefault: (self _globalNamed: 'MCDictionaryRepository') new ].
]
