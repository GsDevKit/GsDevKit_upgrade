Class {
	#name : 'GsuGsDevKit_3_7_x_Upgrade',
	#superclass : 'GsuGsDevKit_3_6_x_Upgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_7_x_Upgrade >> _defaultTargetRelease [

	^ GsuGemStone_3_7_x_Release major: 3 minor: 7  patch: self _patchRelease
]
