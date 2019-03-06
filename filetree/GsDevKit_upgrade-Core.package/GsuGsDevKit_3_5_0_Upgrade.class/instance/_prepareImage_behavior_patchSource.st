private
_prepareImage_behavior_patchSource

	^ '_primitiveCompileMethod: sourceString symbolList: aSymbolList category: categorySymbol oldLitVars: litVarArray intoMethodDict: aMethodDict intoCategories: aCategDict intoPragmas: ignored environmentId: environmentId
  ^ self
    _primitiveCompileMethod: sourceString
    symbolList: aSymbolList
    category: categorySymbol
    oldLitVars: litVarArray
    intoMethodDict: aMethodDict
    intoCategories: aCategDict
    environmentId: environmentId'