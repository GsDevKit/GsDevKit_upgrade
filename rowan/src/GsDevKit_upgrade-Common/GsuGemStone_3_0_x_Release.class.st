Class {
	#name : 'GsuGemStone_3_0_x_Release',
	#superclass : 'GsuAbstractGemStoneRelease',
	#category : 'GsDevKit_upgrade-Common'
}

{ #category : 'accessing' }
GsuGemStone_3_0_x_Release >> minor [

	^ minor ifNil: [ 0 ]
]

{ #category : 'initialization' }
GsuGemStone_3_0_x_Release >> resolveForUpgradeToGemStone360: aGsuGsDevKit_3_6_0_Upgrade [
	self
		error:
			'Upgrades to 3.6.x from ' , major asString , '.' , minor asString , '.'
				, self patch asString , ' is not supported'
]
