private
_prepareImage_user_removeSessionMethods

	self log: '		removing session methods'.
    System myUserProfile symbolList do:[:dict |
		| dName |
		dName := dict name ifNil:[ 'unnamed' ].
		(dict at: GsPackage globalName otherwise: nil) 
			ifNotNil:[:pkg |
				"SessionMethods rebuilt during upgradeImage"
				pkg name == #SessionMethods
					ifFalse:[ 
						pkg removeAllMethods .
						self log: '			', dName, ' GsPackage oop: [', pkg asOop asString, '] session methods removed all' ] ] ]