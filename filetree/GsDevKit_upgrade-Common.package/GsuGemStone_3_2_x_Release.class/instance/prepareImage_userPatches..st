prepare image user
prepareImage_userPatches: aGsDevKitUpgrade
	"Opportunity for target image to perform user-specific preparation"

	super prepareImage_userPatches: aGsDevKitUpgrade.
	(self patch >= 0 and: [ self patch <= 15 ])
		ifTrue: [
			"bug46217 patch needed: 3.2.0 thru 3.2.15, and 3.3.0"
			aGsDevKitUpgrade prepareImage_user_bug46217 ]