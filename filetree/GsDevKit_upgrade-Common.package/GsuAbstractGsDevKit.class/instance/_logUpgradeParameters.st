logging
_logUpgradeParameters

	self log: '	session methods ', (GsPackagePolicy enabled ifTrue: [ '(enabled)' ] ifFalse: [ '(disabled)' ]).
	self _singletonUpgradeParameters do: [:selectorSymbol |
		self log: '	', selectorSymbol asString, ' : ', (self perform: selectorSymbol) ].

	self _listUpgradeParameters do: [:selectorSymbol |
		self log: '	', selectorSymbol asString, ' : '.
		[ (self perform: selectorSymbol) 
			do: [:entry | self log: '		', entry printString ] 
		] on: Error do: [:ex  | self log: '			error extracting parameter ', ex description printString ] ]