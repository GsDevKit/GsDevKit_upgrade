logging
logUpgradeParameters
	self timeStampedLog: 'Upgrade parameters'.

	self bannerLogDash.

	self
		log:
			'Upgrading from ' , self sourceGemStoneRelease printString , ' to '
				, self targetGemStoneRelease printString.

	self _logUpgradeParameters.

	self bannerLogDash