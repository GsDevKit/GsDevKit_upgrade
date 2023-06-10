private
_prepareImage_class__optionsForDefinition_patchSource

	^  '_optionsForDefinition
  "in 3.6 Class>>_optionsForDefinition was replaced by Class>>_optionsStringForDefinition ... in 3.7, this became a problem. Both are in the Core package"
	^ self _optionsStringForDefinition'