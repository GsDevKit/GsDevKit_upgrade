prepare image
prepareImage_patches: aGsDevKitUpgrade
	"Opportunity for target image to install any patches needed pre-upgrade"

	super prepareImage_patches: aGsDevKitUpgrade.
	(self patch >= 0 and: [ self patch <= 15 ])
		ifTrue: [
			"bug46217 patch needed: 3.2.0 thru 3.2.15, and 3.3.0"
			aGsDevKitUpgrade prepareImage_bug46217_patch ]