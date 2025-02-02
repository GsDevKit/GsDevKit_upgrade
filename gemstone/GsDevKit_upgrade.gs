!=========================================================================
! Copyright (C) GemTalk Systems 2019-2025.  All Rights Reserved.
! MIT license: see https://github.com/GsDevKit/GsDevKit_upgrade/blob/master/LICENSE
!
! File - seaside/bin/GsDevKit_upgrade.gs
!
! Purpose:
! Bootstrap GsDevKit_upgrade into a 3.x database to perform GsDevKit upgade operations.
!
!=======================================================================
! Class Declarations
! Generated file, do not Edit

doit
(Object
	subclass: 'GsuAbstractGemStoneRelease'
	instVarNames: #( major minor patch )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		comment: 'My subclasses and I represent the image being upgraded. The classes in the GsuAbstractGsDevKitUpgrade 
hierarchy represents the GemStone version being upgraded to. 

The specific GsuAbstractGsDevKitUpgrade sends messages to the image being upgraded and depending 
upon the version I represent, I send messages back to the GsuAbstractGsDevKitUpgrade which basically
describe the set of operations that need to be performed on the image to correctly upgrade to the 
target version.

There are 5 phases of the upgrade:
	1. prepareImage
	2. prepareImage_pragma_user
	3. prepareImage_pragma_systemuser
	4. prepareImage_user
	5. prepareGsDevKitImage.';
		immediateInvariant.
true.
%

removeallmethods GsuAbstractGemStoneRelease
removeallclassmethods GsuAbstractGemStoneRelease

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_2_4_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuGemStone_2_4_x_Release
removeallclassmethods GsuGemStone_2_4_x_Release

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_0_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuGemStone_3_0_x_Release
removeallclassmethods GsuGemStone_3_0_x_Release

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_1_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuGemStone_3_1_x_Release
removeallclassmethods GsuGemStone_3_1_x_Release

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_2_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuGemStone_3_2_x_Release
removeallclassmethods GsuGemStone_3_2_x_Release

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_3_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuGemStone_3_3_x_Release
removeallclassmethods GsuGemStone_3_3_x_Release

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_4_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuGemStone_3_4_x_Release
removeallclassmethods GsuGemStone_3_4_x_Release

doit
(GsuAbstractGemStoneRelease
	subclass: 'GsuGemStone_3_5_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuGemStone_3_5_x_Release
removeallclassmethods GsuGemStone_3_5_x_Release

doit
(GsuGemStone_3_5_x_Release
	subclass: 'GsuGemStone_3_6_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuGemStone_3_6_x_Release
removeallclassmethods GsuGemStone_3_6_x_Release

doit
(GsuGemStone_3_6_x_Release
	subclass: 'GsuGemStone_3_7_x_Release'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuGemStone_3_7_x_Release
removeallclassmethods GsuGemStone_3_7_x_Release

doit
(Object
	subclass: 'GsuAbstractGsDevKit'
	instVarNames: #( upgradeUserName upgradeSymbolDict upgradeSymbolDictName bootstrapPostLoadClassList bootstrapRepositoryDirectory bootstrapApplicationLoadSpecs bootstrapExistingConfigurationList skipLoadApplication )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Common';
		immediateInvariant.
true.
%

removeallmethods GsuAbstractGsDevKit
removeallclassmethods GsuAbstractGsDevKit

doit
(GsuAbstractGsDevKit
	subclass: 'GsuAbstractGsDevKitUpgrade'
	instVarNames: #( sourceGemStoneRelease targetGemStoneRelease methodsWithPragmas )
	classVars: #( TheSymbolDictionary )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
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

removeallmethods GsuAbstractGsDevKitUpgrade
removeallclassmethods GsuAbstractGsDevKitUpgrade

doit
(GsuAbstractGsDevKitUpgrade
	subclass: 'GsuGsDevKit_3_2_x_BootstrapUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Core';
		immediateInvariant.
true.
%

removeallmethods GsuGsDevKit_3_2_x_BootstrapUpgrade
removeallclassmethods GsuGsDevKit_3_2_x_BootstrapUpgrade

doit
(GsuAbstractGsDevKitUpgrade
	subclass: 'GsuGsDevKit_3_3_x_BootstrapUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Core';
		immediateInvariant.
true.
%

removeallmethods GsuGsDevKit_3_3_x_BootstrapUpgrade
removeallclassmethods GsuGsDevKit_3_3_x_BootstrapUpgrade

doit
(GsuAbstractGsDevKitUpgrade
	subclass: 'GsuGsDevKit_3_4_x_BootstrapUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Core';
		immediateInvariant.
true.
%

removeallmethods GsuGsDevKit_3_4_x_BootstrapUpgrade
removeallclassmethods GsuGsDevKit_3_4_x_BootstrapUpgrade

doit
(GsuAbstractGsDevKitUpgrade
	subclass: 'GsuGsDevKit_3_5_x_Upgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Core';
		immediateInvariant.
true.
%

removeallmethods GsuGsDevKit_3_5_x_Upgrade
removeallclassmethods GsuGsDevKit_3_5_x_Upgrade

doit
(GsuGsDevKit_3_5_x_Upgrade
	subclass: 'GsuGsDevKit_3_5_x_BootstrapUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Core';
		immediateInvariant.
true.
%

removeallmethods GsuGsDevKit_3_5_x_BootstrapUpgrade
removeallclassmethods GsuGsDevKit_3_5_x_BootstrapUpgrade

doit
(GsuGsDevKit_3_5_x_Upgrade
	subclass: 'GsuGsDevKit_3_5_x_StdUpgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Core';
		immediateInvariant.
true.
%

removeallmethods GsuGsDevKit_3_5_x_StdUpgrade
removeallclassmethods GsuGsDevKit_3_5_x_StdUpgrade

doit
(GsuGsDevKit_3_5_x_StdUpgrade
	subclass: 'GsuGsDevKit_3_6_x_Upgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Core';
		immediateInvariant.
true.
%

removeallmethods GsuGsDevKit_3_6_x_Upgrade
removeallclassmethods GsuGsDevKit_3_6_x_Upgrade

doit
(GsuGsDevKit_3_6_x_Upgrade
	subclass: 'GsuGsDevKit_3_7_x_Upgrade'
	instVarNames: #(  )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Core';
		immediateInvariant.
true.
%

removeallmethods GsuGsDevKit_3_7_x_Upgrade
removeallclassmethods GsuGsDevKit_3_7_x_Upgrade

doit
(GsuAbstractGsDevKit
	subclass: 'GsuGsDevKitBootstrap'
	instVarNames: #( bootstrapGemStoneRelease )
	classVars: #(  )
	classInstVars: #(  )
	poolDictionaries: #()
	inDictionary: GsDevKit_Upgrade_SymDict_private
	options: #()
)
		category: 'GsDevKit_upgrade-Bootstrap';
		immediateInvariant.
true.
%

removeallmethods GsuGsDevKitBootstrap
removeallclassmethods GsuGsDevKitBootstrap

! Class implementation for 'GsuAbstractGemStoneRelease'

!		Class methods for 'GsuAbstractGemStoneRelease'

category: 'logging'
classmethod: GsuAbstractGemStoneRelease
log: aString

	GsFile gciLogServer: aString
%

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

category: 'logging'
classmethod: GsuAbstractGemStoneRelease
timeStampedLog: aString
	"DateAndTime cannot reliably be printed during upgrade, because GLASS methods 
		are being called and those methods may not have been updated for the new release"

	self log: aString
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
		GsuGemStone_3_6_x_Release.
		GsuGemStone_3_7_x_Release.
	} at: minor + 1
%

category: 'private'
classmethod: GsuAbstractGemStoneRelease
_previousPatchVersionFor: primaryVersionPattern
  "Returns a single digit SmallInteger representing the patch version of the version we are upgrading from."

  | prevVer hist |
  prevVer := 0.
  (Globals at: #'DbfHistory' otherwise: nil)
    ifNotNil: [ :h | 
      | ofs |
      hist := h.
      ofs := hist
        _findLastString: 'upgrade to GemStone'
        startingAt: hist size
        ignoreCase: true.
      ofs == 0
        ifTrue: [ 
          (ImageVersion at: #'gsVersion' otherwise: nil)
            ifNotNil: [ :iVer | 
              ofs := 1.
              hist := '  ' , iVer , '  ' ] ].
      ofs ~~ 0
        ifTrue: [ 
          | subStr |
          subStr := hist copyFrom: 1 to: ofs.
          (subStr
            matchPattern:
              {$*.
             primaryVersionPattern.
              $*})
            ifTrue: [  | idx patchHist pattern |
				idx := hist 
					_findLastString: primaryVersionPattern
					startingAt: hist size
					ignoreCase: true.
				idx = 0
					ifTrue: [ self error: 'patch version not found' ].
				pattern := primaryVersionPattern copyFrom: 2 to: primaryVersionPattern size.
				patchHist :=  hist copyFrom: idx +1 + pattern size to: hist size.
				idx := patchHist _findString: ' '  startingAt: 1 ignoreCase: true.
				^(patchHist copyFrom: 1 to: idx) asNumber ]
            ifFalse: [ self error: 'version matching ', primaryVersionPattern printString, ' not found.' ] ] ].
  prevVer == 0
    ifTrue: [ self error: 'no previous version found' ].
  ^ prevVer
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

	self class log: aString
%

category: 'accessing'
method: GsuAbstractGemStoneRelease
major

	^ major ifNil: [ 3 ]
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

	^ patch ifNil: [ patch := self class _previousPatchVersionFor: self major asString, '.', self minor asString, '.' ]
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
prepareGsDevKitImage_cleanSessionMethodMetaData:  aGsDevKitUpgrade
	"Make a pass through the Session Method packages and remove 
		methods that are instances of GsMethod. Should only be done 
		when upgrading from from 3.2.x and earlier to 3.3.x through 3.5.x"

	aGsDevKitUpgrade prepareGsDevKitImage_cleanSessionMethodMetaData
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

	aGsDevKitUpgrade timeStampedLog: 'Prepare gsdevkit - enableSessionMethods'.
	aGsDevKitUpgrade prepareGsDevKitImage_enableSessionMethods
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_existingConfigurationList:  aGsDevKitUpgrade

	aGsDevKitUpgrade timeStampedLog: 'Prepare gsdevkit - create existing configuration list'.
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

	aGsDevKitUpgrade timeStampedLog: 'Prepare gsdevkit - patch bug 45952'.
	aGsDevKitUpgrade prepareGsDevKitImage_patch45952
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_patch46217:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_bug46217_patch
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_patch49622: aGsDevKitUpgrade
	aGsDevKitUpgrade prepareGsDevKitImage_bug49622_patch
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_patch_compileMethodCategory:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_patch_compileMethodCategory
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_patch__optionsForDefinition:  aGsDevKitUpgrade
  "in 3.6 Class>>_optionsForDefinition was replaced by Class>>_optionsStringForDefinition ... in 3.7, this became a problem so the method must be patched when upgrading to 3.7.0 from 3.4.x through 3.5.x"

	aGsDevKitUpgrade prepareGsDevKitImage_patch__optionsForDefinition
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
prepareGsDevKitImage_removeObsoleteClasses:  aGsDevKitUpgrade
	"opportunity to remove classes from GsDevKit image, what may be present in Globals"

	aGsDevKitUpgrade prepareGsDevKitImage_removeObsoleteClasses
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_resetExistingGlobalState:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_resetExistingGlobalState
%

category: 'prepare gsdevkit image'
method: GsuAbstractGemStoneRelease
prepareGsDevKitImage_validation:  aGsDevKitUpgrade

	aGsDevKitUpgrade prepareGsDevKitImage_validation
%

category: 'prepare image'
method: GsuAbstractGemStoneRelease
prepareImage_makeClassesObsolete: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"noop by default"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - obsolete classes'.
%

category: 'prepare image'
method: GsuAbstractGemStoneRelease
prepareImage_patches: aGsDevKitUpgrade
	"noop"
%

category: 'prepare image'
method: GsuAbstractGemStoneRelease
prepareImage_pragmasFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 1: set the stage for pragma upgrade"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - pragmas'.

	"noop by default"
	aGsDevKitUpgrade log: '	pragmas (noop)'.
%

category: 'prepare image system user pragma'
method: GsuAbstractGemStoneRelease
prepareImage_systemuserPragmaFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 3: make pragma class obsolete"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - system user pragmas'.

	"noop by default"
	aGsDevKitUpgrade log: '	pragmas (noop)'.
%

category: 'prepare image user'
method: GsuAbstractGemStoneRelease
prepareImage_userPatches: aGsDevKitUpgrade
	"Opportunity for target image to perform user-specific preparation"

	aGsDevKitUpgrade
		timeStampedLog: 'Prepare image user - patches';
		prepareImage_user_removeSessionMethods;
		prepareImage_user_bug46059;
		prepareImage_user_36x_fundamentals
%

category: 'prepare image user pragma'
method: GsuAbstractGemStoneRelease
prepareImage_userPragmaFor: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 2: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - user pragmas'.

	"noop by default"
	aGsDevKitUpgrade log: '	pragmas (noop)'.
%

category: 'prepare image user'
method: GsuAbstractGemStoneRelease
prepareImage_user_clear_subscriptions: aGsDevKitUpgrade
	"Opportunity for target image to perform user-specific preparation"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image user - clear subscriptions'.
	aGsDevKitUpgrade prepareImage_user_clear_subscriptions
%

category: 'printing'
method: GsuAbstractGemStoneRelease
printOn: aStream

	aStream 
		nextPutAll: self class name asString;
		nextPutAll: ' v', self major printString, '.', self minor printString, '.', self patch printString;
		yourself
%

category: 'initialization'
method: GsuAbstractGemStoneRelease
resolveForUpgradeToGemStone350: aGsuGsDevKit_3_5_0_Upgrade

	^ aGsuGsDevKit_3_5_0_Upgrade asStandardUpgrade
%

category: 'initialization'
method: GsuAbstractGemStoneRelease
resolveForUpgradeToGemStone360: aGsuGsDevKit_3_6_0_Upgrade

	^ aGsuGsDevKit_3_6_0_Upgrade asStandardUpgrade
%

category: 'debugging'
method: GsuAbstractGemStoneRelease
timeStampedLog: aString

	self class timeStampedLog: aString
%

! Class implementation for 'GsuGemStone_2_4_x_Release'

!		Instance methods for 'GsuGemStone_2_4_x_Release'

category: 'accessing'
method: GsuGemStone_2_4_x_Release
major

	^ major ifNil: [ 2 ]
%

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

category: 'initialization'
method: GsuGemStone_2_4_x_Release
resolveForUpgradeToGemStone360: aGsuGsDevKit_3_6_0_Upgrade
	self
		error:
			'Upgrades to 3.6.x from ' , major asString , '.' , minor asString , '.'
				, self patch asString , ' is not supported'
%

! Class implementation for 'GsuGemStone_3_0_x_Release'

!		Instance methods for 'GsuGemStone_3_0_x_Release'

category: 'accessing'
method: GsuGemStone_3_0_x_Release
minor

	^ minor ifNil: [ 0 ]
%

category: 'initialization'
method: GsuGemStone_3_0_x_Release
resolveForUpgradeToGemStone360: aGsuGsDevKit_3_6_0_Upgrade
	self
		error:
			'Upgrades to 3.6.x from ' , major asString , '.' , minor asString , '.'
				, self patch asString , ' is not supported'
%

! Class implementation for 'GsuGemStone_3_1_x_Release'

!		Instance methods for 'GsuGemStone_3_1_x_Release'

category: 'accessing'
method: GsuGemStone_3_1_x_Release
minor

	^ minor ifNil: [ 1 ]
%

category: 'prepare image'
method: GsuGemStone_3_1_x_Release
prepareImage_makeClassesObsolete: aGsDevKitUpgrade
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"In 3.1.0.6, bootstrapMaster30 script ignores BootstrapSymbolDictionaryName, so Pragma installed in Seaside user's UserGlobals"

	super prepareImage_makeClassesObsolete: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: (aGsDevKitUpgrade upgradeUserProfile objectNamed: 'UserGlobals')
%

category: 'initialization'
method: GsuGemStone_3_1_x_Release
resolveForUpgradeToGemStone360: aGsuGsDevKit_3_6_0_Upgrade
	self
		error:
			'Upgrades to 3.6.x from ' , major asString , '.' , minor asString , '.'
				, self patch asString , ' is not supported'
%

! Class implementation for 'GsuGemStone_3_2_x_Release'

!		Instance methods for 'GsuGemStone_3_2_x_Release'

category: 'accessing'
method: GsuGemStone_3_2_x_Release
minor

	^ minor ifNil: [ 2 ]
%

category: 'prepare image'
method: GsuGemStone_3_2_x_Release
prepareImage_patches: aGsDevKitUpgrade
	"Opportunity for target image to install any patches needed pre-upgrade"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - patches'.
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

category: 'initialization'
method: GsuGemStone_3_2_x_Release
resolveForUpgradeToGemStone360: aGsuGsDevKit_3_6_0_Upgrade
	self
		error:
			'Upgrades to 3.6.x from ' , major asString , '.' , minor asString , '.'
				, self patch asString , ' is not supported'
%

! Class implementation for 'GsuGemStone_3_3_x_Release'

!		Instance methods for 'GsuGemStone_3_3_x_Release'

category: 'accessing'
method: GsuGemStone_3_3_x_Release
minor

	^ minor ifNil: [ 3 ]
%

category: 'prepare gsdevkit image'
method: GsuGemStone_3_3_x_Release
prepareGsDevKitImage_cleanSessionMethodMetaData: aGsDevKitUpgrade
	"Make a pass through the Session Method packages and remove 
		methods that are instances of GsMethod. Should only be done 
		when upgrading from from 3.2.x and earlier to 3.3.x through 3.5.x"

	"noop"
%

category: 'prepare image'
method: GsuGemStone_3_3_x_Release
prepareImage_patches: aGsDevKitUpgrade
	"Opportunity for target image to install any patches needed pre-upgrade"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - patches'.
	aGsDevKitUpgrade prepareImage_patches.
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

category: 'accessing'
method: GsuGemStone_3_4_x_Release
minor

	^ minor ifNil: [ 4 ]
%

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
	aGsDevKitUpgrade timeStampedLog: '	obsolete classes (noop)'.
%

category: 'prepare image'
method: GsuGemStone_3_4_x_Release
prepareImage_patches: aGsDevKitUpgrade
	"Opportunity for target image to install any patches needed pre-upgrade"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - patches'.
	aGsDevKitUpgrade prepareImage_patches.
%

! Class implementation for 'GsuGemStone_3_5_x_Release'

!		Instance methods for 'GsuGemStone_3_5_x_Release'

category: 'bootstrapping'
method: GsuGemStone_3_5_x_Release
bootstrapPackageFileNames
	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	self patch < 4
		ifTrue: [ 
			"for 3.5.0 through 3.5.3"
			^ {'Core.v3-dkh.82.mcz'.
			'GemStone-Compression-dkh.1.mcz'.
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
			'Utf8Encoding.310-dkh.32.mcz'} ]
		ifFalse: [ 
			self patch = 4
				ifTrue: [ 
					"for 3.5.4"
					^ {'Core.v3-dkh.83.mcz'.
					'GemStone-Compression-dkh.1.mcz'.
					'Base-Bootstrap.v3-dkh.29.mcz'.
					'Bootstrap.v34-dkh.264.mcz'.
					'GemStone-ANSI-Streams-dkh.9.mcz'.
					'GemStone-Indexing-Extensions-dkh.3.mcz'.
					'Sport3.010.v3-dkh.29.mcz'.
					'Squeak.v34-dkh.339.mcz'.
					'Regex-Core-DaleHenrichs.3.mcz'.
					'Regex-Tests-Core-DaleHenrichs.5.mcz'.
					'PackageInfo-Base.g-dkh.36.mcz'.
					'Monticello.v3-dkh.458.mcz'.
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
					'Utf8Encoding.310-dkh.32.mcz'} ]
				ifFalse: [ 
					"for 3.5.5"
					^ {'Core.v3-dkh.85.mcz'.
					'GemStone-Compression-dkh.1.mcz'.
					'Base-Bootstrap.v3-dkh.29.mcz'.
					'Bootstrap.v34-dkh.265.mcz'.
					'GemStone-ANSI-Streams-dkh.9.mcz'.
					'GemStone-Indexing-Extensions-dkh.3.mcz'.
					'Sport3.010.v3-dkh.29.mcz'.
					'Squeak.v34-dkh.339.mcz'.
					'Regex-Core-DaleHenrichs.3.mcz'.
					'Regex-Tests-Core-DaleHenrichs.5.mcz'.
					'PackageInfo-Base.g-dkh.36.mcz'.
					'Monticello.v3-dkh.458.mcz'.
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
					'Utf8Encoding.310-dkh.32.mcz'} ] ]
%

category: 'accessing'
method: GsuGemStone_3_5_x_Release
minor

	^ minor ifNil: [ 5 ]
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
	aGsDevKitUpgrade timeStampedLog: '	obsolete classes (noop)'.
%

category: 'perpare image user'
method: GsuGemStone_3_5_x_Release
prepareImage_userPatches: aGsDevKitUpgrade
	"In 3.5, some Metacello methods were added to base image during 3.6.x upgrade, the methods are being removed.
		For those methods that hadn't been changed, session method overrides were not created, and some of the methods
		are used during upgradeSeasideImage, so they need to be replaced"

	super prepareImage_userPatches: aGsDevKitUpgrade.
	aGsDevKitUpgrade
		prepareImageUser_patches;
		prepareImage_user_patch_35x_Metacello
%

category: 'bootstrapping'
method: GsuGemStone_3_5_x_Release
reloadBootstrapPackageFileNames
	"answer an ordered list of the Monticello packages that are needed to reload GLASS into image"

	self patch < 4
		ifTrue: [ 
			"for 3.5.0 through 3.5.3"
			^ {'GemStone-Compression-dkh.1.mcz'.
			'Core.v3-dkh.82.mcz'.
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
			'Utf8Encoding.310-dkh.32.mcz'} ]
		ifFalse: [ 
			self patch = 4
				ifTrue: [ 
					"for 3.5.4"
					^ {'GemStone-Compression-dkh.1.mcz'.
					'Core.v3-dkh.83.mcz'.
					'Base-Bootstrap.v3-dkh.29.mcz'.
					'Bootstrap.v34-dkh.264.mcz'.
					'GemStone-ANSI-Streams-dkh.9.mcz'.
					'GemStone-Indexing-Extensions-dkh.3.mcz'.
					'Sport3.010.v3-dkh.29.mcz'.
					'Squeak.v34-dkh.339.mcz'.
					'Regex-Core-DaleHenrichs.3.mcz'.
					'Regex-Tests-Core-DaleHenrichs.5.mcz'.
					'PackageInfo-Base.g-dkh.36.mcz'.
					'Monticello.v3-dkh.458.mcz'.
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
					'Utf8Encoding.310-dkh.32.mcz'} ]
				ifFalse: [ 
					"for 3.5.5"
					^ {'GemStone-Compression-dkh.1.mcz'.
					'Core.v3-dkh.85.mcz'.
					'Base-Bootstrap.v3-dkh.29.mcz'.
					'Bootstrap.v34-dkh.265.mcz'.
					'GemStone-ANSI-Streams-dkh.9.mcz'.
					'GemStone-Indexing-Extensions-dkh.3.mcz'.
					'Sport3.010.v3-dkh.29.mcz'.
					'Squeak.v34-dkh.339.mcz'.
					'Regex-Core-DaleHenrichs.3.mcz'.
					'Regex-Tests-Core-DaleHenrichs.5.mcz'.
					'PackageInfo-Base.g-dkh.36.mcz'.
					'Monticello.v3-dkh.458.mcz'.
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
					'Utf8Encoding.310-dkh.32.mcz'} ] ]
%

! Class implementation for 'GsuGemStone_3_6_x_Release'

!		Instance methods for 'GsuGemStone_3_6_x_Release'

category: 'bootstrapping'
method: GsuGemStone_3_6_x_Release
bootstrapPackageFileNames
	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	self error: 'Bootstrap upgrades not supported for GemStone 3.6.x and beyond'
%

category: 'accessing'
method: GsuGemStone_3_6_x_Release
minor

	^ minor ifNil: [ 6]
%

category: 'prepare gsdevkit image'
method: GsuGemStone_3_6_x_Release
prepareGsDevKitImage_patch__optionsForDefinition: aGsDevKitUpgrade
	"in 3.6 Class>>_optionsForDefinition was replaced by Class>>_optionsStringForDefinition ... in 3.7, this became a problem so the method must be patched when upgrading to 3.7.0 from 3.4.x through 3.5.x"

	"noop 3.6 and beyond"
%

category: 'bootstrapping'
method: GsuGemStone_3_6_x_Release
reloadBootstrapPackageFileNames
	"answer an ordered list of the Monticello packages that are needed to reload GLASS into image"

	^ {'GemStone-Compression-dkh.1.mcz'.
	'Core.v3-dkh.85.mcz'.
	'GemStone-Compression-dkh.3.mcz'.
	'Base-Bootstrap.v3-dkh.29.mcz'.
	'Bootstrap.v34-dkh.265.mcz'.
	'GemStone-ANSI-Streams-dkh.9.mcz'.
	'GemStone-Indexing-Extensions-dkh.3.mcz'.
	'Sport3.010.v3-dkh.29.mcz'.
	'Squeak.v36-dkh.341.mcz'.
	'Regex-Core-DaleHenrichs.3.mcz'.
	'Regex-Tests-Core-DaleHenrichs.5.mcz'.
	'PackageInfo-Base.g-dkh.36.mcz'.
	'Monticello.v3-dkh.459.mcz'.
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
	'Utf8Encoding.310-dkh.32.mcz'}
%

! Class implementation for 'GsuGemStone_3_7_x_Release'

!		Instance methods for 'GsuGemStone_3_7_x_Release'

category: 'accessing'
method: GsuGemStone_3_7_x_Release
minor

	^ minor ifNil: [ 7]
%

category: 'prepare gsdevkit image'
method: GsuGemStone_3_7_x_Release
prepareGsDevKitImage_patch49622: aGsDevKitUpgrade
	"noop for upgrades from 3.7.0 or later"
%

category: 'bootstrapping'
method: GsuGemStone_3_7_x_Release
reloadBootstrapPackageFileNames
	"answer an ordered list of the Monticello packages that are needed to reload GLASS into image"

	^ {'GemStone-Compression-dkh.1.mcz'.
	'Core.v3-dkh.86.mcz'.
	'GemStone-Compression-dkh.3.mcz'.
	'Base-Bootstrap.v3-dkh.29.mcz'.
	'Bootstrap.v34-dkh.266.mcz'.
	'GemStone-ANSI-Streams-dkh.9.mcz'.
	'GemStone-Indexing-Extensions-dkh.3.mcz'.
	'Sport3.010.v3-dkh.29.mcz'.
	'Squeak.v36-dkh.343.mcz'.
	'Regex-Core-DaleHenrichs.3.mcz'.
	'Regex-Tests-Core-DaleHenrichs.5.mcz'.
	'PackageInfo-Base.g-dkh.36.mcz'.
	'Monticello.v3-dkh.460.mcz'.
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
	'Utf8Encoding.310-dkh.33.mcz'.
	'OB-Tools.v33-dkh.140.mcz' }
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
	self timeStampedLog: aString.
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
		ifNil: [ 
			"only set the default if the current user is the upgrade user"
			self upgradeUserName = System myUserProfile userId ifFalse: [ ^#() ].
			bootstrapApplicationLoadSpecs := self _defaultBootstrapApplicationLoadSpecs ]
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

	| count |

	self timeStampedLog: '	removing configuration classes'.

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
%

category: 'accessing'
method: GsuAbstractGsDevKit
skipLoadApplication

	^ skipLoadApplication ifNil: [ skipLoadApplication := false ]
%

category: 'accessing'
method: GsuAbstractGsDevKit
skipLoadApplication: aBool

	skipLoadApplication := aBool
%

category: 'logging'
method: GsuAbstractGsDevKit
timeStampedLog: aString
	"DateAndTime cannot reliably be printed during upgrade, because GLASS methods 
		are being called and those methods may not have been updated for the new release"

	self log: aString
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
			self timeStampedLog: '	load BaselineOfMetacello and BaselineOfTode (default)'.
			"first update Metacello and then update Tode and reload GLASS1 after updating Tode. 
				in 3.7.0, OB-Tools package changed and Tode only loades Base group of GLASS1,
				so it is prudent to reload GLASS1 to ensure that we pick up the full set of classes
				needed for new version."
			^	{
				{
					'Metacello'. 
					self _projectSpecForBaseline: 'BaselineOfMetacello'.
				}.
				{
					'Tode'. 
					self _projectSpecForBaseline: 'BaselineOfTode'.
				}.
				{
					'GLASS1'. 
					self _projectSpecForBaseline: 'BaselineOfGLASS1'.
				}.
			} ].
	self _glass1Loaded
		ifTrue: [
			self timeStampedLog: '	load BaselineOfMetacello and BaselineOfGLASS1 (default)'.
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
			self timeStampedLog: '	load BaselineOfMetacello and BaselineOfGsDevKit (default)'.
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
	self timeStampedLog: '	load ConfigurationOfGLASS'.
	^{}
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
_defaultConfigurationOfGLASS
	"If the bootstrap project changes name or version, then this method needs to be re-implemented for the affected upgrade classes"

	^ {
			'GLASS'. 
			'1.0-beta.9.2.2'. 
			#('default'). 
			nil.	"nill - use bootstrapRepositoryDirectory"
		}.
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
	ifNotNil: [ :deployerClass | deployerClass bulkMigrate: aBlock ]
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
_glassLoaded
	"GLASS is loaded when neither tODE, GLASS1, nor GsDevKit is loaded"

	^ (self _todeLoaded or: [ self _glass1Loaded or: [ self _gsDevKitLoaded ] ]) not
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

category: 'application loading'
method: GsuAbstractGsDevKit
_loadApplicationLoadSpecs: applicationLoadSpecs

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
								self timeStampedLog: '		', configurationClassName printString, ' version ', versionString printString , ' loads: ', loadList printString, ' from: ', repoPath printString.
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
%

category: 'logging'
method: GsuAbstractGsDevKit
_logUpgradeParameters

	self log: '	session methods ', (GsPackagePolicy enabled ifTrue: [ '(enabled)' ] ifFalse: [ '(disabled)' ]).
	self _singletonUpgradeParameters do: [:selectorSymbol |
		self log: '	', selectorSymbol asString, ' : ', (self perform: selectorSymbol) ].

	self _listUpgradeParameters do: [:selectorSymbol |
		self log: '	', selectorSymbol asString, ' : '.
		[ (self perform: selectorSymbol) 
			do: [:entry | self log: '		', entry printString ] 
		] on: Error do: [:ex  | self log: '			error extracting parameter ', ex description printString ] ]
%

category: 'private'
method: GsuAbstractGsDevKit
_projectSpecForBaseline: baselineClassName
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
%

category: 'application loading'
method: GsuAbstractGsDevKit
_reloadProjectNamed: projectName projectSpec: projectSpecOrNilOrString loads: loads
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
	loadListString := ' (default load)'.
	loadList isEmpty 
		ifFalse:  [ loadListString := ' loads: ', loadList printString ].

	repoDescription
		ifNotNil: [
			self bannerLog: '		Reloading Project ', projectName, ' repository: ', repoDescription printString, loadListString printString.
			metacello := ((self _globalNamed: 'Metacello') new) 
				baseline: projectName;
				repository: repoDescription ]
		ifNil: [ 
			projectSpec notNil
				ifTrue: [
					self bannerLog: '		Reloading Project ', projectName printString, loadListString printString.
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
%

category: 'private'
method: GsuAbstractGsDevKit
_resetMonticelloPackageRegistry

	"unload the 2.x only packages"
	self log: '	unload 2.x only packages'.
	(self _globalNamed: 'PackageInfo') registerPackageName: 'GemStone-Exceptions'.
	((self _globalNamed: 'MCWorkingCopy') forPackage: ((self _globalNamed: 'MCPackage') new name: 'GemStone-Exceptions')) unload.

	"start with a fresh package registry"
	self log: '	reset Monticello package registry'.
	(self _globalNamed: 'MCWorkingCopy') atClassInstVar: #registry put: nil.
	((self _globalNamed: 'PackageOrganizer') default instVarAt: ((self _globalNamed: 'PackageOrganizer') allInstVarNames indexOfIdentical: #'packages')) removeKey: 'Monticello-Mocks' ifAbsent: [].
%

category: 'private'
method: GsuAbstractGsDevKit
_singletonUpgradeParameters

	^ #( upgradeUserName upgradeSymbolDictName bootstrapRepositoryDirectory )
%

category: 'private'
method: GsuAbstractGsDevKit
_standardBaselineLoaded: baselineClassName
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
		sourceGemStoneRelease: self _calculateUpgradedVersion
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
_calculateUpgradeClass
	| imageVersion |
	imageVersion := ImageVersion at: #'gsVersion'.
	(imageVersion beginsWith: '3.5')
		ifTrue: [ ^ GsuGsDevKit_3_5_x_Upgrade ].
	(imageVersion beginsWith: '3.6')
		ifTrue: [ ^ GsuGsDevKit_3_6_x_Upgrade ].
	(imageVersion beginsWith: '3.7')
		ifTrue: [ ^ GsuGsDevKit_3_7_x_Upgrade ].
	self error: 'Image version ' , imageVersion printString , ' not supported'
%

category: 'private'
classmethod: GsuAbstractGsDevKitUpgrade
_calculateUpgradedVersion
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

category: 'private'
classmethod: GsuAbstractGsDevKitUpgrade
_upgradedVersionInt
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
%

!		Instance methods for 'GsuAbstractGsDevKitUpgrade'

category: 'bootstrapping'
method: GsuAbstractGsDevKitUpgrade
bootstrapGsDevkit

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
	self timeStampedLog: 'Upgrade parameters'.

	self bannerLogDash.

	self
		log:
			'Upgrading from ' , self sourceGemStoneRelease printString , ' to '
				, self printString.

	self _logUpgradeParameters.

	self bannerLogDash
%

category: 'accessing'
method: GsuAbstractGsDevKitUpgrade
major

	^ 3
%

category: 'accessing'
method: GsuAbstractGsDevKitUpgrade
methodsWithPragmas

	^ methodsWithPragmas ifNil: [ methodsWithPragmas := {} ]
%

category: 'accessing'
method: GsuAbstractGsDevKitUpgrade
minor

	self subclassResponsibiity: #minor
%

category: 'accessing'
method: GsuAbstractGsDevKitUpgrade
patch

	self subclassResponsibiity: #patch
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage
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
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImageBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit upgrade: prepare gsdevkit image as ', System myUserProfile userId.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImageDoneBanner

	self bannerLog: 'Finished ', self buildString, ' GsDevKit upgrade: prepare gsdevkit image as ', System myUserProfile userId.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_bootstrapGsDevkit

	"install GLASS from scratch"

	self timeStampedLog: 'Prepare gsdevkit - bootstrap GLASS1'.

	self upgradeGlass1
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_bug46217_patch

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
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_bug49622_patch
	"Bug 49622 - starting in 3.7.0 ReadByteStream an optimized version of ReadStream should be used 
		in GLASS applications instead of AnsiReadStream in subclasses of SequenceableCollection"

	"noop for pre-3.7.0 upgrades"
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_cleanSessionMethodMetaData
	"remove all instances of GsMethod from session method packages"

	"noop"
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_clearMetacelloCaches

	"GLASS needs to have the caches cleared, since stale repository entries can cause trouble"

	"Metacello caches used in calculating default values for application load specs, so cache
		application load specs before clearing the Metacello cache"

	self timeStampedLog: 'Prepare gsdevkit - clear Metacello caches'.

	self bootstrapApplicationLoadSpecs.
	(self _globalNamed: #MetacelloProjectRegistration)
	  ifNotNil: [:cl | cl _classVars at: #Registry put: nil ].
	System commit.

	self log: '	Metacello caches cleared (commit)'.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_clearMonticelloCaches

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
	   ifFalse: [ self  error: self upgradeSymbolDictName, ' must be the name of a SymbolDictionary' ].
	policy homeSymbolDict:  targetSymbolDictionary.
	policy externalSymbolList: Array new.

	System commit.

	GsPackagePolicy current refreshSessionMethodDictionary. "no persistent state modified"

	self log: '	session methods enabled (commit)'.
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_existingConfigurationList

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
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_loadApplicationCode
	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"

	"load application code"

	self timeStampedLog: 'Prepare gsdevkit - load GsDevKit application code'.

	"force configurations to be reloaded if needed"
	self removeExistingConfigurations.

	"now load application"

	self loadApplicationLoadSpecs.

	self log: '		load GsDevKit application code DONE (commit)'.
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
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_patch_compileMethodCategory
	"patch only needed suring standard upgrade ..."

	"noop"
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_patch__optionsForDefinition
	"_optionsForDefinition replaced by _optionsStringForDefinition in 3.6. Not used during upgrade until 3.7.0 upgrade. See _moveClassNamed:toNewSuperclassNamed:"

	"noop until 3.7.0"
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

	self timeStampedLog: 'Prepare gsdevkit - remove all methods'.

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
prepareGsDevKitImage_removeObsoleteClasses
	"opportunity to remove classes from GsDevKit image, what may be present in Globals"

	"noop until 3.7.0"
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_resetExistingGlobalState

	"Reset and/or initialize any classes that may have invalid state carried over"

	"noop for bootstrap (default)"
%

category: 'prepare gsdevkit  image'
method: GsuAbstractGsDevKitUpgrade
prepareGsDevKitImage_validation
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
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareImage
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
%

category: 'prepare image'
method: GsuAbstractGsDevKitUpgrade
prepareImageBanner

	self bannerLogDash.
	self timeStampedLog:  'Starting ', self buildString, ' GsDevKit upgrade: prepare image as ', System myUserProfile userId.
	self log:  '	Upgrading ', self sourceGemStoneRelease printString, ' to ', self printString.
	self bannerLogDash.
	self logUpgradeParameters
%

category: 'prepare image'
method: GsuAbstractGsDevKitUpgrade
prepareImageDoneBanner

	self bannerLogDash.
	self timeStampedLog:  'Finished ', self buildString, ' GsDevKit upgrade: prepare image as ', System myUserProfile userId.
	self bannerLogDash.
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImagePragmaSystemUserBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit pragma upgrade (part 2): prepare image pragma system user as ', System myUserProfile userId.
	self logUpgradeParameters
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImagePragmaSystemUserDoneBanner

	self bannerLog: 'Finished ', self buildString, ' GsDevKit pragma upgrade (part 2): prepare image pragma system user as ', System myUserProfile userId.
%

category: 'prepare image pragma user'
method: GsuAbstractGsDevKitUpgrade
prepareImagePragmaUserBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit pragma upgrade (part 1): prepare image pragma user as ', System myUserProfile userId.
	self logUpgradeParameters
%

category: 'prepare image pragma user'
method: GsuAbstractGsDevKitUpgrade
prepareImagePragmaUserDoneBanner

	self bannerLog: 'Finished ', self buildString, ' GsDevKit pragma upgrade (part 1): prepare image pragma user as ', System myUserProfile userId.
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImageUserBanner
	self
		bannerLog:
			'Starting ' , self buildString , ' GsDevKit upgrade: prepare image as user '
				, System myUserProfile userId.
	self logUpgradeParameters
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImageUserDoneBanner

	self bannerLog: 'Finished ', self buildString, ' GsDevKit upgrade: prepare image as user ', System myUserProfile userId.
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImageUser_patches
	"noop"
%

category: 'prepare image'
method: GsuAbstractGsDevKitUpgrade
prepareImage_bug46217_patch

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
	self timeStampedLog: '	Installing ...Pragma>>withPragmasIn:do:'.
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
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareImage_pragma_user
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
%

category: 'phases'
method: GsuAbstractGsDevKitUpgrade
prepareImage_user
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
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImage_user_36x_fundamentals
	"patches needed to load GLASS for 3.6.x and later"

	"noop for versions earlier than 3.6.x"
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImage_user_bug46059

	"until bug is fixed - should be run as SystemUser"

	self timeStampedLog: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	GsPackageLibrary 
		installMonticelloPackagesHome: self upgradeSymbolDict
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

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImage_user_patch_35x_Metacello
	"noop"
%

category: 'prepare image user'
method: GsuAbstractGsDevKitUpgrade
prepareImage_user_removeSessionMethods
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
%

category: 'printing'
method: GsuAbstractGsDevKitUpgrade
printOn: aStream

	aStream 
		nextPutAll: self class name asString;
		nextPutAll: ' v', self major printString, '.', self minor printString, '.', self patch printString;
		yourself
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

category: 'bootstrapping'
method: GsuAbstractGsDevKitUpgrade
upgradeGlass

	"install GLASS from scratch"

	self bootstrapGsDevkit upgradeGlass
%

category: 'bootstrapping'
method: GsuAbstractGsDevKitUpgrade
upgradeGlass1

	"install GLASS1 from scratch"

	self bootstrapGsDevkit upgradeGlass1
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_bootstrapRelease

	self subclassResponsibility: #_bootstrapRelease
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_defaultExistingConfigurationOfNames
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
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_defaultTargetRelease

	self subclassResponsibility: #_defaultTargetRelease
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_prepareGsDevKitImage_validate_session_methods
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
%

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_prepareGsDevKitImage_validate_user_methods
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

category: 'private'
method: GsuAbstractGsDevKitUpgrade
_reloadBootstrapPackages
	"(re)load the bootstraPackageFileNames for GLASS"

	"reload can only be done when no method recompilation is required"

	"noop"

	self log: '		_reloadBootstrapPackages noop'
%

category: 'debugging'
method: GsuAbstractGsDevKitUpgrade
_upgradeClassOops
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
%

! Class implementation for 'GsuGsDevKit_3_2_x_BootstrapUpgrade'

!		Instance methods for 'GsuGsDevKit_3_2_x_BootstrapUpgrade'

category: 'accessing'
method: GsuGsDevKit_3_2_x_BootstrapUpgrade
minor

	^ 2
%

! Class implementation for 'GsuGsDevKit_3_3_x_BootstrapUpgrade'

!		Instance methods for 'GsuGsDevKit_3_3_x_BootstrapUpgrade'

category: 'accessing'
method: GsuGsDevKit_3_3_x_BootstrapUpgrade
minor

	^ 3
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_3_x_BootstrapUpgrade
prepareGsDevKitImage_cleanSessionMethodMetaData
	"remove all instances of GsMethod from session method packages"

	| obsoleteGsMethodClass |
	obsoleteGsMethodClass := ObsoleteClasses at: #'GsMethod'.
	obsoleteGsMethodClass
		ifNil: [ 
			self
				timeStampedLog:
					'SKIP - clean session method state (no GsMethod class in ObsoleteClasses'.
			^ self ].
	self timeStampedLog: 'Prepare gsdevkit - clean session method state '.

	GsPackagePolicy current
		packages_Do: [ :gsPackage | 
			| badBoys |
			badBoys := Dictionary new.
			gsPackage sessionMethods
				keysAndValuesDo: [ :behavior :ar | 
					(ar at: 1)
						keysAndValuesDo: [ :selector :method | 
							(method isKindOf: obsoleteGsMethodClass)
								ifTrue: [ (badBoys at: behavior ifAbsentPut: [ Set new ]) add: selector ] ] ].
			badBoys
				keysAndValuesDo: [ :beh :sels | sels do: [ :sel | gsPackage removeMethodAt: sel for: beh ] ] ].

	System commit.

	self log: '	methods removed from session methods (commit)'
%

! Class implementation for 'GsuGsDevKit_3_4_x_BootstrapUpgrade'

!		Instance methods for 'GsuGsDevKit_3_4_x_BootstrapUpgrade'

category: 'accessing'
method: GsuGsDevKit_3_4_x_BootstrapUpgrade
minor

	^ 4
%

! Class implementation for 'GsuGsDevKit_3_5_x_Upgrade'

!		Instance methods for 'GsuGsDevKit_3_5_x_Upgrade'

category: 'initialization'
method: GsuGsDevKit_3_5_x_Upgrade
asBootstrapUpgrade

	"All application methods in upgraded repository must be recompiled"

	"postLoadClassList is used in the bootstrap case"

	^ (GsuGsDevKit_3_5_x_BootstrapUpgrade 
			upgradeUserName: self upgradeUserName 
				upgradeSymbolDictName: self upgradeSymbolDictName 
				sourceGemStoneRelease: self sourceGemStoneRelease)
			bootstrapPostLoadClassList: self bootstrapPostLoadClassList;
			yourself
%

category: 'initialization'
method: GsuGsDevKit_3_5_x_Upgrade
asStandardUpgrade

	"Application methods in upgraded repository do NOT need to recompiled"

	"postLoadClassList is not used in standard upgrade case"

	^ GsuGsDevKit_3_5_x_StdUpgrade 
		upgradeUserName: self upgradeUserName 
			upgradeSymbolDictName: self upgradeSymbolDictName 
			sourceGemStoneRelease: self sourceGemStoneRelease
%

category: 'accessing'
method: GsuGsDevKit_3_5_x_Upgrade
minor

	^ 5
%

category: 'accessing'
method: GsuGsDevKit_3_5_x_Upgrade
patch

	^ self _patchRelease
%

category: 'prepare image user'
method: GsuGsDevKit_3_5_x_Upgrade
patch_Behavior_primitiveCompileMethod: category
	"Needed for installing GsdevKit/GLASS - should be run as System User"

	self
		timeStampedLog:
			'	patch Behavior >> _primitiveCompileMethod:symbolList:category:oldLitVars:intoMethodDict:intoCategories:intoPragmas:environmentId: in category '
				, category asString printString , ' as ' , System myUserProfile userId.
	(Behavior
		compileMethod: self _prepareImage_behavior_patchSource
		dictionaries: self upgradeUserProfile symbolList
		category: category) ifNotNil: [ :ar | self error: 'did not compile' ]
%

category: 'prepare image user'
method: GsuGsDevKit_3_5_x_Upgrade
prepareImageUser_patches
	"Needed for installing GsdevKit/GLASS - should be run as Seaside User"

	self patch_Behavior_primitiveCompileMethod: #'*core'
%

category: 'prepare image'
method: GsuGsDevKit_3_5_x_Upgrade
prepareImage_patches
	"noop by default"
	self patch_Behavior_primitiveCompileMethod: #'upgrade 3.3 and 3.4 patch'
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
_baseVersion
	^ self major asString , '.' , self minor asString , '.'
%

category: 'private'
method: GsuGsDevKit_3_5_x_Upgrade
_bootstrapRelease

	^ GsuGemStone_3_5_x_Release major: 3 minor: 5 patch: self _patchRelease
%

category: 'private'
method: GsuGsDevKit_3_5_x_Upgrade
_defaultTargetRelease

	^ GsuGemStone_3_5_x_Release major: 3 minor: 5  patch: self _patchRelease
%

category: 'private'
method: GsuGsDevKit_3_5_x_Upgrade
_patchRelease
	| baseVersion imageVersion |
	baseVersion := self _baseVersion.
	imageVersion := ImageVersion at: #'gsVersion'.
	^ Integer
		fromString:
			(imageVersion copyFrom: baseVersion size + 1 to: imageVersion size)
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

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_5_x_BootstrapUpgrade
prepareGsDevKitImage_loadApplicationCode
	super prepareGsDevKitImage_loadApplicationCode.
	(self _globalNamed: 'TransactionBoundaryDefaultPolicy') isActive
		ifFalse: [ 
			"after application loaded, need to reenable SessionMethodTransactionBoundaryPolicy, since 
				TransactionBoundaryDefaultPolicy Current cvar cleared during upgrade"
			"https://github.com/GsDevKit/GsDevKit/issues/129"
			"internal bug 49225"
			(self _globalNamed: 'SessionMethodTransactionBoundaryPolicy') install.
			self
				timeStampedLog:
					'Prepare gsdevkit -  reenabled SessionMethodTransactionBoundaryPolicy' ]
%

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

	self _resetMonticelloPackageRegistry
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
prepareGsDevKitImage_clearMetacelloCaches

	"GLASS needs to have the caches cleared, since stale repository entries can cause trouble during reload"

	self _glassLoaded
		ifTrue: [ 
			^ super prepareGsDevKitImage_clearMetacelloCaches ].
	"caches are used for reloading BaselineOf"
	self log: 'Prepare gsdevkit - Metacello caches NOT cleared'.
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareGsDevKitImage_loadApplicationCode
	"explicitly load each of the configuration packages lised in boolStrapApplicationLoadSpecs"

	"load application code"

	self timeStampedLog: 'Prepare gsdevkit - load GsDevKit application code'.	"now load application"

	self loadApplicationLoadSpecs.

	self _reloadExistingConfigurations.

	(self _globalNamed: 'TransactionBoundaryDefaultPolicy') isActive
		ifFalse: [ 
			"after application loaded, need to reenable SessionMethodTransactionBoundaryPolicy, since 
				TransactionBoundaryDefaultPolicy Current cvar cleared during upgrade"
			"https://github.com/GsDevKit/GsDevKit/issues/129"
			"internal bug 49225"
			(self _globalNamed: 'SessionMethodTransactionBoundaryPolicy') install.
			self
				timeStampedLog:
					'Prepare gsdevkit -  reenabled SessionMethodTransactionBoundaryPolicy' ].

	self log: '		load GsDevKit application code DONE (commit)'
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareGsDevKitImage_patch_compileMethodCategory
	"patch only needed suring standard upgrade ..."

	"will be overridden when Core package loaded"

	self timeStampedLog: '		Patching ...Behavior>>compileMethod:category:'.

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
	self timeStampedLog: 'Prepare gsdevkit - recompile pragma methods'.
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

	self timeStampedLog: 'Prepare gsdevkit - reset existing global state'.

	(self _globalNamed: 'MCMockPackageInfo') initialize
%

category: 'prepare image user'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareImage_user_clear_subscriptions
	"no need to clear subscriptions during standard upgrade, because class initialization 
		methods will not be fired."

	self log: '	SystemLoginNotification Subscriptions NOT cleared'.
%

category: 'prepare image user'
method: GsuGsDevKit_3_5_x_StdUpgrade
prepareImage_user_removeSessionMethods
	"Remove all session methods as they must be recompiled during loading ... must be done before GsPackagePolicy is enabled"

	"noop"
%

category: 'initialization'
method: GsuGsDevKit_3_5_x_StdUpgrade
resolveForUpgrade
	"Receiver is already resolved"

	self objectSecurityPolicy: self upgradeUserProfile defaultObjectSecurityPolicy
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_defaultExistingConfigurationOfNames
	" These two configurations are the only configurations that must be removed, before loading GLASS1 or GsDevKit or tODE"

	| default |
	default := { #ConfigurationOfGsMisc . #ConfigurationOfGsCore . #ConfigurationOfGofer }.
	^ default
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_listUpgradeParameters

	^ #( )
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_prepareGsDevKitImage_validate_session_methods
	"return list of session methos that need recompilation"

	"noop"

	^ {}
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_prepareGsDevKitImage_validate_user_methods
	"return list of methos in upgrade symbol dictionary that need recompilation"

	"noop"

	^ {}
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_projectSpecForBaseline: baselineClassName
	"Have to extract project spec from regsitry without sending messages, because methods may need to be recompiled"

	"should only apply when doing bootstrap loads"

	^ nil	"project spec will be calculated at load time"
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_reloadBootstrapPackages
	"(re)load the bootstraPackageFileNames for GLASS"

	| dir |
	self skipLoadApplication
		ifTrue: [ 
			self timeStampedLog: '	skip reloading bootstrap packages'.
			^ self ].
	self timeStampedLog: '	reloading bootstrap packages from ', self bootstrapRepositoryDirectory.
	dir := (self _globalNamed: 'ServerFileDirectory') on: self bootstrapRepositoryDirectory.
	self targetGemStoneRelease reloadBootstrapPackageFileNames do: [:bootstrapPackageFileName |
		| packageVersion |
		packageVersion := bootstrapPackageFileName copyFrom: 1 to: bootstrapPackageFileName size - '.mcz' size.
		self log: '			', packageVersion, '	', bootstrapPackageFileName .
		(self _globalNamed: 'Gofer') new 
			directory: dir;
			version: packageVersion;
			load ]
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_reloadExistingConfigurations
	"before #loadApplicationLoadSpecs, we removed configurations from the image, and there could be methods that still reference, 
		so reload the default copies of configurations. The configurations are expected to be present in
		http://seaside.gemtalksystems.com/ss/MetacelloRepository"

	self bootstrapApplicationLoadSpecs isEmpty 
		ifTrue: [
			"no need to reload _defaultExistingConfigurationOfNames ... GLASS was reloaded"
			^ self ].
	self _defaultExistingConfigurationOfNames do: [:configName |
		self log: '		reloading existing configuration: ', configName asString.
		(self _globalNamed: 'Gofer') new 
			url: 'http://seaside.gemtalksystems.com/ss/MetacelloRepository';
			package: configName asString;
			load ].
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_singletonUpgradeParameters

	^ #( upgradeUserName upgradeSymbolDictName )
%

category: 'private'
method: GsuGsDevKit_3_5_x_StdUpgrade
_standardBaselineLoaded: baselineClassName
	"message-based implmentation since methods do not need recompilation"

	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
			(self _globalNamed: 'MetacelloProjectRegistration')
				ifNotNil: [ :cls | 
					(cls registrationForClassNamed: baselineClassName ifAbsent: [ ])
						ifNotNil: [ :registration | ^ registration loadedInImage ] ] ].
	^ false
%

! Class implementation for 'GsuGsDevKit_3_6_x_Upgrade'

!		Instance methods for 'GsuGsDevKit_3_6_x_Upgrade'

category: 'initialization'
method: GsuGsDevKit_3_6_x_Upgrade
asBootstrapUpgrade
	self error: 'Bootstrap upgrades not supported for GemStone 3.6.x'
%

category: 'initialization'
method: GsuGsDevKit_3_6_x_Upgrade
asStandardUpgrade

	"Application methods in upgraded repository do NOT need to recompiled"

	"postLoadClassList is not used in standard upgrade case"

	^ self
%

category: 'accessing'
method: GsuGsDevKit_3_6_x_Upgrade
minor

	^ 6
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_6_x_Upgrade
prepareGsDevKitImage_cleanSessionMethodMetaData
	"remove all instances of GsMethod from session method packages"

	"noop - 3.6.x and beyond cannot be upgraded from releases earlier than 3.3.x"
%

category: 'prepare image user'
method: GsuGsDevKit_3_6_x_Upgrade
prepareImage_user_36x_fundamentals
	"patches needed to load GLASS for 3.6.x and later"

	self
		prepareImage_user_recompileSelfCanBeSpecialSessionMethods;
		prepareImage_user_patch_Class__mcDefinitionType
%

category: 'prepare image user'
method: GsuGsDevKit_3_6_x_Upgrade
prepareImage_user_patch_35x_Metacello
	"In 3.5, some Metacello methods were added to base image during 3.6.x upgrade, the methods are being removed.
		For those methods that hadn't been changed, session method overrides were not created, and some of the methods
		are used during upgradeSeasideImage, so they need to be replaced"

	self timeStampedLog: '	patch Collection>>setLoadsInMetacelloProject:'.
	(Collection
		compileMethod:
			'setLoadsInMetacelloProject: aMetacelloPackageSpec
	aMetacelloPackageSpec setLoads: self asArray'
		dictionaries: self upgradeUserProfile symbolList
		category: '*metacello-mc') ifNotNil: [ :ar | self error: 'Collection>>setLoadsInMetacelloProject: did not compile' ].
	self timeStampedLog: '	patch String>>setLoadsInMetacelloProject:'.
	(String
		compileMethod:
			'setLoadsInMetacelloProject: aMetacelloPackageSpec
	aMetacelloPackageSpec setLoads: {self}'
		dictionaries: self upgradeUserProfile symbolList
		category: '*metacello-mc') ifNotNil: [ :ar | self error: 'String>>setLoadsInMetacelloProject: did not compile' ].
%

category: 'prepare image user'
method: GsuGsDevKit_3_6_x_Upgrade
prepareImage_user_patch_Class__mcDefinitionType
	"'_nonInheritedOptions replaced by _optionsArrayForDefinition"

	self timeStampedLog: '	patch Class>>_mcDefinitionType'.
	[ 
	Class
		compileMethod: self _prepareImage_class__mcDefinitionType_source
		category: '*monticello'
		using: self upgradeUserProfile symbolList ]
		onException: CompileError
		do: [ :ex | 
			self
				error:
					'Did not compile:
' , (GsNMethod _sourceWithErrors: ex errorDetails fromString: ex sourceString) ]
%

category: 'prepare image user'
method: GsuGsDevKit_3_6_x_Upgrade
prepareImage_user_recompileSelfCanBeSpecialSessionMethods
	"Needed for installing GsdevKit/GLASS, 3.6.x and later"

	self
		timeStampedLog:
			'	recompile extension methods in Date DateAndTimeANSI DateAndTime ScaledDecimal Time (classes with selfCanBeSpecial option)'.
	GsPackagePolicy currentOrNil
		ifNotNil: [ :pp | 
			{Date.
			DateAndTimeANSI.
			DateAndTime.
			ScaledDecimal.
			Time}
				do: [ :class | 
					{class.
					(class class)}
						do: [ :beh | 
							| categ dictsArray mDict cDict |
							dictsArray := pp
								methodAndCategoryDictionaryFor: beh
								source: 'youself'
								dictionaries: GsCurrentSession currentSession symbolList
								category: categ.
							mDict := dictsArray at: 1.
							cDict := dictsArray at: 2.
							mDict
								valuesDo: [ :meth | 
									meth
										recompileIntoMethodDict: mDict
										intoCategories: cDict
										symbolList: GsCurrentSession currentSession symbolList ] ] ] ]
%

category: 'initialization'
method: GsuGsDevKit_3_6_x_Upgrade
resolveForUpgrade
	"determine which concrete upgrade class to use, base on source GemStone version"

	super resolveForUpgrade.
	^ self sourceGemStoneRelease resolveForUpgradeToGemStone360: self
%

category: 'private'
method: GsuGsDevKit_3_6_x_Upgrade
_bootstrapRelease
	self error: 'bootstrap upgrades to ', self _baseVersion, 'x is not supported'
%

category: 'private'
method: GsuGsDevKit_3_6_x_Upgrade
_defaultTargetRelease

	^ GsuGemStone_3_6_x_Release major: 3 minor: 6  patch: self _patchRelease
%

category: 'private'
method: GsuGsDevKit_3_6_x_Upgrade
_prepareImage_class__mcDefinitionType_source
^' _mcDefinitionType
 | type opts superC |
  superC := self superClass.
  self isBytes
    ifTrue: [ type := #''bytes'' ]
    ifFalse: [ 
      self _portableIsIndexable
        ifTrue: [ type := #''variable'' ]
        ifFalse: [ type := #''normal'' ] ].
  opts := self _optionsArrayForDefinition.
  ^ opts size > 0
    ifTrue: [ 
      {type.
      opts} ]
    ifFalse: [ type ]'
%

! Class implementation for 'GsuGsDevKit_3_7_x_Upgrade'

!		Instance methods for 'GsuGsDevKit_3_7_x_Upgrade'

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_7_x_Upgrade
prepareGsDevKitImage_bug49622_patch
	"Bug 49622 - starting in 3.7.0 ReadByteStream an optimized version of ReadStream should be used 
		in GLASS applications instead of AnsiReadStream in SequenceableCollection snf String"

	| category |
	category := #'49622 patch'.
	self timeStampedLog: 'Prepare gsdevkit - patch 49622'.

	(SequenceableCollection
		compileMethod: 'readStream ^ AnsiReadStream on: self'
		dictionaries: self upgradeUserProfile symbolList
		category: category) ifNotNil: [ :ar | self error: 'did not compile' ].

	(String
		compileMethod: 'readStream ^ AnsiReadStream on: self'
		dictionaries: self upgradeUserProfile symbolList
		category: category) ifNotNil: [ :ar | self error: 'did not compile' ].
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_7_x_Upgrade
prepareGsDevKitImage_patch__optionsForDefinition
	"_optionsForDefinition replaced by _optionsStringForDefinition in 3.6. Not used during upgrade until 3.7.0 upgrade. See _moveClassNamed:toNewSuperclassNamed:"

	self prepareImage_user_patch_Class__optionsForDefinition
%

category: 'prepare gsdevkit  image'
method: GsuGsDevKit_3_7_x_Upgrade
prepareGsDevKitImage_removeObsoleteClasses
	"remove obsolete classes (those now implemented in base image, from GsDevKit image (upgradeSymbolDict) 
		and recompile methods that reference the obsolete class"

	"see https://github.com/GsDevKit/GsDevKit_upgrade/issues/29"

	"these obsolete GsDevKit classes are now present in the GemStone base 3.7.0 image and the GsDevKit implementations need to be removed"

	| obsoleteClassNames classOrganizer gsDevKitSymbolDict gsDevKitSymbolDictName assocs |
	gsDevKitSymbolDict := self upgradeSymbolDict.
	obsoleteClassNames := #(#'ZnCharacterWriteStream' #'ZnCharacterReadStream' #'ZnUTF8Encoder' #'ZnCharacterEncoder' #'ZnBufferedWriteStream' #'ZnBufferedReadStream' #'ZnCharacterEncodingError')
		select: [ :className | gsDevKitSymbolDict includesKey: className ].
	obsoleteClassNames isEmpty
		ifTrue: [ 
			self timeStampedLog: 'Prepare gsdevkit - no obsolete Zinc classes present'.
			^ self ].
	classOrganizer := ClassOrganizer new.
	gsDevKitSymbolDictName := gsDevKitSymbolDict name asString.
	self
		timeStampedLog:
			'Prepare gsdevkit - recompile remove obsolete Zinc classes (those replaced by base image) and recompile references to each class'.
	self
		_deploy: [ 
			"instance migration for the instances of ZnInvalidUTF8, ZnNullEncoder, and ZnByteEncoder"
			[ 
			self
				log:
					'	moving ZnInvalidUTF8, ZnNullEncoder, and ZnByteEncoder to their new superclasses in GemStone base'.
			assocs := {#'ZnCharacterEncodingError'.
			#'ZnCharacterEncoder'}
				collect: [ :className | 
					| assoc |
					assoc := gsDevKitSymbolDict associationAt: className.
					gsDevKitSymbolDict removeAssociation: assoc.
					assoc ].
			self
				_moveClassNamed: #'ZnInvalidUTF8'
				toNewSuperclassNamed: #'ZnCharacterEncodingError'.
			self
				_moveClassNamed: #'ZnNullEncoder'
				toNewSuperclassNamed: #'ZnCharacterEncoder'.
			self
				_moveClassNamed: #'ZnByteEncoder'
				toNewSuperclassNamed: #'ZnCharacterEncoder' ]
				ensure: [ assocs do: [ :assoc | gsDevKitSymbolDict addAssociation: assoc ] ] ].
	obsoleteClassNames
		do: [ :obsoleteClassName | 
			(gsDevKitSymbolDict at: obsoleteClassName ifAbsent: [  ])
				ifNil: [ 
					self
						log:
							'	ignoring class ' , obsoleteClassName
								, ' that are not in upgrade symbol dictionary ' , gsDevKitSymbolDictName ]
				ifNotNil: [ :obsoleteClass | 
					self log: '	remove ' , obsoleteClassName , ' from ' , gsDevKitSymbolDictName.
					obsoleteClass removeFromSystem.
					self log: '	scanning for methods referencing ' , obsoleteClassName.	"method references to the innocentBystanders will be repaired 
								when they are reloaded into the image"
					(classOrganizer referencesToObject: obsoleteClass)
						do: [ :aGsNMethod | 
							self
								log:
									'	recompiling ' , aGsNMethod inClass name , ' >> ' , aGsNMethod selector.
							aGsNMethod recompileFromSource ] ] ].
	System commit.
	self
		log:
			'	done removing obsolete classes and recompiling methods with references to obsolete classes.. (commit)'
%

category: 'prepare image user'
method: GsuGsDevKit_3_7_x_Upgrade
prepareImage_user_patch_Class__optionsForDefinition
	"_optionsForDefinition replaced by _optionsStringForDefinition in 3.6. Not used during upgrade until 3.7.0. See _moveClassNamed:toNewSuperclassNamed:"

	self
		timeStampedLog:
			'	patch Class >> _optionsForDefinition in category *core' , ' as ' , System myUserProfile userId.
	[ 
	Class
		compileMethod: self _prepareImage_class__optionsForDefinition_patchSource
		category: '*core'
		using: self upgradeUserProfile symbolList ]
		onException: CompileError
		do: [ :ex | 
			self
				error:
					'Did not compile:
' , (GsNMethod _sourceWithErrors: ex errorDetails fromString: ex sourceString) ]
%

category: 'private'
method: GsuGsDevKit_3_7_x_Upgrade
_defaultTargetRelease

	^ GsuGemStone_3_7_x_Release major: 3 minor: 7  patch: self _patchRelease
%

category: 'private'
method: GsuGsDevKit_3_7_x_Upgrade
_moveClassNamed: className toNewSuperclassNamed: superclassName
	| definition oldClass newClass |
	oldClass := self upgradeSymbolDict at: className.
	definition := oldClass
		definitionWithClassName: className
		superClassName: superclassName.
	newClass := definition evaluate.
	newClass
		copyMethodsFrom: oldClass
		dictionaries: GsSession currentSession symbolList
%

category: 'private'
method: GsuGsDevKit_3_7_x_Upgrade
_prepareImage_class__optionsForDefinition_patchSource

	^  '_optionsForDefinition
  "in 3.6 Class>>_optionsForDefinition was replaced by Class>>_optionsStringForDefinition ... in 3.7, this became a problem. Both are in the Core package"
	^ self _optionsStringForDefinition'
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
bootstrapGlass

	"bootstrrap GLASS 1.0-beta.9.2.2' "

	self timeStampedLog: '	bootstrap GLASS 1.0-beta.9.2.2'.

	"force configurations to be reloaded if needed"
	self removeExistingConfigurations.

	self _resetMonticelloPackageRegistry.

	"install the default version of GLASS"
	self log: '	install GLASS 1.0-beta.9.2.2'.
	self _loadApplicationLoadSpecs: { self _defaultConfigurationOfGLASS }.
	self bannerLogDash.
	self bannerLogDash.

	self log: '	... bootstrapped GLASS 1.0-beta.9.2.2'.
%

category: 'bootstrapping'
method: GsuGsDevKitBootstrap
bootstrapGsDevkit

	"install GsdevKit from scratch"

	"used to create extent0.seaside.dbf"

	self timeStampedLog: '	bootstrap GsDevKit'.

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

	self log: '	... done bootstrap GsdevKit'.
%

category: 'bootstrapping'
method: GsuGsDevKitBootstrap
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
%

category: 'logging'
method: GsuGsDevKitBootstrap
logBootstrapParameters

	self timeStampedLog: 'Bootstrap parameters'.

	self bannerLogDash.

	self _logUpgradeParameters.

	self bannerLogDash.
%

category: 'bootstrapping'
method: GsuGsDevKitBootstrap
patchMaster
	"formerly $upgradeDir/patchMaster30.topaz"

	self timeStampedLog: '	patch master'.
	self log: '	... done patch master'.
%

category: 'bootstrapping'
method: GsuGsDevKitBootstrap
upgradeGlass

	"use GsUpgrader to upgrade GLASS to usable version: GLASS 1.0-beta.9.3' "

	self timeStampedLog: '	install GLASS  1.0-beta.9.3'.

	self bootstrapGlass.

	"install GsUpgrader"
	self log: '	install GsUpgrader'.
	(self _globalNamed: 'Gofer') new 
		url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
		package: 'GsUpgrader-Core';
		load.

	self log: '	upGrade GLASS to 1.0-beta.9.3'.
	(self _globalNamed: 'GsUpgrader') upgradeGLASS.

	self bannerLogDash.
	self bannerLogDash.

	self log: '	... done upgrade GLASS to 1.0-beta.9.3'.
%

category: 'bootstrapping'
method: GsuGsDevKitBootstrap
upgradeGlass1

	"use GsUpgrader to install GLASS1 "

	self timeStampedLog: '	install GLASS1'.

	self bootstrapGlass.

	"install GsUpgrader"
	self log: '	installGsUpgrader'.
	(self _globalNamed: 'Gofer') new 
		url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
		package: 'GsUpgrader-Core';
		load.

	self log: '	upgrade to GLASS'.
	(self _globalNamed: 'GsUpgrader') upgradeGLASS.
true ifTrue: [ 
		"workaround for https://github.com/Metacello/metacello/issues/254, which is re-appearing again"
		"
			Metacello Issue 254 workaround
				unregistering (configuration): Gofer
				unregistering (configuration): FileTree
				unregistering (configuration): Metacello
				unregistering (configuration): Gofer Project Loader
				unregistering (configuration): Grease
				unregistering (configuration): SqueakCommon
		"
		| registry |
		self log: '	Metacello Issue 254 workaround'.
		registry := (self _globalNamed: 'MetacelloProjectRegistration') registry.
		registry configurationProjectSpecs copy do: [:projectSpec |
			projectSpec isConfigurationOfProjectSpec ifFalse: [ self log: '		unregistering (configuration): ' , projectSpec name. projectSpec unregisterProject ] ].
		registry baselineProjectSpecs copy do: [:projectSpec | 
			projectSpec isBaselineOfProjectSpec ifFalse: [ self log: '		unregistering (baseline): ' , projectSpec name. projectSpec unregisterProject ]].
		{ 
			{'FileTree' . 'github://dalehenrich/filetree:gemstone2.4/repository' } .
			{'Metacello' . 'github://dalehenrich/metacello-work:master/repository' } .
			{'Grease' . 'github://GsDevKit/Grease:master/repository' } .
		} do: [:ar |
			(self _globalNamed: 'Metacello') new
				baseline: (ar at: 1);
				repository: (ar at: 2);
				lock ].
		{ 
			{'Gofer' .  'http://seaside.gemtalksystems.com/ss/metacello'} .
		} do: [:ar |
			(self _globalNamed: 'Metacello') new
				configuration: (ar at: 1);
				repository: (ar at: 2);
				lock ].
 ].
false ifTrue:  [
	self log: '	upgrade to GLASS1'.
	(self _globalNamed: 'GsUpgrader') upgradeGLASS1 ].

	self bannerLogDash.
	self bannerLogDash.

	self log: '	... done install GLASS1'.
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

! End File - seaside/bin/GsDevKit_upgrade.gs
