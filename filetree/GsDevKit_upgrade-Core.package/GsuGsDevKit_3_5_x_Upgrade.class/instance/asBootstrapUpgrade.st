initialization
asBootstrapUpgrade

	"All application methods in upgraded repository must be recompiled"

	"postLoadClassList is used in the bootstrap case"

	^ (GsuGsDevKit_3_5_x_BootstrapUpgrade 
			upgradeUserName: self upgradeUserName 
				upgradeSymbolDictName: self upgradeSymbolDictName 
				sourceGemStoneRelease: self sourceGemStoneRelease)
			bootstrapPostLoadClassList: self bootstrapPostLoadClassList;
			yourself