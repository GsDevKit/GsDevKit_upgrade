instance creation
sourceGemStoneRelease: sourceRelease

	^ self new
		upgradeUserName: self gemstone_user;
		sourceGemStoneRelease: sourceRelease;
		resolveForUpgrade