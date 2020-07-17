prepare image
prepareImageDoneBanner

	self bannerLogDash.
	self timeStampedLog:  'Finished ', self buildString, ' GsDevKit upgrade: prepare image as ', System myUserProfile userId.
	self bannerLogDash.