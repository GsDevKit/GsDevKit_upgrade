logging
logBootstrapParameters

	self timeStampedLog: 'Bootstrap parameters'.

	self bannerLogDash.

	self _logUpgradeParameters.

	self bannerLogDash.