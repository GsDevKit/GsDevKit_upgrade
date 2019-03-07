private
_calculateUpgradeClass

	| currentGemStoneVersionInt |
	currentGemStoneVersionInt := GsPackagePolicy perform: #'_originVersion'.
	currentGemStoneVersionInt = 35
		ifTrue: [ ^ GsuGsDevKit_3_5_x_Upgrade ].
	self error: 'Upgrades to ', (System gemVersionReport at: 'gsVersion') printString, ' are not currently supported.'