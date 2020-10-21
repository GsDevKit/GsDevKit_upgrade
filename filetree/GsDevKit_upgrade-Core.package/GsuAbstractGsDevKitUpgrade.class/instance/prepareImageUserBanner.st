prepare image user
prepareImageUserBanner
	self
		bannerLog:
			'Starting ' , self buildString , ' GsDevKit upgrade: prepare image as user '
				, System myUserProfile userId.
	self logUpgradeParameters