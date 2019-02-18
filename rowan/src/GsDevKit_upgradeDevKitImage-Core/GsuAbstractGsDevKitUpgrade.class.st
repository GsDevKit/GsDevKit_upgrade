"
I am the abstract upgrade driver for upgading GsDevKit/GLASS repositories.

I am invoked after the repository has undergone the standard 
`$GEMSTONE/bin/upgradeIage` step.

I am invoked by the `$GEMSTONE/upgrade/upgradeSeasideImage script.

There are three basic phases of thed GsDevKit/GLASS upgrade process:
	1. prepare image for upgrade.
	2. bootstrap the correct version of the GsDevKit/GLASS classes for the target
		 GemStone version.
	3. install application code

### Prepare image for upgrade
### Bootsrap GsDevKit/GLASS support classes
### Install application
 
"
Class {
	#name : 'GsuAbstractGsDevKitUpgrade',
	#superclass : 'Object',
	#instVars : [
		'upgradeUserName',
		'sourceGemStoneRelease',
		'targetGemStoneRelease'
	],
	#category : 'GsDevKit_upgradeDevKitImage-Core'
}

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade class >> gemstone_user [

	^ (System gemEnvironmentVariable: 'GEMSTONE_USER')
		ifNil: [ 'DataCurator' ]
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> sourceGemStoneRelease: sourceRelease [

	^ self new
		upgradeUserName: self gemstone_user;
		sourceGemStoneRelease: sourceRelease;
		yourself
]

{ #category : 'instance creation' }
GsuAbstractGsDevKitUpgrade class >> upgradeUserName: aString sourceGemStoneRelease: sourceRelease [

	^ self new
		upgradeUserName: aString;
		sourceGemStoneRelease: sourceRelease;
		yourself
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> _defaultTargetRelease [

	self subclassResponsibility: #_defaultTargetRelease
]

{ #category : 'private' }
GsuAbstractGsDevKitUpgrade >> gemstone_user [

	^ self class gemstone_user
]

{ #category : 'phases' }
GsuAbstractGsDevKitUpgrade >> prepareImage [
	"prepare image for upgrade"
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> sourceGemStoneRelease: aGsuGemStoneRelease [

	sourceGemStoneRelease := aGsuGemStoneRelease
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> targetGemStoneRelease [

	^ targetGemStoneRelease ifNil: [ targetGemStoneRelease := self _defaultTargetRelease ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserName [

	^ upgradeUserName ifNil: [ upgradeUserName := self gemstone_user ]
]

{ #category : 'accessing' }
GsuAbstractGsDevKitUpgrade >> upgradeUserName: aString [

	upgradeUserName := aString
]
