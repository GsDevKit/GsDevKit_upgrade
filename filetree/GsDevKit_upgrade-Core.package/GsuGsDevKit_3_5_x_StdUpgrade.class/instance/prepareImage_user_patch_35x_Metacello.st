prepare image user
prepareImage_user_patch_35x_Metacello
	"In 3.5, some Metacello methods were added to base image during 3.6.x upgrade, the methods are being removed.
		For those methods that hadn't been changed, session method overrides were not created, and some of the methods
		are used during upgradeSeasideImage, so they need to be replaced"

	(Collection
		compileMethod:
			'setLoadsInMetacelloProject: aMetacelloPackageSpec
	aMetacelloPackageSpec setLoads: self asArray'
		dictionaries: self upgradeUserProfile symbolList
		category: '*metacello-mc') ifNotNil: [ :ar | self error: 'Collection>>setLoadsInMetacelloProject: did not compile' ].
	(String
		compileMethod:
			'setLoadsInMetacelloProject: aMetacelloPackageSpec
	aMetacelloPackageSpec setLoads: {self}'
		dictionaries: self upgradeUserProfile symbolList
		category: '*metacello-mc') ifNotNil: [ :ar | self error: 'String>>setLoadsInMetacelloProject: did not compile' ].