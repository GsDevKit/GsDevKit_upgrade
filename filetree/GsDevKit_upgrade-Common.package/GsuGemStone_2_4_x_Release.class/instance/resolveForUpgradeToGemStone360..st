initialization
resolveForUpgradeToGemStone360: aGsuGsDevKit_3_6_0_Upgrade
	self
		error:
			'Upgrades to 3.6.x from ' , major asString , '.' , minor asString , '.'
				, self patch asString , ' is not supported'