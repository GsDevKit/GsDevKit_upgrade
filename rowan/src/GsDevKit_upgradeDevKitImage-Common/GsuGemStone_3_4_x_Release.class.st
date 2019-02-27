Class {
	#name : 'GsuGemStone_3_4_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgradeDevKitImage-Common'
}

{ #category : 'prepare gsdevkit image' }
GsuGemStone_3_4_x_Release >> prepareGsDevKitImage_recompilePragmaMethods:  aGsDevKitUpgrade [

	"noop - Pragma class is in base"
]

{ #category : 'prepare image' }
GsuGemStone_3_4_x_Release >> prepareImage_makeClassesObsolete: aGsDevKitUpgrade [
	"In 3.4.0, the Pragma class is already in the base"

	"noop"
]
