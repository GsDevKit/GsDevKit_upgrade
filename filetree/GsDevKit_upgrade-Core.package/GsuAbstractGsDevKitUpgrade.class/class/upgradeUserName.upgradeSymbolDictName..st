instance creation
upgradeUserName: aString upgradeSymbolDictName: aSymbol 

	^ self _calculateUpgradeClass
		upgradeUserName: aString 
		upgradeSymbolDictName: aSymbol 
		sourceGemStoneRelease: self _calculatePreviousRelease