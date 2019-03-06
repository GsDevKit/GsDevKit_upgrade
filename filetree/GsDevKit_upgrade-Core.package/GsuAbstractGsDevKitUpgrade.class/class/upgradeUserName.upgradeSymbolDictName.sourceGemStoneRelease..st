instance creation
upgradeUserName: aString upgradeSymbolDictName: aSymbol sourceGemStoneRelease: sourceRelease

	^ (self
			upgradeUserName: aString
				upgradeSymbolDictName: aSymbol)
			sourceGemStoneRelease: sourceRelease;
			resolveForUpgrade