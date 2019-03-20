phases
prepareImage_user
	"prepare image for upgrade"

	"
		1. prepareImage
		2. prepareImage_pragma_user
		3. prepareImage_pragma_systemuser
		4. prepareImage_user
		5. prepareGsDevKitImage.
	"

	"run as gsdevkit user"

	self prepareImageUserBanner.
	self log: 'Prepare image user'.
	self sourceGemStoneRelease 
		prepareImage_userPatches: self;
		prepareImage_user_clear_subscriptions: self;
		yourself.
	self bannerLogDash.