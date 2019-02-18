Class {
	#name : 'GsuGsDevKit_3_5_0_BootstrapUpgrade',
	#superclass : 'GsuGsDevKit_3_5_0_Upgrade',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'phases' }
GsuGsDevKit_3_5_0_BootstrapUpgrade >> prepareImageBanner [

	self bannerLog: 'Starting Bootstrap GsDevKit upgrade'.
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_0_BootstrapUpgrade >> resolveForUpgrade [
	"Receiver is already resolved"
]
