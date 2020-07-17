prepare gsdevkit  image
prepareGsDevKitImage_patch45952

	"bug 45952 ... image/bootstrapMaster.topaz for 3.1.0.6 ignored BootstrapSymbolDictionaryName"

	| ug |
	ug := self _currentUserGlobals.
	self upgradeSymbolDict == ug 
		ifTrue: [ 
			"not exposed to bug"
			^ self ].
	self upgradeSymbolDict size > 1
		ifTrue: [
			"not exposed to bug"
			^ self ].
	self 
		timeStampedLog: '	BootstrapSymbolDictionary ignored during initial bootstrap of GLASS into non-UserGlobals SymbolDictionary.';
		log: '	Transferring Behaviors from UserGlobals to ', self upgradeSymbolDictName printString;
		log: '		BEFORE upgrading seaside image.'.
	ug keys
	  do: [ :key | 
		| assoc |
		assoc := ug associationAt: key.
		assoc value isBehavior
		  ifTrue: [ 
			self upgradeSymbolDict addAssociation: assoc.
			ug removeAssociation: assoc ].
		self log: '	', key asString.
		System commit ].
	self log: '--- (commit)'