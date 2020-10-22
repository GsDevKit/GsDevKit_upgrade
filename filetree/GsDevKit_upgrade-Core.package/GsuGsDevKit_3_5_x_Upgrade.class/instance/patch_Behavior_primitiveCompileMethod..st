prepare image user
patch_Behavior_primitiveCompileMethod: category
	"Needed for installing GsdevKit/GLASS - should be run as System User"

	self
		timeStampedLog:
			'	patch Behavior >> _primitiveCompileMethod:symbolList:category:oldLitVars:intoMethodDict:intoCategories:intoPragmas:environmentId: in category '
				, category asString printString , ' as ' , System myUserProfile userId.
	(Behavior
		compileMethod: self _prepareImage_behavior_patchSource
		dictionaries: self upgradeUserProfile symbolList
		category: category) ifNotNil: [ :ar | self error: 'did not compile' ]