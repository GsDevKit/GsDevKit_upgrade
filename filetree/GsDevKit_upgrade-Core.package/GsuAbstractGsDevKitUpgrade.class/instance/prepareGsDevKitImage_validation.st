prepare gsdevkit  image
prepareGsDevKitImage_validation
	"verify that all methods visible to this user have been recompiled."

	| sessionMethodsNeedCompilation methodsNeedCompilation |
	self timeStampedLog: 'Prepare gsdevkit - validation'.

	System commit.

	sessionMethodsNeedCompilation := self _prepareGsDevKitImage_validate_session_methods.
	methodsNeedCompilation := self _prepareGsDevKitImage_validate_user_methods.
	
	sessionMethodsNeedCompilation isEmpty
		ifFalse: [
			self log: '	session methods that need recompilation:'.
			sessionMethodsNeedCompilation do: [:meth | self log: ' 	', meth printString ] ].

	methodsNeedCompilation isEmpty
		ifFalse: [
			self log: '	methods that need recompilation:'.
			methodsNeedCompilation do: [:meth | self log: ' 	', meth printString ] ].

	(sessionMethodsNeedCompilation isEmpty and: [ methodsNeedCompilation isEmpty ])
		ifFalse: [].

	self log: '	done with validation'