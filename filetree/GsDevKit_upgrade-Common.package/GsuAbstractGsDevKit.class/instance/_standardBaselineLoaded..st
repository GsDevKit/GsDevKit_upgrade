private
_standardBaselineLoaded: baselineClassName
	"Have to extract information from regsitry without sending messages, because methods may need to be recompiled"

	"see subclass implementation for message-based implementation"

	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
		(self _globalNamed: 'MetacelloProjectRegistration')
			ifNotNil: [ :cls | 
				| registry baselineRegistry |
				registry := cls _classVars at: #Registry.
				baselineRegistry := registry instVarAt: (registry class allInstVarNames indexOf: #baselineRegistry).
				(baselineRegistry at: baselineClassName ifAbsent: [ ])
					ifNotNil: [ :registration | 
						(registration instVarAt:  (registration class allInstVarNames indexOf: #loadedInImage)) == true ] ] ].
	^ false