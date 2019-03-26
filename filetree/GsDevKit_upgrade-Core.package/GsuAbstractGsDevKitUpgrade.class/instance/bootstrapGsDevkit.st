bootstrapping
bootstrapGsDevkit

	"install GLASS from scratch"

	"used to create extent0.seaside.dbf"

	^ (GsuGsDevKitBootstrap
		upgradeUserName: self upgradeUserName
			upgradeSymbolDictName: self upgradeSymbolDictName
			bootstrapGemStoneRelease: self _bootstrapRelease)
		bootstrapPostLoadClassList: self bootstrapPostLoadClassList;
		bootstrapRepositoryDirectory: self bootstrapRepositoryDirectory;
		bootstrapApplicationLoadSpecs: bootstrapApplicationLoadSpecs; 
		bootstrapExistingConfigurationList: self bootstrapExistingConfigurationList;
		bootstrapGsDevkit;
		yourself