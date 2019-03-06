private
_clearMetacelloCaches

	"Wipe out the Metacello registry ... if it exists"

	(self _globalNamed: #MetacelloProjectRegistration)
	  ifNotNil: [:cl | cl _classVars at: #Registry put: nil ].