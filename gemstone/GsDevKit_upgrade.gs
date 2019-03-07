! Class Declarations

doit
(Object
	subclass: 'GsuAbstractGemStoneRelease'
	instVarNames: #( major minor patch )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Common';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_2_4_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Common';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_0_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Common';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_1_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Common';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_2_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Common';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_3_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Common';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_4_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Common';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_5_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Common';
		comment: '';
		immediateInvariant.
true.
%

doit
(Object
	subclass: 'GsuAbstractGsDevKit'
	instVarNames: #( upgradeUserName upgradeSymbolDict upgradeSymbolDictName bootstrapPostLoadClassList bootstrapRepositoryDirectory bootstrapApplicationLoadSpecs bootstrapExistingConfigurationList )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Common';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGsDevKit
	subclass: 'GsuAbstractGsDevKitUpgrade'
	instVarNames: #( sourceGemStoneRelease targetGemStoneRelease methodsWithPragmas )
	classVars: #( TheSymbolDictionary )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Core';
		comment: 'I am the abstract upgrade driver for upgading GsDevKit/GLASS repositories.

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
 ';
		immediateInvariant.
true.
%

doit
(GsuAbstractGsDevKitUpgrade
	subclass: 'GsuGsDevKit_3_2_x_BootstrapUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Core';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGsDevKitUpgrade
	subclass: 'GsuGsDevKit_3_3_x_BootstrapUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Core';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGsDevKitUpgrade
	subclass: 'GsuGsDevKit_3_4_x_BootstrapUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Core';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGsDevKitUpgrade
	subclass: 'GsuGsDevKit_3_5_x_Upgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Core';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuGsDevKit_3_5_x_Upgrade
	subclass: 'GsuGsDevKit_3_5_x_BootstrapUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Core';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuGsDevKit_3_5_x_Upgrade
	subclass: 'GsuGsDevKit_3_5_x_StdUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Core';
		comment: '';
		immediateInvariant.
true.
%

doit
(GsuAbstractGsDevKit
	subclass: 'GsuGsDevKitBootstrap'
	instVarNames: #( bootstrapGemStoneRelease )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #())
		category: 'GsDevKit_upgrade-Bootstrap';
		comment: '';
		immediateInvariant.
true.
%

! Class implementation for 'GsuAbstractGemStoneRelease'

!		Class methods for 'GsuAbstractGemStoneRelease'

category: 'instance creation'
classmethod: GsuAbstractGemStoneRelease
major: major minor: minor

	^ (self _classForMajorVersion: major minorVersion: minor) new
		major: major;
		minor: minor;
		yourself
%

category: 'instance creation'
classmethod: GsuAbstractGemStoneRelease
major: major minor: minor patch: patch

	^ (self _classForMajorVersion: major minorVersion: minor) new
		major: major;
		minor: minor;
		patch: patch asInteger;
		yourself
%

category: 'private'
classmethod: GsuAbstractGemStoneRelease
_classForMajorVersion: major minorVersion: minor

	major = 2 ifTrue: [ ^ GsuGemStone_2_4_x_Release ].
	major ~= 3 ifTrue: [ self error: 'GemStone version ', major printString, ' not supported' ].
	^{
		GsuGemStone_3_0_x_Release.
		GsuGemStone_3_1_x_Release.
		GsuGemStone_3_2_x_Release.
		GsuGemStone_3_3_x_Release.
		GsuGemStone_3_4_x_Release.
		GsuGemStone_3_5_x_Release.
	} at: minor + 1
%

!		Instance methods for 'GsuAbstractGemStoneRelease'

category: 'bootstrapping'
method: GsuAbstractGemStoneRelease
bootstrapPackageFileNames

	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	self subclassResponsibility: #bootstrapPackageFileNames
%

category: 'debugging'
method: GsuAbstractGemStoneRelease
log: aString

	GsFile gciLogServer: aString
%

category: 'accessing'
method: GsuAbstractGemStoneRelease
major

	^ major
%

category: 'accessing'
method: GsuAbstractGemStoneRelease
major: anInteger

	major := anInteger
%

category: 'accessing'
method: GsuAbstractGemStoneRelease
minor

	^ minor
%

category: 'accessing'
method: GsuAbstractGemStoneRelease
minor: anInteger

	minor := anInteger
%

category: 'accessing'
method: GsuAbstractGemStoneRelease
patch

	^ patch ifNil: [ 0 ]
%

category: 'accessing'
method: GsuAbstractGemStoneRelease
patch: anInteger

	patch := anInteger
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
patch_compileMethodCategory:  aGsDevKitUpgrade

	aGsDevKitUpgrade patch_compileMethodCategory
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_bootstrapGsDevkit:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_bootstrapGsDevkit
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_clearMonticelloCaches:  aGsDevKitUpgrade

	aGsDevKitUpgrade 
		prepareGsDevKitImage_clearMonticelloCaches;
		prepareGsDevKitImage_clearMetacelloCaches
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_enableSessionMethods:  aGsDevKitUpgrade

	aGsDevKitUpgrade log: 'Prepare gsdevkit - enableSessionMethods'.
	aGsDevKitUpgrade prepareGsDevKitImage_enableSessionMethods
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_existingConfigurationList:  aGsDevKitUpgrade

	aGsDevKitUpgrade log: 'Prepare gsdevkit - create existing configuration list'.
	aGsDevKitUpgrade prepareGsDevKitImage_existingConfigurationList
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_loadApplicationCode:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_loadApplicationCode
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_patch45952:  aGsDevKitUpgrade

	"bug 45952 ... image/bootstrapMaster.topaz for 3.1.0.6 ignored BootstrapSymbolDictionaryName"

	aGsDevKitUpgrade log: 'Prepare gsdevkit - patch bug 45952'.
	aGsDevKitUpgrade prepareGsDevKitImage_patch45952
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_patch46217:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_bug46217_patch
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_patch_compileMethodCategory:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_patch_compileMethodCategory
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_recompilePragmaMethods:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_recompilePragmaMethods
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_removeAllMethods:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_removeAllMethods
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_resetExistingGlobalState:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_resetExistingGlobalState
%

category: 'prepare image'
method: GsuAbstractGemStoneRelease
prepareImage_makeClassesObsolete: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"noop by default"

	aGsDevKitUpgrade log: 'Prepare image - obsolete classes'.
%

category: 'prepare image'
method: GsuAbstractGemStoneRelease
prepareImage_patches: aGsDevKitUpgrade
	"Opportunity for target image to install any patches needed pre-upgrade"

	aGsDevKitUpgrade log: 'Prepare image - patches'.
	aGsDevKitUpgrade prepareImage_patches
%

category: 'prepare image'
method: GsuAbstractGemStoneRelease
prepareImage_pragmasFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 1: set the stage for pragma upgrade"

	aGsDevKitUpgrade log: 'Prepare image - pragmas'.

	"noop by default"
%

category: 'prepare image system user pragma'
method: GsuAbstractGemStoneRelease
prepareImage_systemuserPragmaFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 3: make pragma class obsolete"

	aGsDevKitUpgrade log: 'Prepare image - system user pragmas'.

	"noop by default"
%

category: 'perpare image user'
method: GsuAbstractGemStoneRelease
prepareImage_userPatches: aGsDevKitUpgrade
	"Opportunity for target image to perform user-specific preparation"

	aGsDevKitUpgrade 
		log: 'Prepare image user - patches';
		prepareImage_user_bug46059
%

category: 'prepare image user pragma'
method: GsuAbstractGemStoneRelease
prepareImage_userPragmaFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 2: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	aGsDevKitUpgrade log: 'Prepare image - user pragmas'.

	"noop by default"
%

category: 'perpare image user'
method: GsuAbstractGemStoneRelease
prepareImage_user_clear_subscriptions: aGsDevKitUpgrade
	"Opportunity for target image to perform user-specific preparation"

	aGsDevKitUpgrade log: 'Prepare image user - clear subscriptions'.
	aGsDevKitUpgrade prepareImage_user_clear_subscriptions
%

category: 'initialization'
method: GsuAbstractGemStoneRelease
resolveForUpgradeToGemStone350: aGsuGsDevKit_3_5_0_Upgrade

	^ aGsuGsDevKit_3_5_0_Upgrade asStandardUpgrade
%

! Class implementation for 'GsuGemStone_2_4_x_Release'

!		Instance methods for 'GsuGemStone_2_4_x_Release'

category: 'accessing'
method: GsuGemStone_2_4_x_Release
minor: anInteger

	anInteger ~= 4 ifTrue: [ self error: 'GemStone version 2.', anInteger printString, ' not supported' ].
	super minor: anInteger
%

category: 'prepare image'
method: GsuGemStone_2_4_x_Release
prepareImage_makeClassesObsolete: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"In 3.1.0.6, bootstrapMaster30 script ignores BootstrapSymbolDictionaryName, so Pragma installed in Seaside user's UserGlobals"

	| symDict |

	super prepareImage_makeClassesObsolete: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: (aGsDevKitUpgrade upgradeUserProfile objectNamed: 'UserGlobals').

	symDict := aGsDevKitUpgrade upgradeSymbolDict.
	(symDict at: #ObsoleteHalt ifAbsent: []) ifNil: [ 
        "2.4 versions of 2.x classes are no longer used.  Need to make obsolete, so that it's obvious
         that surviving subclasses are in wrong class hierachy."
		#( 'BreakpointNotification' 'Pause' 'Halt' 'ControlInterrupt' 'TransientRandom' 'Random' )
			  do: [:className | aGsDevKitUpgrade prepareImage_makeClassObsolete: className in: symDict ] ].
%

! Class implementation for 'GsuGemStone_3_1_x_Release'

!		Instance methods for 'GsuGemStone_3_1_x_Release'

category: 'prepare image'
method: GsuGemStone_3_1_x_Release
prepareImage_makeClassesObsolete: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"In 3.1.0.6, bootstrapMaster30 script ignores BootstrapSymbolDictionaryName, so Pragma installed in Seaside user's UserGlobals"

	super prepareImage_makeClassesObsolete: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: (aGsDevKitUpgrade upgradeUserProfile objectNamed: 'UserGlobals')
%

! Class implementation for 'GsuGemStone_3_2_x_Release'

!		Instance methods for 'GsuGemStone_3_2_x_Release'

category: 'prepare image'
method: GsuGemStone_3_2_x_Release
prepareImage_patches: aGsDevKitUpgrade
	"Opportunity for target image to install any patches needed pre-upgrade"

	super prepareImage_patches: aGsDevKitUpgrade.
	(self patch >= 0 and: [ self patch <= 15 ])
		ifTrue: [
			"bug46217 patch needed: 3.2.0 thru 3.2.15, and 3.3.0"
			aGsDevKitUpgrade prepareImage_bug46217_patch ]
%

category: 'prepare image'
method: GsuGemStone_3_2_x_Release
prepareImage_pragmasFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 1: set the stage for pragma upgrade"

	super prepareImage_pragmasFor: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_pragmas
%

category: 'prepare image system user pragma'
method: GsuGemStone_3_2_x_Release
prepareImage_systemuserPragmaFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 3: make pragma class obsolete"

	super prepareImage_systemuserPragmaFor: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: aGsDevKitUpgrade upgradeSymbolDict
%

category: 'prepare image user'
method: GsuGemStone_3_2_x_Release
prepareImage_userPatches: aGsDevKitUpgrade
	"Opportunity for target image to perform user-specific preparation"

	super prepareImage_userPatches: aGsDevKitUpgrade.
	(self patch >= 0 and: [ self patch <= 15 ])
		ifTrue: [
			"bug46217 patch needed: 3.2.0 thru 3.2.15, and 3.3.0"
			aGsDevKitUpgrade prepareImage_user_bug46217 ]
%

category: 'prepare image user pragma'
method: GsuGemStone_3_2_x_Release
prepareImage_userPragmaFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 2: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	super prepareImage_userPragmaFor: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_pragmas_user
%

category: 'initialization'
method: GsuGemStone_3_2_x_Release
resolveForUpgradeToGemStone350: aGsuGsDevKit_3_5_0_Upgrade

	^ aGsuGsDevKit_3_5_0_Upgrade asBootstrapUpgrade
%

! Class implementation for 'GsuGemStone_3_3_x_Release'

!		Instance methods for 'GsuGemStone_3_3_x_Release'

category: 'prepare image'
method: GsuGemStone_3_3_x_Release
prepareImage_patches: aGsDevKitUpgrade
	"Opportunity for target image to install any patches needed pre-upgrade"

	super prepareImage_patches: aGsDevKitUpgrade.
	self patch = 0
		ifTrue: [
			"bug46217 patch needed: 3.2.0 thru 3.2.15, and 3.3.0"
			aGsDevKitUpgrade prepareImage_bug46217_patch ]
%

category: 'prepare image'
method: GsuGemStone_3_3_x_Release
prepareImage_pragmasFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 1: set the stage for pragma upgrade"

	super prepareImage_pragmasFor: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_pragmas
%

category: 'prepare image system user pragma'
method: GsuGemStone_3_3_x_Release
prepareImage_systemuserPragmaFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 3: make pragma class obsolete"

	super prepareImage_systemuserPragmaFor: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: aGsDevKitUpgrade upgradeSymbolDict
%

category: 'prepare image user'
method: GsuGemStone_3_3_x_Release
prepareImage_userPatches: aGsDevKitUpgrade

	super prepareImage_userPatches: aGsDevKitUpgrade.
	self patch = 0
		ifTrue: [
			"bug46217 patch needed: 3.2.0 thru 3.2.15, and 3.3.0"
			aGsDevKitUpgrade prepareImage_user_bug46217 ]
%

category: 'prepare image user pragma'
method: GsuGemStone_3_3_x_Release
prepareImage_userPragmaFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 2: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	super prepareImage_userPragmaFor: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_pragmas_user
%

! Class implementation for 'GsuGemStone_3_4_x_Release'

!		Instance methods for 'GsuGemStone_3_4_x_Release'

category: 'prepare gsdevkit image'
method: GsuGemStone_3_4_x_Release
prepareGsDevKitImage_recompilePragmaMethods:  aGsDevKitUpgrade

	"noop - Pragma class is in base"
%

category: 'prepare image'
method: GsuGemStone_3_4_x_Release
prepareImage_makeClassesObsolete: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is already in the base"

	"noop"
%

! Class implementation for 'GsuGemStone_3_5_x_Release'

!		Instance methods for 'GsuGemStone_3_5_x_Release'

category: 'bootstrapping'
method: GsuGemStone_3_5_x_Release
bootstrapPackageFileNames

	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	^self _bootstrapPackageFileNames_0
%

category: 'prepare gsdevkit image'
method: GsuGemStone_3_5_x_Release
prepareGsDevKitImage_recompilePragmaMethods:  aGsDevKitUpgrade

	"noop - Pragma class is in base"
%

category: 'prepare image'
method: GsuGemStone_3_5_x_Release
prepareImage_makeClassesObsolete: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is already in the base"

	"noop"
%

category: 'private'
method: GsuGemStone_3_5_x_Release
_bootstrapPackageFileNames_0

	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	"for 3.5.0"

	^{ 
		'Core.v3-dkh.82.mcz' .
		'GemStone-Compression-dkh.1.mcz' .
		'Base-Bootstrap.v3-dkh.29.mcz'.
		'Bootstrap.v34-dkh.263.mcz'.
		'GemStone-ANSI-Streams-dkh.9.mcz'.
		'GemStone-Indexing-Extensions-dkh.3.mcz'.
		'Sport3.010.v3-dkh.29.mcz'.
		'Squeak.v34-dkh.339.mcz'.
		'Regex-Core-DaleHenrichs.3.mcz'.
		'Regex-Tests-Core-DaleHenrichs.5.mcz'.
		'PackageInfo-Base.g-dkh.36.mcz'.
		'Monticello.v3-dkh.457.mcz'.
		'GemStone-Deployment.v310-dkh.26.mcz'.
		'Change-Notification.v3-dkh.20.mcz'.
		'Gofer-Core.gemstone-dkh.135.mcz'.
		'Metacello-Base-dkh.103.mcz'.
		'Metacello-Core-dkh.669.mcz'.
		'Metacello-MC-dkh.669.mcz'.
		'Metacello-Platform.gemstone-dkh.29.mcz'.
		'Metacello-ToolBox-dkh.131.mcz'.
		'Metacello-FileTree-dkh.29.mcz'.
		'Metacello-GitHub-dkh.22.mcz'.
		'Network-Url-dkh.3.mcz'.
	}.
%

! Class implementation for 'GsuAbstractGsDevKit'

!		Class methods for 'GsuAbstractGsDevKit'

category: 'accessing'
classmethod: GsuAbstractGsDevKit
gemstone_user

	^ (System gemEnvironmentVariable: 'GEMSTONE_USER')
		ifNil: [ 'DataCurator' ]
%

!		Instance methods for 'GsuAbstractGsDevKit'

category: 'logging'
method: GsuAbstractGsDevKit
bannerLog: aString

	self bannerLogDash.
	self log: aString.
	self bannerLogDash.
%

category: 'logging'
method: GsuAbstractGsDevKit
bannerLogDash

	self log: '--------------------'.
%

category: 'accessing'
method: GsuAbstractGsDevKit
bootstrapApplicationLoadSpecs
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	^ bootstrapApplicationLoadSpecs
		ifNil: [ bootstrapApplicationLoadSpecs := self _defaultBootstrapApplicationLoadSpecs ]
%

category: 'accessing'
method: GsuAbstractGsDevKit
bootstrapApplicationLoadSpecs: loadSpecArray
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	bootstrapApplicationLoadSpecs := loadSpecArray
%

category: 'accessing'
method: GsuAbstractGsDevKit
bootstrapExistingConfigurationList
	"formerly BootstrapExistingConfigurationList, list of configuration names that should be removed"

	^ bootstrapExistingConfigurationList
		ifNil: [ bootstrapExistingConfigurationList := {} ]
%

category: 'accessing'
method: GsuAbstractGsDevKit
bootstrapExistingConfigurationList: configurationNames
	"formerly BootstrapExistingConfigurationList, list of configuration names that should be removed"

	bootstrapExistingConfigurationList := configurationNames
%

category: 'accessing'
method: GsuAbstractGsDevKit
bootstrapPostLoadClassList
	"formerly BootstrapApplicationPostloadClassList, list of classes that should not be initialized during bootstrap"

	^ bootstrapPostLoadClassList
		ifNil: [ bootstrapPostLoadClassList := self _defaultBootstrapPostLoadClassList ]
%

category: 'accessing'
method: GsuAbstractGsDevKit
bootstrapPostLoadClassList: aListOfClassNameSymbols
	"formerly BootstrapApplicationPostloadClassList, list of application classes that should not be initialized during bootstrap"

	"make sure that the _default list are included ... they are required"

	bootstrapPostLoadClassList := ( aListOfClassNameSymbols, self _defaultBootstrapPostLoadClassList) asIdentitySet asArray
%

category: 'accessing'
method: GsuAbstractGsDevKit
bootstrapRepositoryDirectory
	"formerly BootstrapRepositoryDirectory, location of Monticello bootstrap directory"

	^ bootstrapRepositoryDirectory
		ifNil: [ bootstrapRepositoryDirectory := self _defaultBootstrapRepositoryDirectory ]
%

category: 'accessing'
method: GsuAbstractGsDevKit
bootstrapRepositoryDirectory: directoryPath
	"formerly BootstrapRepositoryDirectory, location of Monticello bootstrap directory"

	bootstrapRepositoryDirectory := directoryPath
%

category: 'application loading'
method: GsuAbstractGsDevKit
loadApplicationLoadSpecs

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
		loadSpec size = 1
			ifFalse: [
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
			ifTrue: [ self _reloadProjectNamed: (loadSpec at: 1) ]
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
										ex resume: true ] ] ] ].
	self bannerLogDash.
	self bannerLogDash.

	System commit.

	self log: '	done (commit)'.
%

category: 'logging'
method: GsuAbstractGsDevKit
log: aString

	GsFile gciLogServer: aString
%

category: 'application loading'
method: GsuAbstractGsDevKit
removeExistingConfigurations

	"Remove the known list of Metacello configuration classes (they have either had their methods removed or 
		may not be the write versoin of the package, either way they need to be reloaded."

	self log: '	removing configuration classes'.

	ClassOrganizer clearCachedOrganizer.

	self bootstrapExistingConfigurationList do: [:class | 
		self log: '		', class name.
		class removeFromSystem ].
	self log: '	done removing configuration classes'.

	"set the cache repository"
	(self _globalNamed: 'MCCacheRepository') 
		ifNotNil: [:mCCacheRepository | 
			mCCacheRepository setDefault: (self _globalNamed: 'MCDictionaryRepository') new ].
%

category: 'accessing'
method: GsuAbstractGsDevKit
upgradeSymbolDict
	"Formerly known as BootstrapSymbolDictionary ... the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDict ifNil: [ upgradeSymbolDict:= (AllUsers userWithId: self upgradeUserName) symbolList objectNamed: self upgradeSymbolDictName ]
%

category: 'accessing'
method: GsuAbstractGsDevKit
upgradeSymbolDictName
	"Formerly known as BootstrapSymbolDictionaryName ... the name of the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDictName ifNil: [ #UserGlobals ]
%

category: 'accessing'
method: GsuAbstractGsDevKit
upgradeSymbolDictName: aSymbol
	"Formerly known as BootstrapSymbolDictionaryName ... the name of the symbol dictionary where GsDevKit/GLASS is installed"

	^ upgradeSymbolDictName := aSymbol
%

category: 'accessing'
method: GsuAbstractGsDevKit
upgradeUserName

	^ upgradeUserName ifNil: [ upgradeUserName := self _gemstone_user ]
%

category: 'accessing'
method: GsuAbstractGsDevKit
upgradeUserName: aString

	upgradeUserName := aString
%

category: 'accessing'
method: GsuAbstractGsDevKit
upgradeUserProfile

	^ (AllUsers userWithId: self upgradeUserName)
%

category: 'private'
method: GsuAbstractGsDevKit
_currentUserGlobals

	^ GsSession currentSession objectNamed: #UserGlobals
%

category: 'private'
method: GsuAbstractGsDevKit
_defaultBootstrapApplicationLoadSpecs
	"formerly BootstrapApplicationLoadSpecs, bootstrap GLASS configuration name, version, load spec and directory path"

	self _todeLoaded
		ifTrue: [
			self log: '	load BaselineOfMetacello BaselineOfTode'.
			"first update Metacello and then update Tode"
			^{
				{
					'Metacello'. 
				}.
				{
					'Tode'. 
				}.
			} ].
	self _glass1Loaded
		ifTrue: [
			self log: '	load BaselineOfMetacello BaselineOfGLASS1'.
			"first update Metacello and then update GLASS1"
			^{
				{
					'Metacello'. 
				}.
				{
					'GLASS1'. 
				}.
			} ].
	self _gsDevKitLoaded
		ifTrue: [
			self log: '	load BaselineOfGsDevKit'.
			^{	"assume that GsDevKit needs to be reloaded"
				 {
						'GsDevKit'. 
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
%

category: 'private'
method: GsuAbstractGsDevKit
_defaultBootstrapPostLoadClassList
	"formerly BootstrapApplicationPostloadClassList, list of classes that should not be initialized during bootstrap"

	^ { #SecureHashAlgorithm . #MCFileTreeFileDirectoryUtils  }
%

category: 'private'
method: GsuAbstractGsDevKit
_defaultBootstrapRepositoryDirectory
	"formerly BootstrapRepositoryDirectory, location of Monticello bootstrap directory"

	^ GsPackageLibrary getMonticelloRepositoryDirectory
%

category: 'private'
method: GsuAbstractGsDevKit
_deploy: aBlock
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
%

category: 'private'
method: GsuAbstractGsDevKit
_gemstone_user

	^ self class gemstone_user
%

category: 'private'
method: GsuAbstractGsDevKit
_glass1Loaded
  ^ self _standardBaselineLoaded: 'BaselineOfGLASS1'
%

category: 'private'
method: GsuAbstractGsDevKit
_globalNamed: aString

	^ GsSession currentSession objectNamed: aString
%

category: 'private'
method: GsuAbstractGsDevKit
_gsDevKitLoaded
  ^ self _standardBaselineLoaded: 'BaselineOfGsDevKit'
%

category: 'private'
method: GsuAbstractGsDevKit
_listUpgradeParameters

	^ #( bootstrapPostLoadClassList bootstrapApplicationLoadSpecs )
%

category: 'logging'
method: GsuAbstractGsDevKit
_logUpgradeParameters

	self _singletonUpgradeParameters do: [:selectorSymbol |
		self log: '	', selectorSymbol asString, ' : ', (self perform: selectorSymbol) ].

	self _listUpgradeParameters do: [:selectorSymbol |
		self log: '	', selectorSymbol asString, ' : '.
		[ (self perform: selectorSymbol) 
			do: [:entry | self log: '		', entry printString ] 
		] on: Error do: [:ex  | self log: '			error extracting parameter ', ex description printString ] ]
%

category: 'application loading'
method: GsuAbstractGsDevKit
_reloadProjectNamed: projectName
	| specs projectSpec metacello repoSpec |

	specs := (self _globalNamed: 'Metacello') image
		baseline: [ :spec | spec name = projectName ];
		list.
	specs isEmpty
		ifFalse: [ projectSpec := specs first ].
	self bannerLogDash.
	self bannerLogDash.
	projectSpec notNil
		ifTrue: [ 
			self log: '		Reloading Project ', projectName printString.
			self bannerLogDash.
			repoSpec := projectSpec repositorySpecs first.
			metacello := (self _globalNamed: 'Metacello') image baseline: projectName ]
		ifFalse: [ self error: 'Project spec not found for ', projectName printString ].
	self
		_deploy: [ 
		metacello copy get.
		metacello copy load ].
%

category: 'private'
method: GsuAbstractGsDevKit
_singletonUpgradeParameters

	^ #( upgradeUserName upgradeSymbolDictName bootstrapRepositoryDirectory )
%

category: 'private'
method: GsuAbstractGsDevKit
_standardBaselineLoaded: baselineClassName
self log: '_standardBaselineLoaded: ', baselineClassName.
	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
self log: '	baseline class present'.
		(self _globalNamed: 'MetacelloProjectRegistration')
			ifNotNil: [ :cls | 
self log: '	MetacelloProjectRegistration class present'.
				(cls registrationForClassNamed: baselineClassName ifAbsent: [  self log: '	no registration'. nil])
					ifNotNil: [ :registration | 
| res | 
res := registration loadedInImage.
self log: '	registration loaded: ', res printString.
^res ] ] ].
	^ false
%

category: 'private'
method: GsuAbstractGsDevKit
_todeLoaded
  ^ self _standardBaselineLoaded: 'BaselineOfTode'
%

! Class implementation for 'GsuAbstractGsDevKitUpgrade'

!		Class methods for 'GsuAbstractGsDevKitUpgrade'

category: 'instance creation'
classmethod: GsuAbstractGsDevKitUpgrade
sourceGemStoneRelease: sourceRelease

	^ self new
		upgradeUserName: self gemstone_user;
		sourceGemStoneRelease: sourceRelease;
		resolveForUpgrade
%

category: 'instance creation'
classmethod: GsuAbstractGsDevKitUpgrade
upgradeUserName: aString

	^ self
		upgradeUserName: aString 
		upgradeSymbolDictName: nil
%

category: 'instance creation'
classmethod: GsuAbstractGsDevKitUpgrade
upgradeUserName: aString sourceGemStoneRelease: sourceRelease

	^ self 
		upgradeUserName: aString 
		upgradeSymbolDictName: nil 
		sourceGemStoneRelease: sourceRelease
%

category: 'instance creation'
classmethod: GsuAbstractGsDevKitUpgrade
upgradeUserName: aString upgradeSymbolDictName: aSymbol 

	^ self _calculateUpgradeClass
		upgradeUserName: aString 
		upgradeSymbolDictName: aSymbol 
		sourceGemStoneRelease: self _calculatePreviousRelease
%

category: 'instance creation'
classmethod: GsuAbstractGsDevKitUpgrade
upgradeUserName: aString upgradeSymbolDictName: aSymbol sourceGemStoneRelease: sourceRelease

	^ (self new
			upgradeUserName: aString;
			upgradeSymbolDictName: aSymbol;
			yourself)
				sourceGemStoneRelease: sourceRelease;
				resolveForUpgrade
%

category: 'private'
classmethod: GsuAbstractGsDevKitUpgrade
_calculatePreviousRelease

	| previousGemStoneVersionInt |
	previousGemStoneVersionInt := GsPackagePolicy perform: #'_previousVersion'.
	previousGemStoneVersionInt = 35
		ifTrue: [ ^ GsuGemStone_3_5_x_Release ].
	previousGemStoneVersionInt = 34
		ifTrue: [ ^ GsuGemStone_3_4_x_Release ].
	previousGemStoneVersionInt = 33
		ifTrue: [ ^ GsuGemStone_3_3_x_Release ].
	previousGemStoneVersionInt = 32
		ifTrue: [ ^ GsuGemStone_3_2_x_Release ].
	self error: 'Upgrades from GemStone versions earlier than 3.2.0', ' are not currently supported.'
%

category: 'private'
classmethod: GsuAbstractGsDevKitUpgrade
_calculateUpgradeClass

	| currentGemStoneVersionInt |
	currentGemStoneVersionInt := GsPackagePolicy perform: #'_originVersion'.
	currentGemStoneVersionInt = 35
		ifTrue: [ ^ GsuGsDevKit_3_5_x_Upgrade ].
	self error: 'Upgrades to ', (System gemVersionReport at: 'gsVersion') printString, ' are not currently supported.'
%

category: 'private'
classmethod: GsuAbstractGsDevKitUpgrade
_globalName

	^ #GsDevKit_Upgrade_Cache
%

category: 'private'
classmethod: GsuAbstractGsDevKitUpgrade
_installSymDictInSymbolList
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
%

category: 'private'
classmethod: GsuAbstractGsDevKitUpgrade
_symbolDictionary
	"Install classes in a separate symbol dictionary, so the cleasses can be easily installed/removed in/from an image"

	^ TheSymbolDictionary ifNil: [ TheSymbolDictionary :=	((AllUsers userWithId: 'SystemUser') objectNamed: #UserGlobals) at: self _globalName ifAbsent: [] ].
%

category: 'private'
classmethod: GsuAbstractGsDevKitUpgrade
_symbolDictionary: aSymbolDictionary
	"Install classes in a separate symbol dictionary, so the cleasses can be easily installed/removed in/from an image"

	((AllUsers userWithId: 'SystemUser') objectNamed: #UserGlobals) at: self _globalName put: aSymbolDictionary.
	TheSymbolDictionary:= aSymbolDictionary
%

!		Instance methods for 'GsuAbstractGsDevKitUpgrade'

category: 'bootstrapping'
method: GsuAbstractGsDevKitUpgrade
bootstrapGsDevkit

	"install GsdevKit from scratch"

	"used to create extent0.seaside.dbf"

	(GsuGsDevKitBootstrap
		upgradeUserName: self upgradeUserName
			upgradeSymbolDictName: self upgradeSymbolDictName
			bootstrapGemStoneRelease: self _bootstrapRelease)
		bootstrapPostLoadClassList: self bootstrapPostLoadClassList;
		bootstrapRepositoryDirectory: self bootstrapRepositoryDirectory;
		bootstrapApplicationLoadSpecs: bootstrapApplicationLoadSpecs; 
		bootstrapExistingConfigurationList: self bootstrapExistingConfigurationList;
		bootstrapGsDevkit
%

category: 'accessing'
method: GsuAbstractGsDevKitUpgrade
buildString

	" 
		Standard -	method recompilation not required
		Bootstrap -	method recompilation required 
	"

	^ 'Bootstrap'
%

category: 'logging'
method: GsuAbstractGsDevKitUpgrade
logUpgradeParameters

	self log: 'Upgrade parameters'.

	self bannerLogDash.

	self _logUpgradeParameters.

	self bannerLogDash.
%

category: 'accessing'
method: GsuAbstractGsDevKitUpgrade
methodsWithPragmas

	^ methodsWithPragmas ifNil: [ methodsWithPragmas := {} ]
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage
	"formerly done by $GEMSTONE/upgrade/prepareSeasideImage"

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
		prepareGsDevKitImage_bootstrapGsDevkit: self;
		prepareGsDevKitImage_resetExistingGlobalState: self;
		yourself.
	self updateDBFHistoryFinishUpgrade.
	System commit.
	self sourceGemStoneRelease
		prepareGsDevKitImage_loadApplicationCode: self;
		yourself.		
	self log: '	finished gsdevkit image (commit)'.
	self bannerLogDash.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImageBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit upgrade: prepare gsdevkit image as ', System myUserProfile userId.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_bootstrapGsDevkit

	"install GsdevKit from scratch"

	self log: 'Prepare gsdevkit - bootstrap GsdevKit'.

	self bootstrapGsDevkit
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_bug46217_patch

	"Bug 46217 - during bootstrap don''t remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"

	self log: 'Prepare gsdevkit - patch 46217'.

	GsPackageLibrary 
	  installMonticelloPackagesHome: (GsCurrentSession currentSession objectNamed: #'UserGlobals') 
	  during: [:globals | 
		(Class
		  compileMethod: self _prepareImage_class_bug46217_patchSource
		dictionaries: GsCurrentSession currentSession symbolList
		category: '*change-notification') ifNotNil: [:ar | self error: 'did not compile' ].
	  ].

	System commit.

	self log: '	46217 patched (commit)'.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_clearMetacelloCaches

	" clear caches - those that are unneeded or create problem during initial bootstrap load"

	self log: 'Prepare gsdevkit - clear Metacello caches'.

	self _clearMetacelloCaches.

	System commit.

	self log: '	Metacello caches cleared (commit)'.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_clearMonticelloCaches

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

	System commit.

	self log: '	Monticello caches cleared (commit)'.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_enableSessionMethods

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
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_existingConfigurationList

	"Generate list of loaded configuration classes to be removed"

	self bootstrapExistingConfigurationList isEmpty ifFalse: [ "already set" ^ self ].
	self log: '	create existing configuration list (commit)'.

   self upgradeSymbolDict associationsDo: [:assoc |
	   assoc value isBehavior
		   ifTrue: [
			   (assoc key asString _findString: 'ConfigurationOf' startingAt: 1 ignoreCase: false) == 1 
				  ifTrue: [
					  self log: '		', assoc key asString.
					  self bootstrapExistingConfigurationList add: assoc value ] ] ].
	System commit.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_loadApplicationCode
	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"

	"load application code"

	self log: 'Prepare gsdevkit - load GsDevKit application code'.

	"force configurations to be reloaded if needed"
	self removeExistingConfigurations.

	"now load application"
	self loadApplicationLoadSpecs
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_patch45952

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
		log: '	BootstrapSymbolDictionary ignored during initial bootstrap of GLASS into non-UserGlobals SymbolDictionary.';
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
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_patch_compileMethodCategory
	"patch only needed suring standard upgrade ..."

	"noop"
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_recompilePragmaMethods

	"Sice all methods are removed for bootstrapping, not necessary to do this step"
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_removeAllMethods

	"remove all methods in GsDevKit user classes"

	self log: 'Prepare gsdevkit - remove all methods'.

	self upgradeSymbolDict valuesDo: [:global |
		global isBehavior
			ifTrue: [ 
				global removeAllMethods.
				global class removeAllMethods ] ].

	System commit.

	self log: '	methods removed (commit)'.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_resetExistingGlobalState

	"Reset and/or initialize any classes that may have invalid state carried over"

	"noop for bootstrap (default)"
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareImage
	"prepare image for upgrade"

	"run as system user"

	self prepareImageBanner.
	self log: 'Prepare image'.
	self sourceGemStoneRelease 
		prepareImage_pragmasFor: self;
		prepareImage_makeClassesObsolete: self;
		prepareImage_patches: self.
	self bannerLogDash.
%

category: 'prepare image'
method: GsuAbstractGsDevKitUpgrade
prepareImageBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit upgrade: prepare image as ', System myUserProfile userId.
	self logUpgradeParameters
%

category: 'prepare image'
method: GsuAbstractGsDevKitUpgrade
prepareImagePragmaBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit pragma upgrade (part 1): prepare image pragma as ', System myUserProfile userId.
	self logUpgradeParameters
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImagePragmaSystemUserBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit pragma upgrade (part 3): prepare image pragma system user as ', System myUserProfile userId.
	self logUpgradeParameters
%

category: 'prepare image pragma user'
method: GsuAbstractGsDevKitUpgrade
prepareImagePragmaUserBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit pragma upgrade (part 2): prepare image pragma user as ', System myUserProfile userId.
	self logUpgradeParameters
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImageUserBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit upgrade: prepare image for user ', System myUserProfile userId.
	self logUpgradeParameters
%

category: 'prepare image'
method: GsuAbstractGsDevKitUpgrade
prepareImage_bug46217_patch

	"patch needed: 3.2.0 thru 3.2.15, and 3.3.0 - should be run as SystemUser"

	| package symbolDict class theSymbolList |
	self log: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	package := GsPackageLibrary packageNamed: #'Monticello_Globals'.
	symbolDict := package symbolDict.
	class := symbolDict at: #'MCGemStonePlatform'.
	theSymbolList := GsCurrentSession currentSession symbolList.
	(class
		compileMethod: self _prepareImage_mcgemstoneplatform_bug46217_patchSource 
		dictionaries: theSymbolList
		category:  'patch bug 46217') ifNotNil: [:ar | self error: 'did not compile' ].
%

category: 'prepare image'
method: GsuAbstractGsDevKitUpgrade
prepareImage_makeClassObsolete: className in: symDict
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
%

category: 'prepare image'
method: GsuAbstractGsDevKitUpgrade
prepareImage_patches
	"noop by default"
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareImage_pragma
	"prepare pragmas for upgrade"

	"run as system user"

	"Part 1: set the stage for pragma upgrade"

	self prepareImagePragmaBanner.
	self log: 'Prepare image pragma'.
	self sourceGemStoneRelease 
		prepareImage_pragmaFor: self;
		yourself.
	self bannerLogDash.
%

category: 'prepare image'
method: GsuAbstractGsDevKitUpgrade
prepareImage_pragmas
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"For 3.2.x, all methods need to be recompiled ... pragma data structures should be destroyed 
		before all methods reloaded"

	"For 3.3.x we'll need to recompile all methods that have pragmas, so that new structure is used"

	"Part 1: set the stage for pragma upgrade"

	| pragmaClass |

	"need to make sure that this method is used so that we can extract pragmas from old structures"
	self log: '	Installing ...Pragma>>withPragmasIn:do:'.
	(pragmaClass := self upgradeSymbolDict at: #Pragma ifAbsent: [])
		ifNil: [ ^ self log: '	No Pragma class found in ', self upgradeSymbolDict name asString, ' symbol dictionary' ].
	self log: '	Old pragma class ', pragmaClass name printString, '[', pragmaClass asOop printString, '] -- will be made obsolete'.
	(pragmaClass class
		compileMethod: self _prepareImage_pragmas_withPragmas_source 
		dictionaries: self upgradeUserProfile symbolList 
		category: 'Updatting the Method Dictionary -- during upgrade') ifNotNil: [:ar | self error: 'did not compile' ].
%

category: 'prepare image pragma user'
method: GsuAbstractGsDevKitUpgrade
prepareImage_pragmas_user
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
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareImage_pragma_systemuser
	"make old pragma class obsolete"

	"run as system user"

	"Part 3: make pragma class obsolete"

	self prepareImagePragmaSystemUserBanner.
	self log: 'Prepare image system user pragma'.
	self sourceGemStoneRelease 
		prepareImage_systemuserPragmaFor: self;
		yourself.
	self bannerLogDash.
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareImage_pragma_user
	"prepare pragmas for upgrade"

	"run as gsdevkit user"

	"Part 2: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	self prepareImagePragmaUserBanner.
	self log: 'Prepare image user pragma'.
	self sourceGemStoneRelease 
		prepareImage_userPragmaFor: self;
		yourself.
	self bannerLogDash.
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareImage_user
	"prepare image for upgrade"

	"run as gsdevkit user"

	self prepareImageUserBanner.
	self log: 'Prepare image user'.
	self sourceGemStoneRelease 
		prepareImage_userPatches: self;
		prepareImage_user_clear_subscriptions: self;
		yourself.
	self bannerLogDash.
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImage_user_bug46059

	"until bug is fixed - should be run as SystemUser"

	| package symbolDict class theSymbolList |
	self log: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	GsPackageLibrary 
		installMonticelloPackagesHome: (GsCurrentSession currentSession objectNamed: #'UserGlobals') 
		during: [:globals | 
			(Class
			compileMethod: self _prepareImage_user_class_bug46059_patchSource
			dictionaries: GsCurrentSession currentSession symbolList
			category: '*change-notification') ifNotNil: [:ar | self error: 'did not compile' ]. ].
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImage_user_bug46217
	"patch needed: 3.2.0 thru 3.2.15, and 3.3.0 - run as GsDevKit user"

	self log: '	set GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS global true (bug 46217)'.
	self _currentUserGlobals at: #'GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS' put: true.
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImage_user_clear_subscriptions
	"need to clear subscriptions during bootstrap upgrade, because class initialization 
		methods are unconditionally fired, creating extra subscriptions for all subscribed classes."

	"bootstrap is the default upgrade path"

	| cls |
	self log: '	SystemLoginNotification Subscriptions cleared'.
	cls := self _globalNamed: 'SystemLoginNotification'.
	(cls _classVars at: #'Subscriptions') removeAll: (cls _classVars at: #'Subscriptions').
%

category: 'initialization'
method: GsuAbstractGsDevKitUpgrade
resolveForUpgrade
	"determine which concrete upgrade class to use, base on source GemStone version"
%

category: 'accessing'
method: GsuAbstractGsDevKitUpgrade
sourceGemStoneRelease

	^ sourceGemStoneRelease
%

category: 'accessing'
method: GsuAbstractGsDevKitUpgrade
sourceGemStoneRelease: aGsuGemStoneRelease

	sourceGemStoneRelease := aGsuGemStoneRelease
%

category: 'accessing'
method: GsuAbstractGsDevKitUpgrade
targetGemStoneRelease

	^ targetGemStoneRelease 
		ifNil: [ targetGemStoneRelease := self _defaultTargetRelease ]
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
updateDBFHistoryFinishUpgrade

	| curHist |

	curHist := ((GsCurrentSession currentSession objectNamed: self upgradeSymbolDictName) at: #DbfSeasideHistory ifAbsent: ['']).
	(GsCurrentSession currentSession objectNamed: self upgradeSymbolDictName) 
		at: #DbfSeasideHistory 
		put: curHist, 'image upgrade for GsDevKit completed at ', DateTime now asString, Character lf .

	self log: '	update dbf history for upgrade finish'.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
updateDBFHistoryStartUpgrade

	| history imageRelease |
	imageRelease := ImageVersion at: #gsRelease.
	history := String new.
	history addAll: ((GsCurrentSession currentSession objectNamed: self upgradeSymbolDictName) at: #DbfSeasideHistory ifAbsent: ['']).
	history addAll: 'Begin image upgrade for GsDevKit image ', imageRelease, '.'.
	history add: Character lf.
	(GsCurrentSession currentSession objectNamed:self upgradeSymbolDictName) at: #DbfSeasideHistory put: history.
	self log: '	update dbf history for upgrade start'.
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_bootstrapRelease

	self subclassResponsibility: #_bootstrapRelease
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_clearMetacelloCaches

	"Wipe out the Metacello registry ... if it exists"

	(self _globalNamed: #MetacelloProjectRegistration)
	  ifNotNil: [:cl | cl _classVars at: #Registry put: nil ].
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_defaultTargetRelease

	self subclassResponsibility: #_defaultTargetRelease
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_prepareImage_behavior_compileMethod_Category_patchSource

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
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_prepareImage_class_bug46217_patchSource

	^  'removeFromSystem
  "Bug 46217 - during bootstrap don''t remove any classes.
    during initial bootstrap no classes will be removed
    during upgrade unexpected classes should not be removed during the
      bootstrap operation"'
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_prepareImage_mcgemstoneplatform_bug46217_patchSource

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
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_prepareImage_pragmas_withPragmas_source
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
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_prepareImage_user_class_bug46059_patchSource

	^ 'removeFromSystem
| ar |
  ar := System myUserProfile dictionaryAndSymbolOf: self.
  ar ifNotNil: [ (ar at: 1) removeKey: (ar at: 2) ].'
%

! Class implementation for 'GsuGsDevKit_3_5_x_Upgrade'

!		Instance methods for 'GsuGsDevKit_3_5_x_Upgrade'

category: 'initialization'
method: GsuGsDevKit_3_5_x_Upgrade
asBootstrapUpgrade

	"All application methods in upgraded repository must be recompiled"

	"postLoadClassList is used in the bootstrap case"

	^ (GsuGsDevKit_3_5_x_BootstrapUpgrade upgradeUserName: self upgradeUserName sourceGemStoneRelease: self sourceGemStoneRelease)
			bootstrapPostLoadClassList: self bootstrapPostLoadClassList;
			yourself
%

category: 'initialization'
method: GsuGsDevKit_3_5_x_Upgrade
asStandardUpgrade

	"Application methods in upgraded repository do NOT need to recompiled"

	"postLoadClassList is not used in standard upgrade case"

	^ GsuGsDevKit_3_5_x_StdUpgrade upgradeUserName: self upgradeUserName sourceGemStoneRelease: self sourceGemStoneRelease
%

category: 'prepare image'
method: GsuGsDevKit_3_5_x_Upgrade
prepareImage_patches

	"Needed for installing GsdevKit/GLASS - should be run as System User"

	super prepareImage_patches.
	self log: '	patch Behavior >> _primitiveCompileMethod:symbolList:category:oldLitVars:intoMethodDict:intoCategories:intoPragmas:environmentId:'.
	(Behavior
		compileMethod: self _prepareImage_behavior_patchSource 
		dictionaries: self upgradeUserProfile symbolList 
		category:  '*Core35x') ifNotNil: [:ar | self error: 'did not compile' ]
%

category: 'initialization'
method: GsuGsDevKit_3_5_x_Upgrade
resolveForUpgrade
	"determine which concrete upgrade class to use, base on source GemStone version"

	super resolveForUpgrade.
	^ self sourceGemStoneRelease resolveForUpgradeToGemStone350: self
%

category: 'private'
method: GsuGsDevKit_3_5_x_Upgrade
_bootstrapRelease

	^ GsuGemStone_3_5_x_Release major: 3 minor: 5 patch: self _patchRelease
%

category: 'private'
method: GsuGsDevKit_3_5_x_Upgrade
_defaultTargetRelease

	^ GsuGemStone_3_5_x_Release major: 3 minor: 5
%

category: 'private'
method: GsuGsDevKit_3_5_x_Upgrade
_patchRelease

	^ 0
%

category: 'private'
method: GsuGsDevKit_3_5_x_Upgrade
_prepareImage_behavior_patchSource

	^ '_primitiveCompileMethod: sourceString symbolList: aSymbolList category: categorySymbol oldLitVars: litVarArray intoMethodDict: aMethodDict intoCategories: aCategDict intoPragmas: ignored environmentId: environmentId
  ^ self
    _primitiveCompileMethod: sourceString
    symbolList: aSymbolList
    category: categorySymbol
    oldLitVars: litVarArray
    intoMethodDict: aMethodDict
    intoCategories: aCategDict
    environmentId: environmentId'
%

! Class implementation for 'GsuGsDevKit_3_5_x_BootstrapUpgrade'

!		Instance methods for 'GsuGsDevKit_3_5_x_BootstrapUpgrade'

category: 'initialization'
method: GsuGsDevKit_3_5_x_BootstrapUpgrade
resolveForUpgrade
	"Receiver is already resolved"

	self objectSecurityPolicy: self upgradeUserProfile defaultObjectSecurityPolicy
%

! Class implementation for 'GsuGsDevKit_3_5_x_StdUpgrade'

!		Instance methods for 'GsuGsDevKit_3_5_x_StdUpgrade'

category: 'accessing'
method: GsuGsDevKit_3_5_x_StdUpgrade
buildString

	" 
		Standard -	method recompilation not required
		Bootstrap -	method recompilation required 
	"

	^ 'Standard'
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareGsDevKitImage_bootstrapGsDevkit

	"install GsdevKit from scratch"

	"noop for standard upgrade"
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareGsDevKitImage_bug46217_patch

	"Bug 46217 - during bootstrap don''t remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"

	"noop for standard upgrade"
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareGsDevKitImage_patch_compileMethodCategory
	"patch only needed suring standard upgrade ..."

	"will be overridden when Core package loaded"

	self log: '		Patching ...Behavior>>compileMethod:category:'.

	(Behavior
		compileMethod: self _prepareImage_behavior_compileMethod_Category_patchSource 
		dictionaries: self upgradeUserProfile symbolList 
		category: '*core-squeak') ifNotNil: [:ar | self error: 'did not compile' ].
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareGsDevKitImage_recompilePragmaMethods

	"Methods that references the ObsoletePragma class (pre-3.4) need to be recompiled."

	"Methods with pragmas need to be recompiled so that they reference the new Pragma class"

	| recompileBlock |
	self log: 'Prepare gsdevkit - recompile pragma methods'.
	recompileBlock := [:meth |
		| cls categ src |
		cls := meth inClass.
		src := meth sourceString.
		categ := cls categoryOfSelector: meth selector.
		cls
			_checkCompileResult:
				(cls
					compileMethod: src 
					dictionaries: System myUserProfile symbolList 
					category: categ 
					environmentId: 0)
			source: src ].
	self log: '	recompiling method referencing ObsoletePragma...'.
	self log: '		ObsoletePragma ', (ObsoleteClasses at: #ObsoletePragma) asOop printString.
	self log: '		System myUserProfile: ', System myUserProfile userId.
	((ClassOrganizer newWithRoot: Object forUserId: self upgradeUserName) referencesToObject: (ObsoleteClasses at: #ObsoletePragma))
		do: [:method |
			self log: '		', method inClass asString, (method inClass isMeta ifTrue: [' class'] ifFalse: ['']), '>>', method selector printString.
			recompileBlock value: method ].
	self log: '	recompiling methods with pragmas...'.
	self methodsWithPragmas
		do: [:method |
			GsFile gciLogServer: '		', method inClass asString, (method inClass isMeta ifTrue: [' class'] ifFalse: ['']), '>>', method selector printString.
			recompileBlock value: method ].	
	System commit.
	self log: '	done recompiling (commit)'.
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareGsDevKitImage_removeAllMethods

	"remove all methods in GsDevKit user classes"

	"noop for standard upgrade"
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareGsDevKitImage_resetExistingGlobalState

	"Reset and/or initialize any classes that may have invalid state carried over"

	self log: 'Prepare gsdevkit - reset existing global state'.

	(self _globalNamed: 'MCMockPackageInfo') initialize
%

category: 'prepare image user'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareImage_user_clear_subscriptions
	"no need to clear subscriptions during standard upgrade, because class initialization 
		methods will not be fired."

	self log: '	SystemLoginNotification Subscriptions NOT cleared'.
%

category: 'initialization'
method: GsuGsDevKit_3_5_x_StdUpgrade
resolveForUpgrade
	"Receiver is already resolved"

	self objectSecurityPolicy: self upgradeUserProfile defaultObjectSecurityPolicy
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_clearMetacelloCaches

	"Metacello caches used in calculating default values for application load specs, so cache
		application load specs before clearing the Metacello cache"

	self _glass1Loaded
		ifFalse: [ 
			"GLASS needs to have the caches cleared, since stale repository entries can cause trouble"
			self bootstrapApplicationLoadSpecs.
			super _clearMetacelloCaches ].
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_listUpgradeParameters

	^ #( )
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_singletonUpgradeParameters

	^ #( upgradeUserName upgradeSymbolDictName )
%

! Class implementation for 'GsuGsDevKitBootstrap'

!		Class methods for 'GsuGsDevKitBootstrap'

category: 'instance creation'
classmethod: GsuGsDevKitBootstrap
upgradeUserName: aString upgradeSymbolDictName: aSymbol bootstrapGemStoneRelease: bootstrapRelease

	^ (self new
			upgradeUserName: aString;
			upgradeSymbolDictName: aSymbol;
			yourself)
				bootstrapGemStoneRelease: bootstrapRelease;
				yourself
%

!		Instance methods for 'GsuGsDevKitBootstrap'

category: 'accessing'
method: GsuGsDevKitBootstrap
bootstrapGemStoneRelease

	^ bootstrapGemStoneRelease
%

category: 'accessing'
method: GsuGsDevKitBootstrap
bootstrapGemStoneRelease: aGsuAbstractGemStoneRelease

	^ bootstrapGemStoneRelease := aGsuAbstractGemStoneRelease
%

category: 'bootstrapping'
method: GsuGsDevKitBootstrap
bootstrapGsDevkit

	"install GsdevKit from scratch"

	"used to create extent0.seaside.dbf"

	self log: '	bootstrap GsDevKit'.

	"Bug 46217 - during bootstrap don't remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"
	self _currentUserGlobals at: #'GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS' put: true.

	self bootstrapMaster.
	self patchMaster.

	"Bug 46217"
	self _currentUserGlobals  removeKey: #'GS_BOOTSTRAP_MONTICELLO_SKIP_REMOVE_CLASS' ifAbsent: [].

	"Bulk migrate instances of classes that have new class versions 
		in their class history and clean up class history. 

		(probably ought to use the page-based migrate scheme to avoid
	running out of memory)"
	self log: '	GsDeployer bulkMigrate'.
	(self _globalNamed: 'GsDeployer') bulkMigrate: [].
	self log: '	done bulkMigrate'.

	"patch Class>>removeFromSystem until upgrade is complete, will be repaired during load"
	self log: '	patching patch Class>>removeFromSystem'.
	(Class
		compileMethod: self _bootstrap_class_removeFromSystem_patchSource 
		dictionaries: self upgradeUserProfile symbolList 
		category: '*change-notification') ifNotNil: [:ar | self error: 'did not compile' ].

	"force configurations to be reloaded if needed"
	self removeExistingConfigurations.

	self loadApplicationLoadSpecs.

	self log: '	... done bootstrap GsdevKit'.
%

category: 'bootstrapping'
method: GsuGsDevKitBootstrap
bootstrapMaster
	"formerly $upgradeDir/bootstrapMaster30.topaz"

	| undef |
	self log: '	bootstrap master'.

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
%

category: 'logging'
method: GsuGsDevKitBootstrap
logBootstrapParameters

	self log: 'Bootstrap parameters'.

	self bannerLogDash.

	self _logUpgradeParameters.

	self bannerLogDash.
%

category: 'bootstrapping'
method: GsuGsDevKitBootstrap
patchMaster
	"formerly $upgradeDir/patchMaster30.topaz"

	self log: '	patch master'.
	self log: '	... done patch master'.
%

category: 'private'
method: GsuGsDevKitBootstrap
_bootstrap_class_removeFromSystem_patchSource

	^  'removeFromSystem
  | ar |
ar := System myUserProfile dictionaryAndSymbolOf: self.
ar ifNotNil: [ (ar at: 1) removeKey: (ar at: 2) ].'
%

category: 'private'
method: GsuGsDevKitBootstrap
_bootstrap_positionableStream_original_contents_patchSource

	^  'originalContents
	"Answer the receiver''s actual contents collection, NOT a copy. 1/29/96 sw"'
%

category: 'private'
method: GsuGsDevKitBootstrap
_listUpgradeParameters

	^ #( bootstrapPostLoadClassList bootstrapApplicationLoadSpecs bootstrapExistingConfigurationList )
%

category: 'private'
method: GsuGsDevKitBootstrap
_removeClassNamed: className

	self log: '	Attempt to remove ', className printString.
	(self _globalNamed: className)
		ifNotNil: [:theClass | 
			theClass subclasses isEmpty
				ifTrue: [
					(System myUserProfile dictionariesAndSymbolsOf: theClass ) 
						do: [:ar | 
							(ar at: 1) removeKey: (ar at: 2).
							self log: '		remove class named ', (ar at: 2) printString, ' from symbol dictionary ', (ar at: 1) name printString ] ]
				ifFalse: [ self log: '		DID NOT remove class named: ', className printString ] ]
%

