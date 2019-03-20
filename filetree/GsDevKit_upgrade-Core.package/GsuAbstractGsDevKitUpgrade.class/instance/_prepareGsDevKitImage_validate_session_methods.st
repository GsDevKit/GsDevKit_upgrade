private
_prepareGsDevKitImage_validate_session_methods
	"return list of session methos that need recompilation"

	| methodsNeedingRecompilation |
	methodsNeedingRecompilation := {}.
	System myUserProfile symbolList
		do: [ :dict | 
			| dName |
			dName := dict name ifNil: [ 'unnamed' ].
			(dict at: GsPackage globalName otherwise: nil)
				ifNotNil: [ :pkg | 
					pkg sessionMethods keysAndValuesDo: [ :class :ar | 
						| methodDict |
						methodDict := ar at: 1.
						methodDict values
							do: [ :meth | 
								meth needsRecompile
									ifTrue: [ methodsNeedingRecompilation add: meth ] ] ] ] ].
	^ methodsNeedingRecompilation