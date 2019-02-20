Class {
	#name : 'GsuGemStone_3_3_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'prepare image' }
GsuGemStone_3_3_x_Release >> prepareImage_makeClassesObsolete: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class  must be obsoleted"

	super prepareImage_makeClassesObsolete: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_makeClassObsolete: 'Pragma' in: aGsDevKitUpgrade upgradeSymbolDict
]

{ #category : 'prepare image' }
GsuGemStone_3_3_x_Release >> prepareImage_patches: aGsDevKitUpgrade [
	"Opportunity for target image to install any patches needed pre-upgrade"

	super prepareImage_patches: aGsDevKitUpgrade.
	self patch = 0
		ifTrue: [
			"bug46217 patch needed: 3.2.0 thru 3.2.15, and 3.3.0"
			aGsDevKitUpgrade prepareImage_bug46217_patch ]
]

{ #category : 'prepare image' }
GsuGemStone_3_3_x_Release >> prepareImage_pragmasFor: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is in the base, and the old Pragma class is be obsoleted,
		so we need to collect all of the methods that have pragmas and then recompile them 
		to use the new Pragma class ... when we are ready. "

	super prepareImage_pragmasFor: aGsDevKitUpgrade.
	aGsDevKitUpgrade prepareImage_pragmas
]

{ #category : 'prepare image user' }
GsuGemStone_3_3_x_Release >> prepareImage_userPatches: aGsDevKitUpgrade [

	super prepareImage_userPatches: aGsDevKitUpgrade.
	self patch = 0
		ifTrue: [
			"bug46217 patch needed: 3.2.0 thru 3.2.15, and 3.3.0"
			aGsDevKitUpgrade prepareImage_user_bug46217 ]
]
