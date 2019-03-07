instance creation
upgradeUserName: aString upgradeSymbolDictName: aSymbol sourceGemStoneRelease: sourceRelease

	^ (self new
			upgradeUserName: aString;
			upgradeSymbolDictName: aSymbol;
			yourself)
				sourceGemStoneRelease: sourceRelease;
				resolveForUpgrade