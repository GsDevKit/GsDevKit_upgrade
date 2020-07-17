prepare gsdevkit  image
prepareGsDevKitImage_clearMetacelloCaches

	"GLASS needs to have the caches cleared, since stale repository entries can cause trouble"

	"Metacello caches used in calculating default values for application load specs, so cache
		application load specs before clearing the Metacello cache"

	self timeStampedLog: 'Prepare gsdevkit - clear Metacello caches'.

	self bootstrapApplicationLoadSpecs.
	(self _globalNamed: #MetacelloProjectRegistration)
	  ifNotNil: [:cl | cl _classVars at: #Registry put: nil ].
	System commit.

	self log: '	Metacello caches cleared (commit)'.