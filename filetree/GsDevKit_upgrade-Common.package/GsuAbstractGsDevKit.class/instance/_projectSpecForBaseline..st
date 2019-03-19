private
_projectSpecForBaseline: baselineClassName
	"Have to extract project spec from regsitry without sending messages, because methods may need to be recompiled"

	"should only apply when doing bootstrap loads"

	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
		(self _globalNamed: 'MetacelloProjectRegistration')
			ifNotNil: [ :cls | 
				| registry baselineRegistry |
				registry := cls _classVars at: #Registry.
				baselineRegistry := registry instVarAt: (registry class allInstVarNames indexOf: #baselineRegistry).
				(baselineRegistry at: baselineClassName ifAbsent: [ ] )
					ifNotNil: [ :registration | 
						^ registration instVarAt: (registration class allInstVarNames indexOf: #baselineProjectSpec). ] ] ].
	^ nil "calculate project spec at load time"