prepare gsdevkit  image
prepareGsDevKitImage_patch_compileMethodCategory
	"patch only needed during standard upgrade ..."

	"will be overridden when Core package loaded"

	self log: '		Patching ...Behavior>>compileMethod:category:'.

	(Behavior
		compileMethod: self _prepareImage_behavior_compileMethod_Category_patchSource 
		dictionaries: self upgradeUserProfile symbolList 
		category: '*core-squeak') ifNotNil: [:ar | self error: 'did not compile' ].