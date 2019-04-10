private
_installSymDictInSymbolList
	| dictName symbolName session symbolList |

	dictName := 'GsDevKit_SymDict'.
	symbolName := dictName asSymbol.
	session := GsCurrentSession currentSession.
	symbolList := session symbolList.
	symbolList
		detect: [ :each | (each at: symbolName ifAbsent: [ nil ]) == each ]
		ifNone: [ 
			| theDict size |
			theDict := self _symbolDictionary ifNil: [
				SymbolDictionary new
					name: symbolName;
					objectSecurityPolicy: symbolList objectSecurityPolicy;
					yourself ].
			size := System myUserProfile symbolList size.
			System myUserProfile insertDictionary: theDict at: size + 1 ].