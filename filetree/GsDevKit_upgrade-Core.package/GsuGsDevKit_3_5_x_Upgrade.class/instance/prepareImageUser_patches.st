prepare image user
prepareImageUser_patches
	"Needed for installing GsdevKit/GLASS - should be run as System User"

	super prepareImage_patches.
	self
		timeStampedLog:
			'	patch Behavior >> _primitiveCompileMethod:symbolList:category:oldLitVars:intoMethodDict:intoCategories:intoPragmas:environmentId:'.
	(Behavior
		compileMethod: self _prepareImage_behavior_patchSource
		dictionaries: self upgradeUserProfile symbolList
		category: '*core')
		ifNotNil: [ :ar | self error: 'did not compile' ]