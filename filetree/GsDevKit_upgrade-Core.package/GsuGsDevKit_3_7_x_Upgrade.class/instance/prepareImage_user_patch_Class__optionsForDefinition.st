prepare image user
prepareImage_user_patch_Class__optionsForDefinition
	"_optionsForDefinition replaced by _optionsStringForDefinition in 3.6. Not used during upgrade until 3.7.0. See _moveClassNamed:toNewSuperclassNamed:"

	self
		timeStampedLog:
			'	patch Class >> _optionsForDefinition in category *core' , ' as ' , System myUserProfile userId.
	[ 
	Class
		compileMethod: self _prepareImage_class__optionsForDefinition_patchSource
		category: '*core'
		using: self upgradeUserProfile symbolList ]
		onException: CompileError
		do: [ :ex | 
			self
				error:
					'Did not compile:
' , (GsNMethod _sourceWithErrors: ex errorDetails fromString: ex sourceString) ]