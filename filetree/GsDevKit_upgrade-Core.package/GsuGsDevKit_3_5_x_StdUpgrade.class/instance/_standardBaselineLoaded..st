private
_standardBaselineLoaded: baselineClassName
	"message-based implmentation since methods do not need recompilation"

	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
			(self _globalNamed: 'MetacelloProjectRegistration')
				ifNotNil: [ :cls | 
					(cls registrationForClassNamed: baselineClassName ifAbsent: [ ])
						ifNotNil: [ :registration | ^ registration loadedInImage ] ] ].
	^ false