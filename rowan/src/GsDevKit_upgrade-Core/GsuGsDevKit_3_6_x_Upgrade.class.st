Class {
	#name : 'GsuGsDevKit_3_6_x_Upgrade',
	#superclass : 'GsuGsDevKit_3_5_x_StdUpgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_6_x_Upgrade >> _bootstrapRelease [
	self error: 'bootstrap upgrades to 3.6.x is not supported'
]

{ #category : 'private' }
GsuGsDevKit_3_6_x_Upgrade >> _defaultTargetRelease [

	^ GsuGemStone_3_6_x_Release major: 3 minor: 6  patch: self _patchRelease
]

{ #category : 'private' }
GsuGsDevKit_3_6_x_Upgrade >> _prepareImage_class__mcDefinitionType_source [
^' _mcDefinitionType
 | type opts superC |
  superC := self superClass.
  self isBytes
    ifTrue: [ type := #''bytes'' ]
    ifFalse: [ 
      self _portableIsIndexable
        ifTrue: [ type := #''variable'' ]
        ifFalse: [ type := #''normal'' ] ].
  opts := self _optionsArrayForDefinition.
  ^ opts size > 0
    ifTrue: [ 
      {type.
      opts} ]
    ifFalse: [ type ]'
]

{ #category : 'initialization' }
GsuGsDevKit_3_6_x_Upgrade >> asBootstrapUpgrade [
	self error: 'Bootstrap upgrades not supported for GemStone 3.6.x'
]

{ #category : 'initialization' }
GsuGsDevKit_3_6_x_Upgrade >> asStandardUpgrade [

	"Application methods in upgraded repository do NOT need to recompiled"

	"postLoadClassList is not used in standard upgrade case"

	^ self
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_6_x_Upgrade >> prepareImage_user_36x_fundamentals [
	"patches needed to load GLASS for 3.6.x and later"

	self
		prepareImage_user_recompileSelfCanBeSpecialSessionMethods;
		prepareImage_user_patch_Class__mcDefinitionType
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_6_x_Upgrade >> prepareImage_user_patch_Class__mcDefinitionType [
	"'_nonInheritedOptions replaced by _optionsArrayForDefinition"

	self timeStampedLog: '	patch Class>>_mcDefinitionType'.
	[ 
	Class
		compileMethod: self _prepareImage_class__mcDefinitionType_source
		category: '*monticello'
		using: self upgradeUserProfile symbolList ]
		onException: CompileError
		do: [ :ex | 
			self
				error:
					'Did not compile:
' , (GsNMethod _sourceWithErrors: ex errorDetails fromString: ex sourceString) ]
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_6_x_Upgrade >> prepareImage_user_recompileSelfCanBeSpecialSessionMethods [
	"Needed for installing GsdevKit/GLASS, 3.6.x and later"

	self
		timeStampedLog:
			'	recompile extension methods in Date DateAndTimeANSI DateAndTime ScaledDecimal Time (classes with selfCanBeSpecial option)'.
	GsPackagePolicy currentOrNil
		ifNotNil: [ :pp | 
			{Date.
			DateAndTimeANSI.
			DateAndTime.
			ScaledDecimal.
			Time}
				do: [ :class | 
					{class.
					(class class)}
						do: [ :beh | 
							| categ dictsArray mDict cDict |
							dictsArray := pp
								methodAndCategoryDictionaryFor: beh
								source: 'youself'
								dictionaries: GsCurrentSession currentSession symbolList
								category: categ.
							mDict := dictsArray at: 1.
							cDict := dictsArray at: 2.
							mDict
								valuesDo: [ :meth | meth recompileIntoMethodDict: mDict intoCategories: cDict symbolList: nil ] ] ] ]
]

{ #category : 'initialization' }
GsuGsDevKit_3_6_x_Upgrade >> resolveForUpgrade [
	"determine which concrete upgrade class to use, base on source GemStone version"

	super resolveForUpgrade.
	^ self sourceGemStoneRelease resolveForUpgradeToGemStone360: self
]
