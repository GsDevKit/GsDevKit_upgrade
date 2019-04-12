prepare image user
prepareImage_user_patches

	"Needed for installing GsdevKit/GLASS - pre-load patch of a method needed to install user code
		will be overridden when GLASS/GLASS1/GsDevKit is installed"

	super prepareImage_user_patches.
	self log: '	patch Behavior class >> parseSelector:for:'.
	(Behavior class
		compileMethod: self _prepareImage_behavior_class_parseSelectorSource 
		dictionaries: self upgradeUserProfile symbolList 
		category:  '*core-squeak') ifNotNil: [:ar | self error: 'did not compile' ]