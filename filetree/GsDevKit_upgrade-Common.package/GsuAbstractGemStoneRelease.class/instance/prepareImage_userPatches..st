perpare image user
prepareImage_userPatches: aGsDevKitUpgrade
	"Opportunity for target image to perform user-specific preparation"

	aGsDevKitUpgrade 
		timeStampedLog: 'Prepare image user - patches';
		prepareImage_user_removeSessionMethods;
		prepareImage_user_bug46059