prepare gsdevkit  image
prepareGsDevKitImage_clearMetacelloCaches

	" clear caches - those that are unneeded or create problem during initial bootstrap load"

	self log: 'Prepare gsdevkit - clear Metacello caches'.

	self _clearMetacelloCaches.

	System commit.

	self log: '	Metacello caches cleared (commit)'.