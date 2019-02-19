Class {
	#name : 'GsuGsDevKit_3_5_0_StdUpgrade',
	#superclass : 'GsuGsDevKit_3_5_0_Upgrade',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'prepare image user' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareImage_user_clear_subscriptions [
	"no need to clear subscriptions during standard upgrade, because class initialization 
		methods will not be fired."

	self log: '	SystemLoginNotification Subscriptions NOT cleared'.
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_0_StdUpgrade >> resolveForUpgrade [
	"Receiver is already resolved"
]
