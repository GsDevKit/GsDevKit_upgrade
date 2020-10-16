perpare image user
prepareImage_userPatches: aGsDevKitUpgrade
	"Opportunity for target image to perform user-specific preparation"

	super prepareImage_userPatches: aGsDevKitUpgrade.
self halt.
	aGsDevKitUpgrade prepareImage_user_recompileSelfCanBeSpecialSessionMethods