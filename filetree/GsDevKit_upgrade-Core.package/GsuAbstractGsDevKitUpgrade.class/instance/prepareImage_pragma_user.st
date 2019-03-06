phases
prepareImage_pragma_user
	"prepare pragmas for upgrade"

	"run as gsdevkit user"

	"Part 2: collect methods that refrence the obsolete pragma class or have pragmas that 
		need to be recomputed and need to be recompiled"

	self prepareImagePragmaUserBanner.
	self log: 'Prepare image user pragma'.
	self sourceGemStoneRelease 
		prepareImage_userPragmaFor: self;
		yourself.
	self bannerLogDash.