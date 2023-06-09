private
_moveClassNamed: className toNewSuperclassNamed: superclassName
	| definition oldClass newClass |
	oldClass := self upgradeSymbolDict at: className.
	definition := oldClass
		definitionWithClassName: className
		superClassName: superclassName.
	newClass := definition evaluate.
	newClass
		copyMethodsFrom: oldClass
		dictionaries: GsSession currentSession symbolList