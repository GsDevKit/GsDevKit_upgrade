Class {
	#name : 'GsuGemStone_3_4_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgrade-Common'
}

{ #category : 'accessing' }
GsuGemStone_3_4_x_Release >> minor [

	^ minor ifNil: [ 4 ]
]

{ #category : 'prepare gsdevkit image' }
GsuGemStone_3_4_x_Release >> prepareGsDevKitImage_recompilePragmaMethods:  aGsDevKitUpgrade [

	"noop - Pragma class is in base"
]

{ #category : 'prepare image' }
GsuGemStone_3_4_x_Release >> prepareImage_makeClassesObsolete: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is already in the base"

	"noop"
	aGsDevKitUpgrade timeStampedLog: '	obsolete classes (noop)'.
]

{ #category : 'prepare image' }
GsuGemStone_3_4_x_Release >> prepareImage_patches: aGsDevKitUpgrade [
	"Opportunity for target image to install any patches needed pre-upgrade"

	aGsDevKitUpgrade timeStampedLog: 'Prepare image - patches'.
	aGsDevKitUpgrade prepareImage_patches.
]
