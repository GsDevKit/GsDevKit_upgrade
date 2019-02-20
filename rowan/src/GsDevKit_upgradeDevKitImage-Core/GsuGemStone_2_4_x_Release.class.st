Class {
	#name : 'GsuGemStone_2_4_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'accessing' }
GsuGemStone_2_4_x_Release >> minor: anInteger [

	anInteger ~= 4 ifTrue: [ self error: 'GemStone version 2.', anInteger printString, ' not supported' ].
	super minor: anInteger
]
