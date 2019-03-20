private
_prepareGsDevKitImage_validate_user_methods
	"return list of methos in upgrade symbol dictionary that need recompilation"

	| methodsNeedingRecompilation |
	methodsNeedingRecompilation := {}.
	self upgradeSymbolDict valuesDo: [:global |
		global isBehavior
			ifTrue: [ 
				(global persistentMethodDictForEnv: 0) 
					ifNotNil: [:methodDict | methodDict values do: [:meth |
						meth needsRecompile
							ifTrue: [ methodsNeedingRecompilation add: meth ] ] ].
				(global class persistentMethodDictForEnv: 0) 
					ifNotNil: [:methodDict | methodDict values do: [:meth |
						meth needsRecompile
							ifTrue: [ methodsNeedingRecompilation add: meth ] ] ] ] ].
	^ methodsNeedingRecompilation