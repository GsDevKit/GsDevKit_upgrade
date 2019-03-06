private
_bootstrap_class_removeFromSystem_patchSource

	^  'removeFromSystem
  | ar |
ar := System myUserProfile dictionaryAndSymbolOf: self.
ar ifNotNil: [ (ar at: 1) removeKey: (ar at: 2) ].'