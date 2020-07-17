Class {
	#name : 'GsuGsDevKit_3_5_x_BootstrapUpgrade',
	#superclass : 'GsuGsDevKit_3_5_x_Upgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'initialization' }
GsuGsDevKit_3_5_x_BootstrapUpgrade >> resolveForUpgrade [
	"Receiver is already resolved"

	self objectSecurityPolicy: self upgradeUserProfile defaultObjectSecurityPolicy
]
