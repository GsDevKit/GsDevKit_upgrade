Class {
	#name : 'GsuGsDevKit_3_6_x_Upgrade',
	#superclass : 'GsuGsDevKit_3_5_x_StdUpgrade',
	#category : 'GsDevKit_upgrade-Core'
}

{ #category : 'private' }
GsuGsDevKit_3_6_x_Upgrade >> _bootstrapRelease [
	self error: 'bootstrap upgrades to ', self _baseVersion, 'x is not supported'
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

{ #category : 'accessing' }
GsuGsDevKit_3_6_x_Upgrade >> minor [

	^ 6
]

{ #category : 'prepare gsdevkit  image' }
GsuGsDevKit_3_6_x_Upgrade >> prepareGsDevKitImage_cleanSessionMethodMetaData [
	"remove all instances of GsMethod from session method packages"

	"noop - 3.6.x and beyond cannot be upgraded from releases earlier than 3.3.x"
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_6_x_Upgrade >> prepareImage_user_36x_fundamentals [
	"patches needed to load GLASS for 3.6.x and later"

	self
		prepareImage_user_recompileSelfCanBeSpecialSessionMethods;
		prepareImage_user_patch_Class__mcDefinitionType
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_6_x_Upgrade >> prepareImage_user_patch_35x_Metacello [
	"In 3.5, some Metacello methods were added to base image during 3.6.x upgrade, the methods are being removed.
		For those methods that hadn't been changed, session method overrides were not created, and some of the methods
		are used during upgradeSeasideImage, so they need to be replaced"

	self timeStampedLog: '	patch Collection>>setLoadsInMetacelloProject:'.
	(Collection
		compileMethod:
			'setLoadsInMetacelloProject: aMetacelloPackageSpec
	aMetacelloPackageSpec setLoads: self asArray'
		dictionaries: self upgradeUserProfile symbolList
		category: '*metacello-mc') ifNotNil: [ :ar | self error: 'Collection>>setLoadsInMetacelloProject: did not compile' ].
	self timeStampedLog: '	patch String>>setLoadsInMetacelloProject:'.
	(String
		compileMethod:
			'setLoadsInMetacelloProject: aMetacelloPackageSpec
	aMetacelloPackageSpec setLoads: {self}'
		dictionaries: self upgradeUserProfile symbolList
		category: '*metacello-mc') ifNotNil: [ :ar | self error: 'String>>setLoadsInMetacelloProject: did not compile' ].
]

{ #category : 'prepare image user' }
GsuGsDevKit_3_6_x_Upgrade >> prepareImage_user_patch_Class__mcDefinitionType [
	"'_nonInheritedOptions replaced by _optionsArrayForDefinition"

	self timeStampedLog: '	patch Class>>_mcDefinitionType'.
	[ 
	Class
		compileMethod: self _prepareImage_class__mcDefinitionType_source
		dictionaries: self upgradeUserProfile symbolList
		category: '*monticello'
		environmentId: 0 ]
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
								valuesDo: [ :meth | 
									meth
										recompileIntoMethodDict: mDict
										intoCategories: cDict
										symbolList: GsCurrentSession currentSession symbolList ] ] ] ]
]

{ #category : 'initialization' }
GsuGsDevKit_3_6_x_Upgrade >> resolveForUpgrade [
	"determine which concrete upgrade class to use, base on source GemStone version"

	super resolveForUpgrade.
	^ self sourceGemStoneRelease resolveForUpgradeToGemStone360: self
]
