prepare image user
prepareImage_user_clear_subscriptions
	"need to clear subscriptions during bootstrap upgrade, because class initialization 
		methods are unconditionally fired, creating extra subscriptions for all subscribed classes."

	"bootstrap is the default upgrade path"

	| cls |
	self log: '	SystemLoginNotification Subscriptions cleared'.
	cls := self _globalNamed: 'SystemLoginNotification'.
	(cls _classVars at: #'Subscriptions') removeAll: (cls _classVars at: #'Subscriptions').