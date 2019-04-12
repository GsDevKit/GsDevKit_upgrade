Class {
	#name : 'GsuGsDevKit_3_5_x_Upgrade',
	#superclass : 'GsuAbstractGsDevKitUpgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_5_x_Upgrade class >> _calculateUpgradeClass [

	^ self
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_Upgrade >> _bootstrapRelease [

	^ GsuGemStone_3_5_x_Release major: 3 minor: 5 patch: self _patchRelease
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_Upgrade >> _defaultTargetRelease [

	^ GsuGemStone_3_5_x_Release major: 3 minor: 5
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_Upgrade >> _patchRelease [

	^ 0
]

{ #category : 'private' }
GsuGsDevKit_3_5_x_Upgrade >> _prepareImage_behavior_class_parseSelectorSource [

	^ 'parseSelector: methodString for: aBehavior
	| mDict cDict meth undefinedSymbolList |
	mDict := GsMethodDictionary new.
	cDict := GsMethodDictionary new.
	undefinedSymbolList := GsSession currentSession symbolList
		objectNamed: #''UndefinedSymbolList''.
	undefinedSymbolList == nil
		ifTrue: [ undefinedSymbolList := SymbolList new ].
	meth := aBehavior
		_primitiveCompileMethod: methodString
		symbolList: GsSession currentSession symbolList , undefinedSymbolList
		category: #''xxxyyz''
		oldLitVars: nil
		intoMethodDict: mDict
		intoCategories: cDict
		environmentId: 0.
	meth class ~~ GsNMethod
		ifTrue: [ 
			"if error slot is nil, then the method wasn''t compiled because of errors"
			(meth at: 2) == nil
				ifFalse: [ ^ nil ].
			meth := meth at: 1 ].
	^ meth selector asString'
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_x_Upgrade >> asBootstrapUpgrade [

	"All application methods in upgraded repository must be recompiled"

	"postLoadClassList is used in the bootstrap case"

	^ (GsuGsDevKit_3_5_x_BootstrapUpgrade 
			upgradeUserName: self upgradeUserName 
				upgradeSymbolDictName: self upgradeSymbolDictName 
				sourceGemStoneRelease: self sourceGemStoneRelease)
			bootstrapPostLoadClassList: self bootstrapPostLoadClassList;
			yourself
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_x_Upgrade >> asStandardUpgrade [

	"Application methods in upgraded repository do NOT need to recompiled"

	"postLoadClassList is not used in standard upgrade case"

	^ GsuGsDevKit_3_5_x_StdUpgrade 
		upgradeUserName: self upgradeUserName 
			upgradeSymbolDictName: self upgradeSymbolDictName 
			sourceGemStoneRelease: self sourceGemStoneRelease
]

{ #category : 'accessing' }
GsuGsDevKit_3_5_x_Upgrade >> minor [

	^ 5
]

{ #category : 'accessing' }
GsuGsDevKit_3_5_x_Upgrade >> patch [

	^ self _patchRelease
]

{ #category : 'prepare gsdevkit image' }
GsuGsDevKit_3_5_x_Upgrade >> prepareGsDevKitImage_user_patches [

	"Needed for installing GsdevKit/GLASS - pre-load patch of a method needed to install user code
		will be overridden when GLASS/GLASS1/GsDevKit is installed"

	super prepareGsDevKitImage_user_patches.
	self log: '	patch Behavior class >> parseSelector:for:'.
	(Behavior class
		compileMethod: self _prepareImage_behavior_class_parseSelectorSource 
		dictionaries: self upgradeUserProfile symbolList 
		category:  '*core-squeak') ifNotNil: [:ar | self error: 'did not compile' ]
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_x_Upgrade >> resolveForUpgrade [
	"determine which concrete upgrade class to use, base on source GemStone version"

	super resolveForUpgrade.
	^ self sourceGemStoneRelease resolveForUpgradeToGemStone350: self
]
