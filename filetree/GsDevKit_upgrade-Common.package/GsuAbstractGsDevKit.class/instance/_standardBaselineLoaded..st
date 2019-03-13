private
_standardBaselineLoaded: baselineClassName
	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
		(self _globalNamed: 'MetacelloProjectRegistration')
			ifNotNil: [ :cls | 
				(cls registrationForClassNamed: baselineClassName ifAbsent: [ ])
					ifNotNil: [ :registration | ^ registration loadedInImage ] ] ].
	^ false