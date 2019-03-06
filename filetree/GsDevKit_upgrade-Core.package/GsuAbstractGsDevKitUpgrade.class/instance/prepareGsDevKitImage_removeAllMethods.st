prepare gsdevkit  image
prepareGsDevKitImage_removeAllMethods

	"remove all methods in GsDevKit user classes"

	self log: 'Prepare gsdevkit - remove all methods'.

	self upgradeSymbolDict valuesDo: [:global |
		global isBehavior
			ifTrue: [ 
				global removeAllMethods.
				global class removeAllMethods ] ].

	System commit.

	self log: '	methods removed (commit)'.