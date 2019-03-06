phases
prepareImage_pragma
	"prepare pragmas for upgrade"

	"run as system user"

	"Part 1: set the stage for pragma upgrade"

	self prepareImagePragmaBanner.
	self log: 'Prepare image pragma'.
	self sourceGemStoneRelease 
		prepareImage_pragmaFor: self;
		yourself.
	self bannerLogDash.