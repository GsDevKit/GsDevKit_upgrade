prepare image user
prepareImageUserBanner

	self bannerLog: 'Starting ', self buildString, ' GsDevKit upgrade: prepare image for user ', System myUserProfile userId.
	self logUpgradeParameters