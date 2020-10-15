private
_calculateUpgradeClass
	| imageVersion |
	imageVersion := ImageVersion at: #'gsVersion'.
	(imageVersion beginsWith: '3.5')
		ifTrue: [ ^ GsuGsDevKit_3_5_x_Upgrade ].
	(imageVersion beginsWith: '3.6')
		ifTrue: [ ^ GsuGsDevKit_3_6_x_Upgrade ].
	self error: 'Image version ' , imageVersion printString , ' not supported'