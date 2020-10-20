perpare image user
prepareImage_userPatches: aGsDevKitUpgrade
	"In 3.5, some Metacello methods were added to base image during 3.6.x upgrade, the methods are being removed.
		For those methods that hadn't been changed, session method overrides were not created, and some of the methods
		are used during upgradeSeasideImage, so they need to be replaced"

	super prepareImage_userPatches: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_user_patch_35x_Metacello