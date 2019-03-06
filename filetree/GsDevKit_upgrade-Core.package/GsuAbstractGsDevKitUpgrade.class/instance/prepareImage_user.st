phases
prepareImage_user
	"prepare image for upgrade"

	"run as gsdevkit user"

	self prepareImageUserBanner.
	self log: 'Prepare image user'.
	self sourceGemStoneRelease 
		prepareImage_userPatches: self;
		prepareImage_user_clear_subscriptions: self;
		yourself.
	self bannerLogDash.