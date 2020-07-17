prepare image user
prepareImage_user_bug46059

	"until bug is fixed - should be run as SystemUser"

	self timeStampedLog: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	GsPackageLibrary 
		installMonticelloPackagesHome: self upgradeSymbolDict
		during: [:globals | 
			(Class
			compileMethod: self _prepareImage_user_class_bug46059_patchSource
			dictionaries: GsCurrentSession currentSession symbolList
			category: '*change-notification') ifNotNil: [:ar | self error: 'did not compile' ]. ].