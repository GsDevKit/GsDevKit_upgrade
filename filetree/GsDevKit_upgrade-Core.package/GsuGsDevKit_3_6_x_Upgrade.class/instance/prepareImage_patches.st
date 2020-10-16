prepare image
prepareImage_patches
	"Needed for installing GsdevKit/GLASS - should be run as System User"

	true
		ifTrue: [ 
			self
				timeStampedLog:
					'	skip Behavior >> _primitiveCompileMethod:symbolList:category:oldLitVars:intoMethodDict:intoCategories:intoPragmas:environmentId: patch' ]
		ifFalse: [ super prepareImage_patches ]