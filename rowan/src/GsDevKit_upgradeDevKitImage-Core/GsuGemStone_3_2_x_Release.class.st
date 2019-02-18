Class {
	#name : 'GsuGemStone_3_2_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'initialization' }
GsuGemStone_3_2_x_Release >> resolveForUpgradeToGemStone350: aGsuGsDevKit_3_5_0_Upgrade [

	^ aGsuGsDevKit_3_5_0_Upgrade asBootstrapUpgrade
]
