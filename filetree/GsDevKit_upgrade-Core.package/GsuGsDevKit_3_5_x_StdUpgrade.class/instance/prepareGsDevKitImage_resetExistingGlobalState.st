prepare gsdevkit  image
prepareGsDevKitImage_resetExistingGlobalState

	"Reset and/or initialize any classes that may have invalid state carried over"

	self timeStampedLog: 'Prepare gsdevkit - reset existing global state'.

	(self _globalNamed: 'MCMockPackageInfo') initialize