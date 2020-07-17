prepare image
prepareImageBanner

	self bannerLogDash.
	self timeStampedLog:  'Starting ', self buildString, ' GsDevKit upgrade: prepare image as ', System myUserProfile userId.
	self log:  '	Upgrading ', self sourceGemStoneRelease printString, ' to ', self printString.
	self bannerLogDash.
	self logUpgradeParameters