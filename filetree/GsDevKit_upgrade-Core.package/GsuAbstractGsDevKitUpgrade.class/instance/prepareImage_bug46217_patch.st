prepare image
prepareImage_bug46217_patch

	"patch needed: 3.2.0 thru 3.2.15, and 3.3.0 - should be run as SystemUser"

	| package symbolDict class theSymbolList |
	self timeStampedLog: '	patch MCGemStonePlatform >> removeClassFromSystem: (bug 46217)'.
	package := GsPackageLibrary packageNamed: #'Monticello_Globals'.
	symbolDict := package symbolDict.
	class := symbolDict at: #'MCGemStonePlatform'.
	theSymbolList := GsCurrentSession currentSession symbolList.
	(class
		compileMethod: self _prepareImage_mcgemstoneplatform_bug46217_patchSource 
		dictionaries: theSymbolList
		category:  'patch bug 46217') ifNotNil: [:ar | self error: 'did not compile' ].