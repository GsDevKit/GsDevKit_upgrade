Class {
	#name : 'GsuFinworks_3_6_x_Upgrade',
	#superclass : 'GsuGsDevKit_3_6_x_Upgrade',
	#category : 'GsDevKit_upgrade-Finworks'
}

{ #category : 'private' }
GsuFinworks_3_6_x_Upgrade class >> _calculateUpgradeClass [
	| imageVersion |
	imageVersion := ImageVersion at: #'gsVersion'.
	(imageVersion beginsWith: '3.6')
		ifTrue: [ ^ self ].
	self error: 'Image version ' , imageVersion printString , ' not supported'
]

{ #category : 'application loading' }
GsuFinworks_3_6_x_Upgrade >> _onConflictBlock [
	^ [ :ex :loaded :incoming | ex useLoaded ]
]

{ #category : 'phases' }
GsuFinworks_3_6_x_Upgrade >> prepareGsDevKitImage [
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
	self prepareGsDevKitImageDoneBanner.
]
