Class {
	#name : 'GsuGsDevKit_3_5_0_StdUpgrade',
	#superclass : 'GsuGsDevKit_3_5_0_Upgrade',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImage_bug46217_patch [

	"Bug 46217 - during bootstrap don''t remove any classes.
		during initial bootstrap no classes will be removed
		during upgrade unexpected classes should not be removed during the
		bootstrap operation"

	"noop for standard upgrade"
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImage_clearMonticelloCaches [

	" clear caches - those that are unneeded or create problem during initial bootstrap load"

	"noop for standard upgrade"
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImage_removeAllMethods [

	"remove all methods in GsDevKit user classes"

	"noop for standard upgrade"
]

{ #category : 'prepare image' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareGsDevKitImageBanner [

	self bannerLog: 'Starting Standard GsDevKit upgrade: prepare gsdevkit image as ', System myUserProfile userId.
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_5_0_StdUpgrade >> prepareImage_user_clear_subscriptions [
	"no need to clear subscriptions during standard upgrade, because class initialization 
		methods will not be fired."

	self log: '	SystemLoginNotification Subscriptions NOT cleared'.
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
