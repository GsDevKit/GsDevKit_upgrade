Class {
	#name : 'GsuGsDevKit_3_5_x_Upgrade',
	#superclass : 'GsuAbstractGsDevKitUpgrade',
	#category : 'GsDevKit_upgrade-Core'
}

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
GsuGsDevKit_3_5_x_Upgrade >> _prepareImage_behavior_patchSource [

	^ '_primitiveCompileMethod: sourceString symbolList: aSymbolList category: categorySymbol oldLitVars: litVarArray intoMethodDict: aMethodDict intoCategories: aCategDict intoPragmas: ignored environmentId: environmentId
  ^ self
    _primitiveCompileMethod: sourceString
    symbolList: aSymbolList
    category: categorySymbol
    oldLitVars: litVarArray
    intoMethodDict: aMethodDict
    intoCategories: aCategDict
    environmentId: environmentId'
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_x_Upgrade >> asBootstrapUpgrade [

	"All application methods in upgraded repository must be recompiled"

	"postLoadClassList is used in the bootstrap case"

	^ (GsuGsDevKit_3_5_x_BootstrapUpgrade upgradeUserName: self upgradeUserName sourceGemStoneRelease: self sourceGemStoneRelease)
			bootstrapPostLoadClassList: self bootstrapPostLoadClassList;
			yourself
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_x_Upgrade >> asStandardUpgrade [

	"Application methods in upgraded repository do NOT need to recompiled"

	"postLoadClassList is not used in standard upgrade case"

	^ GsuGsDevKit_3_5_x_StdUpgrade upgradeUserName: self upgradeUserName sourceGemStoneRelease: self sourceGemStoneRelease
]

{ #category : 'prepare image' }
GsuGsDevKit_3_5_x_Upgrade >> prepareImage_patches [

	"Needed for installing GsdevKit/GLASS - should be run as System User"

	super prepareImage_patches.
	self log: '	patch Behavior >> _primitiveCompileMethod:symbolList:category:oldLitVars:intoMethodDict:intoCategories:intoPragmas:environmentId:'.
	(Behavior
		compileMethod: self _prepareImage_behavior_patchSource 
		dictionaries: self upgradeUserProfile symbolList 
		category:  '*Core35x') ifNotNil: [:ar | self error: 'did not compile' ]
]

{ #category : 'initialization' }
GsuGsDevKit_3_5_x_Upgrade >> resolveForUpgrade [
	"determine which concrete upgrade class to use, base on source GemStone version"

	super resolveForUpgrade.
	^ self sourceGemStoneRelease resolveForUpgradeToGemStone350: self
]
