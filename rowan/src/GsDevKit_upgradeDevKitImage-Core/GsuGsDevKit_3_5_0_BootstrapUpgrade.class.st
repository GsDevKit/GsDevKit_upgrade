Class {
	#name : 'GsuGsDevKit_3_5_0_BootstrapUpgrade',
	#superclass : 'GsuGsDevKit_3_5_0_Upgrade',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'prepare image' }
GsuGsDevKit_3_5_0_BootstrapUpgrade >> prepareImageBanner [

	self bannerLog: 'Starting Bootstrap GsDevKit upgrade: prepare image as ', System myUserProfile userId.
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_0_BootstrapUpgrade >> resolveForUpgrade [
	"Receiver is already resolved"
]
