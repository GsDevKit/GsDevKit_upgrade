Class {
	#name : 'GsuGemStone_3_0_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgrade-Common'
}

{ #category : 'accessing' }
GsuGemStone_3_0_x_Release >> minor [

	^ minor ifNil: [ 0 ]
]
