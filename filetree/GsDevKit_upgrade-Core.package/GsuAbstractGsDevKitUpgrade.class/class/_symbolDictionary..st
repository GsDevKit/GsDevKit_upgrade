private
_symbolDictionary: aSymbolDictionary
	"Install classes in a separate symbol dictionary, so the cleasses can be easily installed/removed in/from an image"

	((AllUsers userWithId: 'SystemUser') objectNamed: #UserGlobals) at: self _globalName put: aSymbolDictionary.
	TheSymbolDictionary:= aSymbolDictionary