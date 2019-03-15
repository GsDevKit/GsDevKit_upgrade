private
_clearMetacelloCaches

	"Metacello caches used in calculating default values for application load specs, so cache
		application load specs before clearing the Metacello cache"

	(self _glass1Loaded or: [ self _gsDevKitLoaded ])
		ifFalse: [ 
			"GLASS needs to have the caches cleared, since stale repository entries can cause trouble"
			self bootstrapApplicationLoadSpecs.
			super _clearMetacelloCaches ].