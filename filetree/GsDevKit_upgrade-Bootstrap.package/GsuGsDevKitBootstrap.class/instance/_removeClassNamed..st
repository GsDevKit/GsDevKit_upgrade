private
_removeClassNamed: className

	self log: '	Attempt to remove ', className printString.
	(self _globalNamed: className)
		ifNotNil: [:theClass | 
			theClass subclasses isEmpty
				ifTrue: [
					(System myUserProfile dictionariesAndSymbolsOf: theClass ) 
						do: [:ar | 
							(ar at: 1) removeKey: (ar at: 2).
							self log: '		remove class named ', (ar at: 2) printString, ' from symbol dictionary ', (ar at: 1) name printString ] ]
				ifFalse: [ self log: '		DID NOT remove class named: ', className printString ] ]