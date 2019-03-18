private
_glassLoaded
	"GLASS is loaded when neither tODE, GLASS1, nor GsDevKit is loaded"

	^ (self _todeLoaded or: [ self _glass1Loaded or: [ self _gsDevKitLoaded ] ]) not