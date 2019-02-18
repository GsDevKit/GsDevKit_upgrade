Class {
	#name : 'GsuAbstractGemStoneRelease',
	#superclass : 'Object',
	#instVars : [
		'major',
		'minor',
		'patch'
	],
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'private' }
GsuAbstractGemStoneRelease class >> _classForMajorVersion: major minorVersion: minor [

	major ~= 3 ifTrue: [ self error: 'GemStone version ', major printString, ' not supported' ].
	minor < 2 ifTrue: [ self error: 'GemStone version ', major printString, '.', minor printString , ' not supported' ].
	^{
		nil.
		GsuGemStone_3_2_x_Release.
		GsuGemStone_3_3_x_Release.
		GsuGemStone_3_4_x_Release.
		GsuGemStone_3_5_x_Release.
	} at: minor
]

{ #category : 'instance creation' }
GsuAbstractGemStoneRelease class >> major: major minor: minor [

	^ (self _classForMajorVersion: major minorVersion: minor) new
		major: major;
		minor: minor;
		yourself
]

{ #category : 'instance creation' }
GsuAbstractGemStoneRelease class >> major: major minor: minor patch: patch [

	^ (self _classForMajorVersion: major minorVersion: minor) new
		major: major;
		minor: minor;
		patch: patch asInteger;
		yourself
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> major [

	^ major
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> major: anInteger [

	major := anInteger
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> minor [

	^ minor
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> minor: anInteger [

	minor := anInteger
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> patch [

	^ patch ifNil: [ 0 ]
]

{ #category : 'accessing' }
GsuAbstractGemStoneRelease >> patch: anInteger [

	patch := anInteger
]

{ #category : 'initialization' }
GsuAbstractGemStoneRelease >> resolveForUpgradeToGemStone350: aGsuGsDevKit_3_5_0_Upgrade [

	^ aGsuGsDevKit_3_5_0_Upgrade asStandardUpgrade
]
