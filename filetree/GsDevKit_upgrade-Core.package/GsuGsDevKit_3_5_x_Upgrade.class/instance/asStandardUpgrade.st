initialization
asStandardUpgrade

	"Application methods in upgraded repository do NOT need to recompiled"

	"postLoadClassList is not used in standard upgrade case"

	^ GsuGsDevKit_3_5_x_StdUpgrade 
		upgradeUserName: self upgradeUserName 
			upgradeSymbolDictName: self upgradeSymbolDictName 
			sourceGemStoneRelease: self sourceGemStoneRelease