"
My subclasses and I represent the image being upgraded. The classes in the GsuAbstractGsDevKitUpgrade 
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
	5. prepareGsDevKitImage.
"
Class {
	#name : 'GsuAbstractGemStoneRelease',
	#superclass : 'Object',
	#instVars : [
		'major',
		'minor',
		'patch'
	],
	#category : 'GsDevKit_upgrade-Common'
}

{ #category : 'private' }
GsuAbstractGemStoneRelease class >> _classForMajorVersion: major minorVersion: minor [

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
	} at: minor + 1
]

{ #category : 'private' }
GsuAbstractGemStoneRelease class >> _previousPatchVersionFor: primaryVersionPattern [
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
]

{ #category : 'logging' }
GsuAbstractGemStoneRelease class >> log: aString [

	GsFile gciLogServer: aString
]

{ #category : 'instance creation' }
GsuAbstractGemStoneRelease class >> major: major minor: minor [

	^ (self _classForMajorVersion: major minorVersion: minor) new
		major: major;
		minor: minor;
		yourself
]

{ #category : 'instance creation' }
GsuAbstractGemStoneRelease class >> major: major minor: minor patch: patch [

	^ (self _classForMajorVersion: major minorVersion: minor) new
		major: major;
		minor: minor;
		patch: patch asInteger;
		yourself
]

{ #category : 'logging' }
GsuAbstractGemStoneRelease class >> timeStampedLog: aString [
	"DateAndTime cannot reliably be printed during upgrade, because GLASS methods 
		are being called and those methods may not have been updated for the new release"

	self log: aString
]

{ #category : 'bootstrapping' }
GsuAbstractGemStoneRelease >> bootstrapPackageFileNames [

	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	self subclassResponsibility: #bootstrapPackageFileNames
]

{ #category : 'debugging' }
GsuAbstractGemStoneRelease >> log: aString [

	self class log: aString
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> major [

	^ major ifNil: [ 3 ]
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> major: anInteger [

	major := anInteger
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> minor [

	^ minor
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> minor: anInteger [

	minor := anInteger
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> patch [

	^ patch ifNil: [ patch := self class _previousPatchVersionFor: self major asString, '.', self minor asString, '.' ]
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> patch_compileMethodCategory:  aGsDevKitUpgrade [

	aGsDevKitUpgrade patch_compileMethodCategory
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> patch: anInteger [

	patch := anInteger
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_bootstrapGsDevkit:  aGsDevKitUpgrade [

	aGsDevKitUpgrade prepareGsDevKitImage_bootstrapGsDevkit
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_clearMonticelloCaches:  aGsDevKitUpgrade [

	aGsDevKitUpgrade 
		prepareGsDevKitImage_clearMonticelloCaches;
		prepareGsDevKitImage_clearMetacelloCaches
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_enableSessionMethods:  aGsDevKitUpgrade [

	aGsDevKitUpgrade timeStampedLog: 'Prepare gsdevkit - enableSessionMethods'.
	aGsDevKitUpgrade prepareGsDevKitImage_enableSessionMethods
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_existingConfigurationList:  aGsDevKitUpgrade [

	aGsDevKitUpgrade timeStampedLog: 'Prepare gsdevkit - create existing configuration list'.
	aGsDevKitUpgrade prepareGsDevKitImage_existingConfigurationList
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_loadApplicationCode:  aGsDevKitUpgrade [

	aGsDevKitUpgrade prepareGsDevKitImage_loadApplicationCode
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_patch_compileMethodCategory:  aGsDevKitUpgrade [

	aGsDevKitUpgrade prepareGsDevKitImage_patch_compileMethodCategory
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_patch45952:  aGsDevKitUpgrade [

	"bug 45952 ... image/bootstrapMaster.topaz for 3.1.0.6 ignored BootstrapSymbolDictionaryName"

	aGsDevKitUpgrade timeStampedLog: 'Prepare gsdevkit - patch bug 45952'.
	aGsDevKitUpgrade prepareGsDevKitImage_patch45952
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_patch46217:  aGsDevKitUpgrade [

	aGsDevKitUpgrade prepareGsDevKitImage_bug46217_patch
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_recompilePragmaMethods:  aGsDevKitUpgrade [

	aGsDevKitUpgrade prepareGsDevKitImage_recompilePragmaMethods
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_removeAllMethods:  aGsDevKitUpgrade [

	aGsDevKitUpgrade prepareGsDevKitImage_removeAllMethods
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_resetExistingGlobalState:  aGsDevKitUpgrade [

	aGsDevKitUpgrade prepareGsDevKitImage_resetExistingGlobalState
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_validation:  aGsDevKitUpgrade [

	aGsDevKitUpgrade prepareGsDevKitImage_validation
]

{ #category : 'prepare image' }
GsuAbstractGemStoneRelease >> prepareImage_makeClassesObsolete: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"noop by default"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - obsolete classes'.
]

{ #category : 'prepare image' }
GsuAbstractGemStoneRelease >> prepareImage_patches: aGsDevKitUpgrade [
	"Opportunity for target image to install any patches needed pre-upgrade"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - patches'.
	aGsDevKitUpgrade prepareImage_patches
]

{ #category : 'prepare image' }
GsuAbstractGemStoneRelease >> prepareImage_pragmasFor: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 1: set the stage for pragma upgrade"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - pragmas'.

	"noop by default"
	aGsDevKitUpgrade log: '	pragmas (noop)'.
]

{ #category : 'prepare image system user pragma' }
GsuAbstractGemStoneRelease >> prepareImage_systemuserPragmaFor: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 3: make pragma class obsolete"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - system user pragmas'.

	"noop by default"
	aGsDevKitUpgrade log: '	pragmas (noop)'.
]

{ #category : 'prepare image user' }
GsuAbstractGemStoneRelease >> prepareImage_user_clear_subscriptions: aGsDevKitUpgrade [
	"Opportunity for target image to perform user-specific preparation"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image user - clear subscriptions'.
	aGsDevKitUpgrade prepareImage_user_clear_subscriptions
]

{ #category : 'prepare image user' }
GsuAbstractGemStoneRelease >> prepareImage_userPatches: aGsDevKitUpgrade [
	"Opportunity for target image to perform user-specific preparation"

	aGsDevKitUpgrade
		timeStampedLog: 'Prepare image user - patches';
		prepareImage_user_removeSessionMethods;
		prepareImage_user_bug46059;
		prepareImage_user_36x_fundamentals
]

{ #category : 'prepare image user pragma' }
GsuAbstractGemStoneRelease >> prepareImage_userPragmaFor: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 2: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - user pragmas'.

	"noop by default"
	aGsDevKitUpgrade log: '	pragmas (noop)'.
]

{ #category : 'printing' }
GsuAbstractGemStoneRelease >> printOn: aStream [

	aStream 
		nextPutAll: self class name asString;
		nextPutAll: ' v', self major printString, '.', self minor printString, '.', self patch printString;
		yourself
]

{ #category : 'initialization' }
GsuAbstractGemStoneRelease >> resolveForUpgradeToGemStone350: aGsuGsDevKit_3_5_0_Upgrade [

	^ aGsuGsDevKit_3_5_0_Upgrade asStandardUpgrade
]

{ #category : 'initialization' }
GsuAbstractGemStoneRelease >> resolveForUpgradeToGemStone360: aGsuGsDevKit_3_6_0_Upgrade [

	^ aGsuGsDevKit_3_6_0_Upgrade asStandardUpgrade
]

{ #category : 'debugging' }
GsuAbstractGemStoneRelease >> timeStampedLog: aString [

	self class timeStampedLog: aString
]
