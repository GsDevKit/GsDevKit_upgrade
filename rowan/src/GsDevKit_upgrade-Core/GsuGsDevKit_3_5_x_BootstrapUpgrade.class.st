Class {
	#name : 'GsuGsDevKit_3_5_x_BootstrapUpgrade',
	#superclass : 'GsuGsDevKit_3_5_x_Upgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_x_BootstrapUpgrade >> prepareGsDevKitImage_loadApplicationCode [
	super prepareGsDevKitImage_loadApplicationCode.
	(self _globalNamed: 'TransactionBoundaryDefaultPolicy') isActive
		ifFalse: [ 
			"after application loaded, need to reenable SessionMethodTransactionBoundaryPolicy, since 
				TransactionBoundaryDefaultPolicy Current cvar cleared during upgrade"
			"https://github.com/GsDevKit/GsDevKit/issues/129"
			"internal bug 49225"
			(self _globalNamed: 'SessionMethodTransactionBoundaryPolicy') install.
			self
				timeStampedLog:
					'Prepare gsdevkit -  reenabled SessionMethodTransactionBoundaryPolicy' ]
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_x_BootstrapUpgrade >> resolveForUpgrade [
	"Receiver is already resolved"

	self objectSecurityPolicy: self upgradeUserProfile defaultObjectSecurityPolicy
]
