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

{ #category : 'prepare image user' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareImage_user_create_bootstrapApplicationPostloadClassList [
	"create BootstrapApplicationPostloadClassList, list of classes that should not be initialized during bootstrap"

	self log: '	BootstrapApplicationPostloadClassList NOT created'.
]

{ #category : 'prepare image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareImageBanner [

	self bannerLog: 'Starting Standard GsDevKit upgrade: prepare image as ', System myUserProfile userId.
]

{ #category : 'prepare image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareImageUserBanner [

	self bannerLog: 'Starting Standard GsDevKit upgrade: prepare image for user ', System myUserProfile userId.
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_0_StdUpgrade >> resolveForUpgrade [
	"Receiver is already resolved"
]
