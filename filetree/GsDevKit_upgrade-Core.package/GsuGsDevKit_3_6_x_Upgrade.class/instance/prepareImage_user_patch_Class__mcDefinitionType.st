prepare image user
prepareImage_user_patch_Class__mcDefinitionType
	"'_nonInheritedOptions replaced by _optionsArrayForDefinition"

	self timeStampedLog: '	patch Class>>_mcDefinitionType'.
	[ 
	Class
		compileMethod: self _prepareImage_class__mcDefinitionType_source
		dictionaries: self upgradeUserProfile symbolList
		category: '*monticello'
		environmentId: 0 ]
		onException: CompileError
		do: [ :ex | 
			self
				error:
					'Did not compile:
' , (GsNMethod _sourceWithErrors: ex errorDetails fromString: ex sourceString) ]