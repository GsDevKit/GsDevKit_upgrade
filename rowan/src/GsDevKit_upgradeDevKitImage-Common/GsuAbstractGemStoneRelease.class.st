Class {
	#name : 'GsuAbstractGemStoneRelease',
	#superclass : 'Object',
	#instVars : [
		'major',
		'minor',
		'patch'
	],
	#category : 'GsDevKit_upgradeDevKitImage-Common'
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
	} at: minor + 1
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

{ #category : 'bootstrapping' }
GsuAbstractGemStoneRelease >> bootstrapPackageFileNames [

	"answer an ordered list of the Monticello packages that are needed to bootstrap GsDevKit/GLASS into image"

	self subclassResponsibility: #bootstrapPackageFileNames
]

{ #category : 'debugging' }
GsuAbstractGemStoneRelease >> log: aString [

	GsFile gciLogServer: aString
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> major [

	^ major
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

	^ patch ifNil: [ 0 ]
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

	aGsDevKitUpgrade log: 'Prepare gsdevkit - enableSessionMethods'.
	aGsDevKitUpgrade prepareGsDevKitImage_enableSessionMethods
]

{ #category : 'prepare gsdevkit image' }
GsuAbstractGemStoneRelease >> prepareGsDevKitImage_existingConfigurationList:  aGsDevKitUpgrade [

	aGsDevKitUpgrade log: 'Prepare gsdevkit - create existing configuration list'.
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

	aGsDevKitUpgrade log: 'Prepare gsdevkit - patch bug 45952'.
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

{ #category : 'prepare image' }
GsuAbstractGemStoneRelease >> prepareImage_makeClassesObsolete: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	"noop by default"

	aGsDevKitUpgrade log: 'Prepare image - obsolete classes'.
]

{ #category : 'prepare image' }
GsuAbstractGemStoneRelease >> prepareImage_patches: aGsDevKitUpgrade [
	"Opportunity for target image to install any patches needed pre-upgrade"

	aGsDevKitUpgrade log: 'Prepare image - patches'.
	aGsDevKitUpgrade prepareImage_patches
]

{ #category : 'prepare image' }
GsuAbstractGemStoneRelease >> prepareImage_pragmasFor: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 1: set the stage for pragma upgrade"

	aGsDevKitUpgrade log: 'Prepare image - pragmas'.

	"noop by default"
]

{ #category : 'prepare image system user pragma' }
GsuAbstractGemStoneRelease >> prepareImage_systemuserPragmaFor: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 3: make pragma class obsolete"

	aGsDevKitUpgrade log: 'Prepare image - system user pragmas'.

	"noop by default"
]

{ #category : 'perpare image user' }
GsuAbstractGemStoneRelease >> prepareImage_user_clear_subscriptions: aGsDevKitUpgrade [
	"Opportunity for target image to perform user-specific preparation"

	aGsDevKitUpgrade log: 'Prepare image user - clear subscriptions'.
	aGsDevKitUpgrade prepareImage_user_clear_subscriptions
]

{ #category : 'perpare image user' }
GsuAbstractGemStoneRelease >> prepareImage_userPatches: aGsDevKitUpgrade [
	"Opportunity for target image to perform user-specific preparation"

	aGsDevKitUpgrade 
		log: 'Prepare image user - patches';
		prepareImage_user_bug46059
]

{ #category : 'prepare image user pragma' }
GsuAbstractGemStoneRelease >> prepareImage_userPragmaFor: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	"Part 2: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	aGsDevKitUpgrade log: 'Prepare image - user pragmas'.

	"noop by default"
]

{ #category : 'initialization' }
GsuAbstractGemStoneRelease >> resolveForUpgradeToGemStone350: aGsuGsDevKit_3_5_0_Upgrade [

	^ aGsuGsDevKit_3_5_0_Upgrade asStandardUpgrade
]
