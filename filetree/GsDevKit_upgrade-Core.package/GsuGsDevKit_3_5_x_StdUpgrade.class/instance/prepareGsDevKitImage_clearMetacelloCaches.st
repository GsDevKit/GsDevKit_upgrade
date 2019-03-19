prepare gsdevkit  image
prepareGsDevKitImage_clearMetacelloCaches

	"GLASS needs to have the caches cleared, since stale repository entries can cause trouble during reload"

	self _glassLoaded
		ifTrue: [ 
			^ super prepareGsDevKitImage_clearMetacelloCaches ].
	"caches are used for reloading BaselineOf"
	self log: 'Prepare gsdevkit - Metacello caches NOT cleared'.