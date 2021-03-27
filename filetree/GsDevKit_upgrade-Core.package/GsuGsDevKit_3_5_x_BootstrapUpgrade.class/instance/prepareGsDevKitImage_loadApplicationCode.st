prepare gsdevkit  image
prepareGsDevKitImage_loadApplicationCode
	super prepareGsDevKitImage_loadApplicationCode.
	(self _globalNamed: 'TransactionBoundaryDefaultPolicy') isActive
		ifFalse: [ 
			"after application loaded, need to reenable SessionMethodTransactionBoundaryPolicy, since 
				TransactionBoundaryDefaultPolicy Current cvar cleared during upgrade"
			"https://github.com/GsDevKit/GsDevKit/issues/129"
			"internal bug 49225"
			(self _globalNamed: 'SessionMethodTransactionBoundaryPolicy') install.
			self
				timeStampedLog:
					'Prepare gsdevkit -  reenabled SessionMethodTransactionBoundaryPolicy' ]