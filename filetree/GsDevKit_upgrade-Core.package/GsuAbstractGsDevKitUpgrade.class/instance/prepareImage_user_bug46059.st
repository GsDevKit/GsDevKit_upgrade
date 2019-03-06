prepare image user
prepareImage_user_bug46059

	"until bug is fixed - should be run as SystemUser"

	| package symbolDict class theSymbolList |
	self log: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	GsPackageLibrary 
		installMonticelloPackagesHome: (GsCurrentSession currentSession objectNamed: #'UserGlobals') 
		during: [:globals | 
			(Class
			compileMethod: self _prepareImage_user_class_bug46059_patchSource
			dictionaries: GsCurrentSession currentSession symbolList
			category: '*change-notification') ifNotNil: [:ar | self error: 'did not compile' ]. ].