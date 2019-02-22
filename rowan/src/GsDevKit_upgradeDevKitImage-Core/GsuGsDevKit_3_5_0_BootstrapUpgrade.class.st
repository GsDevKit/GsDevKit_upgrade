Class {
	#name : 'GsuGsDevKit_3_5_0_BootstrapUpgrade',
	#superclass : 'GsuGsDevKit_3_5_0_Upgrade',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'initialization' }
GsuGsDevKit_3_5_0_BootstrapUpgrade >> resolveForUpgrade [
	"Receiver is already resolved"

	self objectSecurityPolicy: self upgradeUserProfile defaultObjectSecurityPolicy
]
