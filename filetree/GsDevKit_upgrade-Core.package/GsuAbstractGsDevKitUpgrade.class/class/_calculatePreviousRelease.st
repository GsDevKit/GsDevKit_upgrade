private
_calculatePreviousRelease

	| previousGemStoneVersionInt |
	previousGemStoneVersionInt := GsPackagePolicy perform: #'_previousVersion'.
	previousGemStoneVersionInt = 35
		ifTrue: [ ^ GsuGemStone_3_5_x_Release new ].
	previousGemStoneVersionInt = 34
		ifTrue: [ ^ GsuGemStone_3_4_x_Release new ].
	previousGemStoneVersionInt = 33
		ifTrue: [ ^ GsuGemStone_3_3_x_Release new ].
	previousGemStoneVersionInt = 32
		ifTrue: [ ^ GsuGemStone_3_2_x_Release new ].
	self error: 'Upgrades from GemStone versions earlier than 3.2.0', ' are not currently supported.'