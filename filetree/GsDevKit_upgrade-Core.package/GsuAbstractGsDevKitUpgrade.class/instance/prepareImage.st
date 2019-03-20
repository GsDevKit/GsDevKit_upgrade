phases
prepareImage
	"prepare image for upgrade"

	"
		1. prepareImage
		2. prepareImage_pragma_user
		3. prepareImage_pragma_systemuser
		4. prepareImage_user
		5. prepareGsDevKitImage.
	"

	"run as system user"

	self prepareImageBanner.
	self log: 'Prepare image'.
	self sourceGemStoneRelease 
		prepareImage_pragmasFor: self;
		prepareImage_makeClassesObsolete: self;
		prepareImage_patches: self.
	self bannerLogDash.