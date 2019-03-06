private
_standardBaselineLoaded: baselineClassName
self log: '_standardBaselineLoaded: ', baselineClassName.
	(self _globalNamed: baselineClassName)
		ifNotNil: [ 
self log: '	baseline class present'.
		(self _globalNamed: 'MetacelloProjectRegistration')
			ifNotNil: [ :cls | 
self log: '	MetacelloProjectRegistration class present'.
				(cls registrationForClassNamed: baselineClassName ifAbsent: [  self log: '	no registration'. nil])
					ifNotNil: [ :registration | 
| res | 
res := registration loadedInImage.
self log: '	registration loaded: ', res printString.
^res ] ] ].
	^ false