private
_symbolDictionary
	"Install classes in a separate symbol dictionary, so the cleasses can be easily installed/removed in/from an image"

	^ TheSymbolDictionary ifNil: [ TheSymbolDictionary :=	((AllUsers userWithId: 'SystemUser') objectNamed: #UserGlobals) at: self _globalName ifAbsent: [] ].