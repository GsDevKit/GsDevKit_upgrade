Class {
	#name : 'GsuGsDevKit_3_5_0_Upgrade',
	#superclass : 'GsuAbstractGsDevKitUpgrade',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_5_0_Upgrade >> _defaultTargetRelease [

	^ GsuGemStone_3_5_x_Release major: 3 minor: 5
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_0_Upgrade >> asBootstrapUpgrade [

	"All application methods in upgraded repository must be recompiled"

	^ GsuGsDevKit_3_5_0_BootstrapUpgrade upgradeUserName: self upgradeUserName sourceGemStoneRelease: self sourceGemStoneRelease
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_0_Upgrade >> asStandardUpgrade [

	"Application methods in upgraded repository do NOT need to recompiled"

	^ GsuGsDevKit_3_5_0_StdUpgrade upgradeUserName: self upgradeUserName sourceGemStoneRelease: self sourceGemStoneRelease
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_0_Upgrade >> resolveForUpgrade [
	"determine which concrete upgrade class to use, base on source GemStone version"

	super resolveForUpgrade.
	^ self targetGemStoneRelease resolveForUpgradeToGemStone350: self
]