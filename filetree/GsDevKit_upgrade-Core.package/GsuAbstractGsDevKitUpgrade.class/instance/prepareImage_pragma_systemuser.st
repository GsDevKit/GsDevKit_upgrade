phases
prepareImage_pragma_systemuser
	"make old pragma class obsolete"

	"run as system user"

	"Part 3: make pragma class obsolete"

	self prepareImagePragmaSystemUserBanner.
	self log: 'Prepare image system user pragma'.
	self sourceGemStoneRelease 
		prepareImage_systemuserPragmaFor: self;
		yourself.
	self bannerLogDash.