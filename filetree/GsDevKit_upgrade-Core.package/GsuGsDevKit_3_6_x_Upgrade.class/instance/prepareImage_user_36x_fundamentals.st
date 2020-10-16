prepare image user
prepareImage_user_36x_fundamentals
	"patches needed to load GLASS for 3.6.x and later"

	self
		prepareImage_user_recompileSelfCanBeSpecialSessionMethods;
		prepareImage_user_patch_Class__mcDefinitionType