Class {
	#name : 'GsuGsDevKit_3_6_x_StdUpgrade',
	#superclass : 'GsuGsDevKit_3_5_x_StdUpgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_6_x_StdUpgrade >> _bootstrapRelease [

	^ GsuGemStone_3_6_x_Release major: 3 minor: 6 patch: self _patchRelease
]

{ #category : 'private' }
GsuGsDevKit_3_6_x_StdUpgrade >> _defaultTargetRelease [

	^ GsuGemStone_3_6_x_Release major: 3 minor: 6  patch: self _patchRelease
]

{ #category : 'initialization' }
GsuGsDevKit_3_6_x_StdUpgrade >> asBootstrapUpgrade [
	self error: 'Bootstrap upgrades not supported for GemStone 3.6.x'
]

{ #category : 'initialization' }
GsuGsDevKit_3_6_x_StdUpgrade >> asStandardUpgrade [

	"Application methods in upgraded repository do NOT need to recompiled"

	"postLoadClassList is not used in standard upgrade case"

	^ self
]

{ #category : 'initialization' }
GsuGsDevKit_3_6_x_StdUpgrade >> resolveForUpgrade [
	"determine which concrete upgrade class to use, base on source GemStone version"

	super resolveForUpgrade.
	^ self sourceGemStoneRelease resolveForUpgradeToGemStone360: self
]
